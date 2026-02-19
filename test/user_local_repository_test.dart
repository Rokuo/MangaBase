import 'package:manga_base/data/Repositories/user_local_repository.dart';
import 'package:manga_base/data/user.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async {
  final repository = MockUserRepository();

  test('Add and retrieve user', () async {
    final user = User(id: 1, name: 'John Doe');
    await repository.addUser(user);
    final retrievedUser = await repository.getUser(1);
    expect(retrievedUser, isNotNull);
    expect(retrievedUser!.name, 'John Doe');    
  });

  test('Update user', () async {
    final user = User(id: 2, name: 'Jane Doe');
    await repository.addUser(user);
    user.name = 'Jane Smith';
    await repository.updateUser(user);
    final updatedUser = await repository.getUser(2);
    expect(updatedUser, isNotNull);
    expect(updatedUser!.name, 'Jane Smith');
  });

  test('Delete user', () async {
    final user = User(id: 3, name: 'Bob Smith');
    await repository.addUser(user);
    await repository.deleteUser(3);
    final deletedUser = await repository.getUser(3);
    expect(deletedUser, isNull);
  });

  test('Retrieve non-existent user', () async {
    final nonExistentUser = await repository.getUser(999);
    expect(nonExistentUser, isNull);
  });
}