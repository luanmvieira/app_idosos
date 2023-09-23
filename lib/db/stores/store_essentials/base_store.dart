

import 'package:objectbox/objectbox.dart';

abstract class BaseStore<T> {
  Future<Box<T>> getStore();

  /// Insere/atualiza um objeto no banco
  Future<int> put(T object) async => await getStore().then((store) => store.put(object));


  /// Insere/atualiza um objeto no banco de forma assincrona
  Future<int> putAsync(T object) async => await getStore().then((store) => store.putAsync(object));

  /// Insere/atualiza vários objetos no banco
  Future<List<int>> putMany(List<T> objects) async => await getStore().then((store) => store.putMany(objects));

  /// Localiza um objeto pelo ID
  Future<T?> get(int id) async => await getStore().then((store) => store.get(id));

  /// Localiza vários objetos a partir de uma lista de IDs
  Future<List<T?>> getMany(List<int> id) async => await getStore().then((store) => store.getMany(id));

  /// Localiza todos os objetos
  Future<List<T>> getAll() async => await getStore().then((store) => store.getAll());

  /// Remove um objeto
  Future<bool> remove(int id) async => await getStore().then((store) => store.remove(id));

  /// Remove todos os objetos
  Future<int> removeAll() async => await getStore().then((store) => store.removeAll());

  /// Localiza o primeiro objeto da query
  Future<T?> findFirst([Condition<T>? conditions]) async {
    Box<T> boxUser = await getStore();
    Query<T> query = boxUser.query(conditions).build();
    T? queryResult = query.findFirst();
    query.close();

    return queryResult;
  }

  /// Localiza objetos baseado em uma query
  Future<List<T>> find([Condition<T>? conditions]) async {
    Box<T> boxUser = await getStore();
    Query<T> query = boxUser.query(conditions).build();
    List<T> queryResult = query.find();
    query.close();

    return queryResult;
  }

  /// Cria uma query
  Future<Query<T>> query([Condition<T>? conditions]) async {
    Box<T> boxUser = await getStore();
    Query<T> query = boxUser.query(conditions).build();

    return query;
  }
}
