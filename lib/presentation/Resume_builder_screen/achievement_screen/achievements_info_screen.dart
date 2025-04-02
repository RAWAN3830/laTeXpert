import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_controller.dart';
import 'package:latexpert/infra/services/achievement_service/achievemnet_service.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_popup/common_delete_popup.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import '../../../infra/bloc/achievement_bloc/achievement_bloc_cubit.dart';
import '../../../infra/bloc/achievement_bloc/achievement_state.dart';
import '../../common_widgets/common_appbar/custome_appbar.dart';
import '../../common_widgets/common_textfields/comman_textformfield.dart';

class AchievementInfoScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const AchievementInfoScreen({Key? key, this.showAppBar = true, this.onNext})
      : super(key: key);

  @override
  _AchievementInfoScreenState createState() => _AchievementInfoScreenState();
}

class _AchievementInfoScreenState extends State<AchievementInfoScreen> {
  late AchievementCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}achievement_info";

  @override
  void initState() {
    super.initState();
    final achievementService = AchievementService();
    final initialData = achievementService.initialize();
    // _cubit = AchievementCubit(achievementService);
    _cubit.emit(AchievementState.success(
      controllersList: initialData.controllersList,
      expansionStates: initialData.expansionStates,
    ));
  }

  final List<achivementControllers> _allControllers = [
    achivementControllers(
        title: TextEditingController(),
        link: TextEditingController(),
        issuer: TextEditingController())
  ];

  void _addField() {
    setState(() {
      _allControllers.add(achivementControllers(
          title: TextEditingController(),
          link: TextEditingController(),
          issuer: TextEditingController()));
    });
  }

  void _deleteField(int index) {
    setState(() {
      _allControllers.removeAt(index);
    });
  }

  void _resetFields() {
    setState(() {
      _allControllers.clear();
      _allControllers.add(
        achivementControllers(
          title: TextEditingController(),
          link: TextEditingController(),
          issuer: TextEditingController(),
        ),
      );
    });
  }

  Future<void> _registerAchievement() async {
    if (!_formKey.currentState!.validate()) return;

    final token = await secureStorage.read(key: 'jwt_token');
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token not found. Please log in again.')),
      );
      return;
    }

    List<Map<String, dynamic>> achievementList =
        _allControllers.map((controller) {
      return {
        "title": controller.title.text,
        "link": controller.link.text,
        "issuer": controller.issuer.text,
      };
    }).toList();

    final Map<String, dynamic> achievementData = {
      "achievementList": achievementList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: achievementData,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Achievement details saved successfully.')),
        );
        widget.onNext?.call();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to save achievements: ${response.data}')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: widget.showAppBar
            ? const CustomAppBar(title: Strings.achievements)
            : null,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _allControllers.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _allControllers[index].title.text.isEmpty
                                  ? '${Strings.achievementTitle} ${index + 1}'
                                  : _allControllers[index].title.text,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (_allControllers.length > 1)
                              IconButton(
                                onPressed: () => CommonDeletePopup()
                                    .showDeleteConfirmationDialog(
                                  context,
                                  index,
                                  () => _deleteField(index),
                                ),
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                              ),
                          ],
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonHeading(
                              title:
                                  '${Strings.achievementTitle} (${index + 1})'),
                          CommonTextformfield(
                            controller: _allControllers[index].title,
                            labelText: Strings.enterAchievementTitle,
                            errorText: Strings.enterValidTitle,
                          ),
                          CommonHeading(
                              title: '${Strings.link} (${index + 1})'),
                          CommonTextformfield(
                            controller: _allControllers[index].link,
                            labelText: Strings.enterLink,
                            errorText: Strings.enterValidLink,
                          ),
                          CommonHeading(
                              title: '${Strings.issuer} (${index + 1})'),
                          CommonTextformfield(
                            controller: _allControllers[index].issuer,
                            labelText: Strings.enterIssuerName,
                            errorText: Strings.enterValidIssuer,
                          ),
                        ],
                      );
                    },
                  ),
                  if (_allControllers.length < 4)
                    CommonAddFieldButton(
                      onTap: _addField,
                      name: Strings.addAchievement,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonSaveButton(
                        formKey: _formKey,
                        onTap: _registerAchievement,
                        name: Strings.saveContinue,
                      ),
                      CommonResetButton(
                        formKey: _formKey,
                        onTap: _resetFields,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
