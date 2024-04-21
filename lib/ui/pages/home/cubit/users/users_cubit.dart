import 'dart:io';

import 'package:api/ui/pages/home/data/service/app_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/ui/pages/home/cubit/users/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
	UsersCubit() : super(UsersLoading());
	
	void getUsers() async {
    try{
 emit(UsersLoading());
    final users= await AppService.getUsers();
    emit(UsersSuccess(users));
    } on SocketException catch(e){
      emit(UsersNetworkError(e.message));
    }
    catch(e){
      emit(UsersFailure("errorMessage"));
    }
   
  }
}
