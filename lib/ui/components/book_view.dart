import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_base/data/dtos/book.dart';
import 'package:manga_base/data/providers/user_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:manga_base/data/dtos/user.dart';

class BookModalView extends ConsumerWidget {
  const BookModalView({super.key, required this.book});

  final Book book;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userFutureProvider);
    final userRepo = ref.watch(userRepositoryProvider);

    return (
      ShadDialog(
        title: Text(book.title),
        description: Row(
          children: [
            Text(book.authors.toString()),
            Builder(builder: (context) {
              final user = userAsync.asData?.value;
              if (user == null) {
                return ShadButton(
                  onPressed: null, // Disable the button if user is not available
                  child: Text('Add to favorites'),
                );
              }
              else {
                final isFavorite = user.favorites.any((b) => b.id == book.id);
                return ShadButton(
                  child: Text(isFavorite ? 'Remove from favorites' : 'Add to favorites'),
                  onPressed: () async {
                    if (isFavorite) {
                      user.favorites.remove(book);
                    } else {
                      user.favorites.add(book);
                    }
                    await userRepo.updateUser(user);
                    ref.invalidate(userFutureProvider);
                  },
                );
              }
            })
          ],
        ),
        scrollable: true,
        alignment: Alignment.center,
        radius: BorderRadius.all(Radius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            Text('Date de parution: ${book.firstPublishYear}'),
            Text('Nombre de pages: ${book.pageCount}'),
            Image.network(book.coverUrl!),
            Center(child : Row(children: [
              for (String subject in book.subjects)
                ShadBadge.secondary(child: Text(subject)),
            ])),
            Text(book.description!),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: Builder(builder: (context) {
                final user = userAsync.asData?.value;
                if (user == null) {
                  return ShadButton(
                    onPressed: null, // Disable the button if user is not available
                    child: Text('Add to Reading List'),
                  );
                } else {
                  final isInReadingList = user.readingList.any((b) => b.id == book.id);
                  return ShadButton(
                    child: Text(isInReadingList ? 'Remove from Reading List' : 'Add to Reading List'),
                    onPressed: () async {
                      if (isInReadingList) {
                        user.readingList.remove(book);
                      } else {
                        user.readingList.add(book);
                      }
                      await userRepo.updateUser(user);
                      ref.invalidate(userFutureProvider); // Invalidate the FutureProvider to refresh UI
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  );
                }
              })
            )
          ],
        ),
      )
    );
  }
}