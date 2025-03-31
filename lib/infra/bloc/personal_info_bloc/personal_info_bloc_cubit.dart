import 'package:bloc/bloc.dart';
import 'package:latexpert/domain/personal_info_model/personal_info_model.dart';
import '../../services/contact_info_service/set_personal_info_to_firebase.dart';
import 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoRepository _repository = PersonalInfoRepository();

  PersonalInfoCubit() : super(const PersonalInfoState.initial());

  Future<void> addPersonalInfo(
      PersonalInfoModel personalInfo, context) async {
    emit(const PersonalInfoState.inProgress());
    try {
      emit(PersonalInfoState.success(personalInfoModel: personalInfo));
    } catch (e) {
      emit(const PersonalInfoState.failure());
    }
  }
}
