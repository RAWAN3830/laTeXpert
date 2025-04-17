import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/personal_info_model/personal_info_model.dart';
import 'package:latexpert/infra/services/firestore_collection_service/fire_store_collection_service.dart';

class PersonalInfoRepository {
   Future<dynamic> addPersonInfoToFirebase(
      PersonalInfoModel personalInfoModel, BuildContext context) async {
    try {
      final Map<String, dynamic> personalInfoData = {
        'firstname': personalInfoModel.firstname,
        'lastname': personalInfoModel.lastname,
        'email': personalInfoModel.email,
        'phone': personalInfoModel.phone,
        'jobTitle': personalInfoModel.jobTitle,
        'address': personalInfoModel.address,
        'links': personalInfoModel.links
            .map((link) => {'name': link.name, 'link': link.link})
            .toList(),
      };

      await FireStoreCollectionService().fireStoreCollection(
        collection: Strings.personalInfo,
        docId: 'personalInfo1',
        data: {'dataList': personalInfoData},
      );

      const snackBar =
          SnackBar(content: Text('Data submitted successfully to Firestore.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      final snackBar = SnackBar(content: Text('Error saving data: $e'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
