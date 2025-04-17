import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/services/auth_service/login_service.dart';
import 'login_state.dart';

class LoginBlocCubit extends Cubit<LoginState> {
  final LoginService loginService = LoginService();

  LoginBlocCubit() : super(const LoginState.initial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginState.failure("All fields are required"));
      return;
    }

    emit(const LoginState.loading());

    try {
      final token = await loginService.loginUser(
        email: email,
        password: password,
      );
      emit(LoginState.success(token));
    } catch (e) {
      emit(LoginState.failure(e.toString()));
    }
  }

  Future<void> logout() async {
    await loginService.logout();
    emit(const LoginState.initial());
  }
}
