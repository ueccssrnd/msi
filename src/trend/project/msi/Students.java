package trend.project.msi;

import java.sql.SQLException;
import java.util.ArrayList;

import trend.libraries.DatabaseWrapper;

public class Students {
    DatabaseWrapper db = new DatabaseWrapper(
            "jdbc:postgresql://localhost:5432/", "msi", "postgres",
            "YOURPASSWORDHERE", "org.postgresql.Driver");

    public Students() throws SQLException {
        this.db.open();
    }

    public Boolean login(String username, String password) throws SQLException {
        return this.db.numRows("SELECT id FROM students WHERE username='"
                + username + "' AND password='" + password + "'") > 0 ? true
                : false;
    }

    public ArrayList<ArrayList<String>> view(int student_id)
            throws SQLException {

        String query = "";
        query = "SELECT * FROM students WHERE id=" + student_id;

        return this.db.fetchAll(query);
    }

    public ArrayList<ArrayList<String>> read() throws SQLException {

        String query = "";
        query = "SELECT * FROM students ORDER BY id";
        return this.db.fetchAll(query);
    }

    public void create(String username, String password, String email)
            throws SQLException {
        String query = "INSERT INTO students (username, password, email) VALUES ('"
                + username + "', '" + password + "', '" + email + "')";
        this.db.execute(query);
    }

    public void delete(int id) throws SQLException {
        String query = "DELETE FROM students WHERE id=" + id + "";
        this.db.execute(query);
    }

    public ArrayList<ArrayList<String>> search(String key) throws SQLException {
        String query = "";
        query = "SELECT * FROM students WHERE name LIKE '" + key + "%'";
        return this.db.fetchAll(query);
    }

    public void update(String key, String value, int id) throws SQLException {
        String query = "UPDATE students SET " + key + "='" + value
                + "' WHERE id=" + id + "";
        this.db.execute(query);
    }

    public void deleteRecord(String studnum) throws SQLException {
        this.db.open();
        String deleteQuery = "DELETE FROM students where student_number = '"
                + studnum + "'";
        this.db.execute(deleteQuery);
    }

    public void updateStudent(String studnum, int q1, int q2, int q3, int prelim)
            throws SQLException {
        this.db.open();
        String updateQuery = "UPDATE students SET q1 = " + q1 + ", q2 = " + q2
                + ", q3 = " + q3 + ", prelim = " + prelim
                + " WHERE student_number = '" + studnum + "'";
        this.db.execute(updateQuery);
    }

}
