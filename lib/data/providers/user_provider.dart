import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:manga_base/data/repositories/user_local_repository.dart';
import 'package:manga_base/data/user.dart';

final userBoxProvider = Provider<Box<User>>((ref) {
  return Hive.box<User>('users');
});

final userRepositoryProvider = Provider<UserLocalRepository>((ref) {
  final userBox = ref.watch(userBoxProvider);
  return HiveUserRepository(userBox);
});
