import 'package:chron/main.dart';
import 'package:chron/models/app_user.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRedirectBloc extends Bloc<AuthRedirectEvent, AuthRedirectState> {
  AuthRedirectBloc() : super(Initial()) {
    on<RedirectUser>((event, emit) async {
      emit(Loading());
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated(user: currentUser));
      }
    });
  }

  final _authRepository = sl<AuthRepository>();
}

sealed class AuthRedirectEvent extends Equatable {}

class RedirectUser extends AuthRedirectEvent {
  @override
  List<Object?> get props => [];
}

sealed class AuthRedirectState extends Equatable {}

class Initial extends AuthRedirectState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuthRedirectState {
  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthRedirectState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthRedirectState {
  final AppUser user;

  Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}
