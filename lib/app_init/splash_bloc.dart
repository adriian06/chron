import 'package:chron/main.dart';
import 'package:chron/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartBeforeAppChecks>((event, emit) async {
      try {
        final currentUser = _auth.currentUser;
        final prefs = await SharedPreferences.getInstance();
        if (currentUser == null) {
          emit(SplashFinished());
          return;
        }
        final rememberMe = prefs.getBool('remember_me') ?? false;
        if (rememberMe == false) {
          await _auth.signOut();
          emit(SplashFinished());
          return;
        }
        await authRepository.useBioMetrics();
        emit(SplashFinished());
      } catch (e, stacktrace) {
        if (kDebugMode) {
          print(e);
          print(stacktrace);
        }
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('remember_me');
        await _auth.signOut();
        emit(SplashFinished());
      }
    });
  }

  final _auth = FirebaseAuth.instance;
  final authRepository = sl<AuthRepository>();
}

sealed class SplashEvent extends Equatable {}

class StartBeforeAppChecks extends SplashEvent {
  @override
  List<Object?> get props => [];
}

sealed class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashError extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashFinished extends SplashState {
  @override
  List<Object?> get props => [];
}
