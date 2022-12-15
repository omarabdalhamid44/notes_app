abstract class Db_Operations<T> {
  Future<int> create(T obejct);

  Future<List<T>> read();

  Future<T?> show(int id);

  Future<bool> update(T obejct);

  Future<bool> delete(int id);
}
