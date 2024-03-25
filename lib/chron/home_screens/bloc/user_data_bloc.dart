import 'package:chron/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc({required UserData currentUserData})
      : super(UserDataInitial(currentUserData: currentUserData)) {
    on<UpdateUserData>((event, emit) {
      emit(UserDataInitial(currentUserData: event.newUserData));
    });
  }
}
