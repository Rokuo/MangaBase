import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_base/data/repositories/user_local_repository.dart';
import 'package:manga_base/data/user.dart';
import 'package:manga_base/data/providers/user_provider.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRepo = ref.watch(userRepositoryProvider);
    final users = userRepo is HiveUserRepository
        ? userRepo.userBox.values.toList()
        : <User>[];

    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: users.isEmpty
          ? const Center(child: Text('No users found'))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('ID: ${user.id}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = User(id: users.length + 1, name: 'User ${users.length + 1}');
          await userRepo.addUser(newUser);
          ref.invalidate(userRepositoryProvider);
        },
        child: const Icon(Icons.add),
        tooltip: 'Add User',
      ),
    );
  }
}