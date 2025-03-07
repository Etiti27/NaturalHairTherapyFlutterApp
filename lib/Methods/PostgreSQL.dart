import 'package:natural_hair_therapist/imports.dart';
import 'package:postgres/postgres.dart';

class DatabaseService {
  final String _host = dotenv.env['DB_HOST'] ?? 'localhost';
  final String _dbPassword = dotenv.env['DB_PASSWORD'] ?? '';
  final String _dbUser = dotenv.env['DB_USER'] ?? 'postgres';
  final int _dbPort = int.parse(dotenv.env['DB_PORT'] ?? '5432');
  final String _dbName = dotenv.env['DB_NAME'] ?? 'postgres';

  PostgreSQLConnection? _connection;

  // ✅ Getter for connection to prevent multiple instances
  PostgreSQLConnection get connection {
    _connection ??= PostgreSQLConnection(
      _host,
      _dbPort,
      _dbName,
      username: _dbUser,
      password: _dbPassword,
      useSSL: false, // Set to true for SSL connections
    );
    return _connection!;
  }

  // ✅ Ensure the connection is open before running queries
  Future<void> ensureConnected() async {
    if (_connection == null || _connection!.isClosed) {
      try {
        await connection.open();
        print("✅ PostgreSQL Connected");
      } catch (e) {
        print("❌ PostgreSQL Connection Failed: $e");
        throw e;
      }
    }
  }

  // ✅ Fetch Users
  Future<List<Map<String, dynamic>>> fetchUsers(emailw) async {
    await ensureConnected();
    try {
      List<List<dynamic>> results = await connection.query(
        "SELECT id, name, email, response, created_at, isnishdone, ishaircaredone, is3stepdone FROM users WHERE email = @email",
        substitutionValues: {"email": "$emailw"},
      );

      print("object");
      return results
          .map((row) => {
                'id': row[0],
                'name': row[1],
                'email': row[2],
                'response': row[3],
                'created_at': row[4],
                'isnishdone': row[5],
                'ishaircaredone': row[6],
                'is3stepdone': row[7],
              })
          .toList();
    } catch (e) {
      print("❌ Failed to fetch users: $e");
      return [];
    } finally {
      await closeConnection();
    }
  }

  // ✅ Insert User
  Future<void> insertUser(String name, String email, String response) async {
    await ensureConnected();
    try {
      await connection.query(
        "INSERT INTO users (name, email, response) VALUES (@name, @email, @response)",
        substitutionValues: {
          'name': name,
          'email': email,
          'response': response,
        },
      );
      print("✅ User inserted: $name");
    } catch (e) {
      print("❌ Failed to insert user: $e");
    }
  }

  // ✅ Update User Response
  Future<void> updateResponse(String email, String response) async {
    await ensureConnected();
    try {
      await connection.query(
        "UPDATE users SET response = @response WHERE email = @email",
        substitutionValues: {
          'response': response,
          'email': email,
        },
      );
      print("✅ Response updated for: $email");
    } catch (e) {
      print("❌ Failed to update user: $e");
    } finally {
      await closeConnection();
    }
  }

  Future<void> updateDone(String email, String course, bool isDone) async {
    await ensureConnected();
    try {
      await connection.query(
        "UPDATE users SET $course = @$course WHERE email = @email",
        substitutionValues: {
          '$course': isDone,
          'email': email,
        },
      );
      print("✅ Response updated for: $course");
    } catch (e) {
      print("❌ Failed to update user: $e");
    } finally {
      await closeConnection();
    }
  }

  // ✅ Close Connection
  Future<void> closeConnection() async {
    if (_connection != null && !_connection!.isClosed) {
      await _connection!.close();
      if (kDebugMode) {
        print("✅ PostgreSQL Connection Closed");
      }
    }
  }
}
