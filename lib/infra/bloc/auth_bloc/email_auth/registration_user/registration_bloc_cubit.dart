// registration_bloc_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_auth/registration_user/registration_state.dart';
import '../../../../services/auth_service/registration_service.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationService registrationService = RegistrationService();

  RegistrationCubit() : super(RegistrationInitial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    if ([name, email, password, phone].any((e) => e.isEmpty)) {
      emit(RegistrationFailure('All fields are required'));
      return;
    }

    emit(RegistrationLoading());

    try {
      final message = await registrationService.registerUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      emit(RegistrationSuccess(message));
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }
}
