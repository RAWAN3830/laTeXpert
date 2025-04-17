import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_auth/registration_user/registration_state.dart';
import '../../../../services/auth_service/registration_service.dart';

class RegistrationBlocCubit extends Cubit<RegistrationState> {
  final RegistrationService registrationService = RegistrationService();

  RegistrationBlocCubit() : super(const RegistrationState.initial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    if ([name, email, password, phone].any((e) => e.isEmpty)) {
      emit(const RegistrationState.failure('All fields are required'));
      return;
    }

    emit(const RegistrationState.loading());

    try {
      final message = await registrationService.registerUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      emit(RegistrationState.success(message));
    } catch (e) {
      emit(RegistrationState.failure(e.toString()));
    }
  }
}
