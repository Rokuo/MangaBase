import 'package:flutter/material.dart';
import 'package:manga_base/ui/home.dart';
import 'package:manga_base/ui/search.dart';
import 'package:manga_base/ui/library.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          appBar: AppBar(title: const Text('Manga Base')),
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
              NavigationDestination(icon: Icon(Icons.library_books), label: 'Library'),
            ],
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (_, __) => const HomePage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/search', builder: (_, __) => const SearchPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/library', builder: (_, __) => const LibraryPage()),
          ],
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'Manga Base App',
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      routerConfig: router,
    );
  }
}
