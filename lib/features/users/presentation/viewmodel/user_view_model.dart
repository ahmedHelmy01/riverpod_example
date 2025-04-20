import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/user_service_repository.dart';

final userRepository = Provider<UserService>((ref) => UserService());

class UserNotifier extends AsyncNotifier<List<User>> {
  @override
  FutureOr<List<User>> build() async {
    final usersProvider = ref.read(userRepository);
    final users = await usersProvider.fetchUsers();
    return users;
  }
}
final usersViewModel = AsyncNotifierProvider<UserNotifier,List<User>>(()=>UserNotifier());