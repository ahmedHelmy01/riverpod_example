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


//  how can use auto dispose

// final userRepository = Provider<UserService>((ref) => UserService());
//
// // AsyncNotifier مع autoDispose
// class UserNotifier extends AutoDisposeAsyncNotifier<List<User>> {
//   @override
//   FutureOr<List<User>> build() async {
//     final usersProvider = ref.read(userRepository);
//     final users = await usersProvider.fetchUsers();
//     return users;
//   }
// }
//
// // ViewModel مع autoDispose
// final usersViewModel = AutoDisposeAsyncNotifierProvider<UserNotifier, List<User>>(
//       () => UserNotifier(),
// );
