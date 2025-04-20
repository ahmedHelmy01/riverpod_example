import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/user_model.dart';
import '../../viewmodel/user_view_model.dart';
import '../user_detail_screen/user_detail_screen.dart';


class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersViewModel);
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: usersState.when(
        data: (users) => _UsersList(users: users),
        loading: () => const _LoadingIndicator(),
        error: (error, _) => _ErrorMessage(error: error),
      ),
    );
  }
}
class _UsersList extends StatelessWidget {
  final List<User> users;
  const _UsersList({required this.users});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) => Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(users[index].name),
          subtitle: Text(users[index].email),
          trailing: Text(users[index].phone),
          isThreeLine: true,
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserDetailsScreen(userId:users[index].id)),
            );
          },
        ),
      ),
    );
  }
}
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
class _ErrorMessage extends StatelessWidget {
  final Object error;

  const _ErrorMessage({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('خطأ: $error'));
  }
}