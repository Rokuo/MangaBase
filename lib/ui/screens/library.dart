import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_base/data/book.dart';
import 'package:manga_base/data/repositories/user_local_repository.dart';
import 'package:manga_base/data/user.dart';
import 'package:manga_base/data/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_base/ui/components/book_section.dart';

// FutureProvider for the user
// final userFutureProvider = FutureProvider.autoDispose<User?>((ref) {
//   final userRepo = ref.watch(userRepositoryProvider);
//   return userRepo.getUser(1);
// });

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userFutureProvider);
    final userRepo = ref.watch(userRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: userAsync.when(
        data: (user) => user == null
            ? const Center(child: Text('local user not found'))
            : ListView(
                children: [
                  BookSection(title: 'Reading List ${user.readingList.length}', books: user.readingList),
                  BookSection(title: 'Favorites ${user.favorites.length}', books: user.favorites),
                  BookSection(title: 'Library ${user.library.length}', books: user.library),
                ],
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = User(id: 1, name: 'local user', library: mockBooks.skip(3).take(6).toList(), readingList: [], favorites: [], ratings: []);
          await userRepo.addUser(newUser);
          ref.invalidate(userFutureProvider); // Invalidate the FutureProvider to refresh UI
        },
        child: const Icon(Icons.add),
        tooltip: 'Add User',
      ),
    );
  }
}

