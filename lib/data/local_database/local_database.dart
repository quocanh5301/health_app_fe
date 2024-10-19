abstract class IDatabase <T> {
  Future<void> insert(T obj);
  Future<T?> getById(int id);
  Future<List<T>> getAll();
  Future<void> update(T obj);
  Future<void> delete(String id);
}

class AppDatabase {
  static String userDatabase = 'users.db';
  static String runDatabase = 'runs.db';
}