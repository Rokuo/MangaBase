import 'package:isar/isar.dart';
import 'package:manga_base/data/user.dart';

abstract class UserLocalRepository {
  Future<void> addUser(User user);
  Future<User?> getUser(int id);
  Future<void> updateUser(User user);
  Future<void> deleteUser(int id);
}

class IsarUserRepository implements UserLocalRepository {
  final Isar isar;

  IsarUserRepository(this.isar);

  @override
  Future<void> addUser(User user) async {
    // await isar.writeTxn(() async {
    //   await isar.users.put(user);
    // });
  }

  @override
  Future<User?> getUser(int id) async {
    // return await isar.users.get(id);
  }

  @override
  Future<void> updateUser(User user) async {
    // await isar.writeTxn(() async {
    //   await isar.users.put(user);
    // });
  }

  @override
  Future<void> deleteUser(int id) async {
    // await isar.writeTxn(() async {
    //   await isar.users.delete(id);
    // });
  }
}

class MockUserRepository implements UserLocalRepository {
  final Map<int, User> _users = {};

  @override
  Future<void> addUser(User user) async {
    _users[user.id] = user;
  }

  @override
  Future<User?> getUser(int id) async {
    return _users[id];
  }

  @override
  Future<void> updateUser(User user) async {
    _users[user.id] = user;
  }

  @override
  Future<void> deleteUser(int id) async {
    _users.remove(id);
  }
}