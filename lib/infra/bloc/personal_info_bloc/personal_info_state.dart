import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/personal_info_model/link_controller.dart';

part 'personal_info_state.freezed.dart';

@freezed
class PersonalInfoState with _$PersonalInfoState {
  const factory PersonalInfoState.initial() = PersonalInfoInitial;
  const factory PersonalInfoState.loading() = PersonalInfoLoading;
  const factory PersonalInfoState.updated(List<LinkController> linkFields) = PersonalInfoUpdated;
  const factory PersonalInfoState.success(String message) = PersonalInfoSuccess;
  const factory PersonalInfoState.failure(String error) = PersonalInfoFailure;
}
