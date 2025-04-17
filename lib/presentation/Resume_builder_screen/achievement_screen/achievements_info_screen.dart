import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_controller.dart';
import 'package:latexpert/infra/bloc/achievement_bloc/achievement_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/achievement_bloc/achievement_state.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_popup/common_delete_popup.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';

class AchievementInfoScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const AchievementInfoScreen({Key? key, this.showAppBar = true, this.onNext})
      : super(key: key);

  @override
  State<AchievementInfoScreen> createState() => _AchievementInfoScreenState();
}

class _AchievementInfoScreenState extends State<AchievementInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(BuildContext context) {
    final cubit = context.read<AchievementCubit>();
    final count = cubit.controllersList.length;
    for (int i = 0; i < count; i++) {
      cubit.deleteAchievementField(0);
    }
    cubit.addAchievementField();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AchievementCubit(),
      child: Scaffold(
        appBar: widget.showAppBar
            ? const CustomAppBar(title: Strings.achievements)
            : null,
        body: BlocBuilder<AchievementCubit, AchievementState>(
          builder: (context, state) {
            final cubit = context.read<AchievementCubit>();
            final controllers = cubit.controllersList;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controllers.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controllers[index].title.text.isEmpty
                                      ? '${Strings.achievementTitle} ${index + 1}'
                                      : controllers[index].title.text,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                if (controllers.length > 1)
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => CommonDeletePopup()
                                        .showDeleteConfirmationDialog(
                                      context,
                                      index,
                                      () => context
                                          .read<AchievementCubit>()
                                          .deleteAchievementField(index),
                                    ),
                                  ),
                              ],
                            ),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonHeading(
                                  title:
                                      '${Strings.achievementTitle} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers[index].title,
                                labelText: Strings.enterAchievementTitle,
                                errorText: Strings.enterValidTitle,
                              ),
                              CommonHeading(
                                  title: '${Strings.link} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers[index].link,
                                labelText: Strings.enterLink,
                                errorText: Strings.enterValidLink,
                              ),
                              CommonHeading(
                                  title: '${Strings.issuer} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers[index].issuer,
                                labelText: Strings.enterIssuerName,
                                errorText: Strings.enterValidIssuer,
                              ),
                            ],
                          );
                        },
                      ),
                      if (controllers.length < 4)
                        CommonAddFieldButton(
                          onTap: () => context
                              .read<AchievementCubit>()
                              .addAchievementField(),
                          name: Strings.addAchievement,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: _formKey,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final achievementList = context
                                    .read<AchievementCubit>()
                                    .controllersList
                                    .map((controllers) {
                                  return controllers
                                      .toModel(); // clean conversion
                                }).toList();

                                context
                                    .read<AchievementCubit>()
                                    .registerAchievements(
                                        context, achievementList);
                              }
                            },
                            name: Strings.saveContinue,
                          ),
                          CommonResetButton(
                            formKey: _formKey,
                            onTap: () => _resetFields(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
