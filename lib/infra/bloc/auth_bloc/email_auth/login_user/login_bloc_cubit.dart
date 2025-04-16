import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/auth_service/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService loginService = LoginService();

  LoginCubit() : super(LoginInitial());


  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginFailure("All fields are required"));
      return;
    }

    emit(LoginLoading());

    try {
      final token = await loginService.loginUser(
        email: email,
        password: password,
      );
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    await loginService.logout();
    emit(LoginInitial());
  }
}
