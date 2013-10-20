package trend.libraries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DatabaseWrapper implements Connectable {

    private Connection conn = null;
    private String dbdriver;
    private String dbname;
    private String dbuser;
    private String dbpass;
    private String dblib;

    public DatabaseWrapper(String driver, String dbname, String dbuser,
            String dbpass, String dblib) {
        this.dbdriver = driver;
        this.dbname = dbname;
        this.dbuser = dbuser;
        this.dbpass = dbpass;
        this.dblib = dblib;
    }

    public Connection getConnection() {
        return this.conn;
    }

    @Override
    public void open() throws SQLException {
        try {
            Class.forName(this.dblib).newInstance();
            this.conn = DriverManager.getConnection(
                    this.dbdriver + this.dbname, this.dbuser, this.dbpass);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void close() throws SQLException {
        this.conn.close();
    }

    @Override
    public boolean execute(String query) throws SQLException {
        PreparedStatement stmt = this.conn.prepareStatement(query);
        if (stmt.executeUpdate() > 0) {
            this.close();
            return true;
        }
        return false;
    }

    @Override
    public String fetch(String query) throws SQLException {
        String result = "";
        PreparedStatement stmt = this.conn.prepareStatement(query);
        ResultSet results = stmt.executeQuery();
        if (results.next()) {
            result = results.getString(1);
        } else {
            result = null;
        }
        return result;
    }

    @Override
    public ArrayList<ArrayList<String>> fetchAll(String query)
            throws SQLException {

        ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();

        PreparedStatement stmt = this.conn.prepareStatement(query);
        ResultSet resultset = stmt.executeQuery();

        Utilities util = new Utilities();
        results = util.resultSetToArrayList(resultset);
        return results;
    }

    public int numRows(String query) throws SQLException {
        ArrayList<ArrayList<String>> results = this.fetchAll(query);

        return results.size();
    }

    public ArrayList<ArrayList<String>> newFetchAll(String query, Object[] args)
            throws SQLException {
        ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
        PreparedStatement stmt = this.conn.prepareStatement(query);
        if (args != null) {
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i + 1, args[i]);
            }
        }
        ResultSet resultset = stmt.executeQuery();
        Utilities util = new Utilities();
        results = util.resultSetToArrayList(resultset);

        return results;
    }

}
