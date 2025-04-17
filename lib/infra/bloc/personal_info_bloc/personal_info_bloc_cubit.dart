import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/domain/personal_info_model/link_controller.dart';
import 'package:latexpert/infra/services/personal_info_service/personal_info_service.dart';
import 'personal_info_state.dart';

class PersonalInfoBlocCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoService personalInfoService = PersonalInfoService();

  PersonalInfoBlocCubit()
      : super(const PersonalInfoState.initial());

  // List of dynamic link fields
  List<LinkController> linkFields = [];

  // Add a new link field
  void addLinkField() {
    linkFields.add(
      LinkController(
        linkController: TextEditingController(),
        nameController: TextEditingController(),
      ),
    );
    emit(PersonalInfoState.updated(List<LinkController>.from(linkFields)));
  }

  // Remove a link field at a given index
  void removeLinkField(int index) {
    if (index >= 0 && index < linkFields.length) {
      linkFields.removeAt(index);
      emit(PersonalInfoState.updated(List<LinkController>.from(linkFields)));
    }
  }

  // Submit personal info to service
  Future<void> personalInfoAdd({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String jobTitle,
    required String address,
    required List<Map<String, String>> links,
  }) async {
    emit(const PersonalInfoState.loading());

    try {
      await personalInfoService.registerUser(
        firstname: firstname,
        lastname: lastname,
        email: email,
        phone: phone,
        jobTitle: jobTitle,
        address: address,
        links: links,
      );

      emit(const PersonalInfoState.success('User registered successfully'));
    } catch (e) {
      emit(PersonalInfoState.failure('Error: $e'));
    }
  }
}
