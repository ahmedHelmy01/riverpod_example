import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/user_detail_view_model.dart';
class UserDetailsScreen extends ConsumerWidget {
  final int userId;
  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDetailsProvider(userId));
    final notifier = ref.read(userDetailsProvider(userId).notifier);

    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل المستخدم")),
      body: userAsync.when(
        data: (user) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(user.name),
              ElevatedButton(onPressed: notifier.reload, child: Text("تحديث"))
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Text("خطأ: $e"),
      ),
    );
  }
}
