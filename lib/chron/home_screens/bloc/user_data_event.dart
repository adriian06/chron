part of 'user_data_bloc.dart';

sealed class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserData extends UserDataEvent {
  final UserData newUserData;

  const UpdateUserData({required this.newUserData});

  @override
  List<Object> get props => [newUserData];
}
