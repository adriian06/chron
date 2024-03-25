part of 'user_data_bloc.dart';

sealed class UserDataState extends Equatable {
  const UserDataState({required this.currentUserData});
  final UserData currentUserData;

  @override
  List<Object> get props => [currentUserData];
}

final class UserDataInitial extends UserDataState {
  const UserDataInitial({required super.currentUserData});

  @override
  List<Object> get props => [currentUserData];
}
