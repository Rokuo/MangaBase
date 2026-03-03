import 'package:hive_ce/hive_ce.dart';
import 'package:manga_base/data/dtos/user.dart';

abstract class UserLocalRepository {
  Future<void> addUser(User user);
  Future<User?> getUser(int id);
  Future<void> updateUser(User user);
  Future<void> deleteUser(int id);
}

class HiveUserRepository implements UserLocalRepository {
  final Box<User> userBox;

  HiveUserRepository(this.userBox);

  @override
  Future<void> addUser(User user) async {
    await userBox.put(user.id, user);
  }

  @override
  Future<User?> getUser(int id) async {
    return userBox.get(id);
  }

  @override
  Future<void> updateUser(User user) async {
    await userBox.put(user.id, user);
  }

  @override
  Future<void> deleteUser(int id) async {
    await userBox.delete(id);
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