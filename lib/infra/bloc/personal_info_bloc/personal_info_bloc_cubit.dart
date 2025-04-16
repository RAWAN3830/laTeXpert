import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/domain/personal_info_model/link_controller.dart';
import 'package:latexpert/domain/personal_info_model/personal_info_model.dart';
import 'package:latexpert/infra/services/personal_info_service/personal_info_service.dart';
import 'personal_info_state.dart';

class PersonalInfoBlocCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoService personalInfoService = PersonalInfoService();

  PersonalInfoBlocCubit() : super(PersonalInfoInitial());

  // Method to register a user
  Future<void> personalInfoAdd({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String jobTitle,
    required String address,
    required List<Map<String, String>> links,
  }) async {
    emit(PersonalInfoLoading()); // Emit loading state when the process starts

    try {
      // Call the service to register the user
      await personalInfoService.registerUser(
        firstname: firstname,
        lastname: lastname,
        email: email,
        phone: phone,
        jobTitle: jobTitle,
        address: address,
        links: links,
      );

      emit(PersonalInfoSuccess('User registered successfully'));
    } catch (e) {
      emit(PersonalInfoFailure('Error: $e')); // Emit failure state if error occurs
    }
  }

  // Method to add a new field
  List<LinkController> linkFields = [];

 void addLinkField() {
   linkFields.add(
     LinkController(
       linkController: TextEditingController(),
       nameController: TextEditingController(),
     ),
   );
   emit(PersonalInfoUpdated(linkFields.cast<LinkController>()));
 }


  void removeLinkField(int index)  {
    if (index >= 0 && index < linkFields.length) {
      linkFields.removeAt(index);
      emit(PersonalInfoUpdated(linkFields.cast<LinkController>()));
    }
  }
}
