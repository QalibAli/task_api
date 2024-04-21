import 'package:api/ui/pages/home/cubit/users/users_cubit.dart';
import 'package:api/ui/pages/home/cubit/users/users_state.dart';
import 'package:api/ui/pages/home/widget/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is UsersSuccess) {
          final user = state.users;
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) {
              final users = user[index];
              return Box(
                userName: users.username!,
                mail: users.email!,
                street: users.address!.street!,
              );
            },
          );
        } else if (state is UsersFailure) {
          final errorMessage = state.errorMessage;
          return Text(errorMessage);
        } else if (state is UsersNetworkError) {
          final errorMessage = state.errorMessage;
          return Text(errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
