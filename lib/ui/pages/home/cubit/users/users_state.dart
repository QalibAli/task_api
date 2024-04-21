
import '../../data/model/users_model.dart';

sealed class UsersState {}

class UsersLoading extends UsersState {}
class UsersSuccess extends UsersState {
  UsersSuccess(this.users);
  final List<UsersModel> users;
}
class UsersFailure extends UsersState {
  UsersFailure(this.errorMessage);
  final String errorMessage;
}
class UsersNetworkError extends UsersState {
  UsersNetworkError(this.errorMessage);
  final String errorMessage;
}

