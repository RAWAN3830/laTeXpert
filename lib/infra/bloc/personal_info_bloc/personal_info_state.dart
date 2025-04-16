// Abstract State class
import '../../../domain/personal_info_model/link_controller.dart';
import '../../../domain/personal_info_model/personal_info_model.dart';

abstract class PersonalInfoState {}

// Initial state
class PersonalInfoInitial extends PersonalInfoState {}

// Loading state
class PersonalInfoLoading extends PersonalInfoState {}
class PersonalInfoUpdated  extends PersonalInfoState {
 final List<LinkController> linkFields;
 PersonalInfoUpdated(this.linkFields);
}

// Success state
class PersonalInfoSuccess extends PersonalInfoState {
  final String message;
  PersonalInfoSuccess(this.message);
}

// Failure state
class PersonalInfoFailure extends PersonalInfoState {
  final String error;
  PersonalInfoFailure(this.error);
}
