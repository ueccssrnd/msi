package trend.libraries;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Connectable {
    public void open() throws SQLException;

    public void close() throws SQLException;

    public boolean execute(String query) throws SQLException;

    public String fetch(String query) throws SQLException;

    public ArrayList<ArrayList<String>> fetchAll(String query)
            throws SQLException;
}
