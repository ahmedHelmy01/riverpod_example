import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/user_model.dart';
import 'user_view_model.dart';
class UserDetailsNotifier extends FamilyAsyncNotifier<User, int> {
  @override
  Future<User> build(int id) async {
    return ref.read(userRepository).fetchUserById(id);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(userRepository).fetchUserById(arg)); // arg بدل ref.arg
  }
}
final userDetailsProvider = AsyncNotifierProviderFamily<UserDetailsNotifier, User, int>(
  UserDetailsNotifier.new,
);

//AutoDisposeFamilyAsyncNotifier


// class UserDetailsNotifier extends AutoDisposeFamilyAsyncNotifier<User, int> {
//   @override
//   Future<User> build(int id) async {
//     return ref.read(userRepository).fetchUserById(id);
//   }
//
//   Future<void> reload() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() =>
//         ref.read(userRepository).fetchUserById(arg));
//   }
// }
//
// final userDetailsProvider =
// AutoDisposeAsyncNotifierProviderFamily<UserDetailsNotifier, User, int>(
//   UserDetailsNotifier.new,
// );
