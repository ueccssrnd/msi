package trend.libraries;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

public class Utilities {

    public ArrayList<ArrayList<String>> resultSetToArrayList(ResultSet resultset)
            throws SQLException {
        ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();

        ResultSetMetaData meta = resultset.getMetaData();
        int numcols = meta.getColumnCount();

        while (resultset.next()) {
            ArrayList<String> row = new ArrayList<String>(numcols); // new list
                                                                    // per row
            int i = 1;
            while (i <= numcols) { // don't skip the last column, use <=
                row.add(resultset.getString(i++));
            }
            results.add(row); // add it to the result
        }

        return results;
    }
}
