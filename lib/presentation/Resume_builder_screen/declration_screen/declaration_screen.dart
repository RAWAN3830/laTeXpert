import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/declaration_model/declaration_controller.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_bloc.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_state.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_popup/common_delete_popup.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';

class DeclarationScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;  // Callback function to move to next step

  const DeclarationScreen({super.key, this.showAppBar = true, this.onNext});

  @override
  State<DeclarationScreen> createState() => _DeclarationScreenState();
}

class _DeclarationScreenState extends State<DeclarationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<declarationControllers> _allControllers = [
    declarationControllers(
     declaration:  TextEditingController(),)
  ];
  late DeclarationCubit _declarationCubit;

  @override
  void initState() {
    super.initState();
    _declarationCubit = DeclarationCubit();
    _declarationCubit.initialize(); // Initialize with one field
  }

  void _addField() {
    setState(() {
      _allControllers.add(
          declarationControllers(declaration: TextEditingController())
      );
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
        declarationControllers(declaration: TextEditingController())
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _declarationCubit,
      child: Scaffold(
        appBar: widget.showAppBar ? const CustomAppBar(title: Strings.honorAwardTitle) : null,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  BlocBuilder<DeclarationCubit, DeclarationState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (controllersList) {
                          return Column(
                            children: List.generate(controllersList.length, (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonHeading(title: '${Strings.honorAward} ${index + 1}'),
                                        CommonTextformfield(
                                          controller: _allControllers[index].declaration,
                                          labelText: 'Won X Hackathon at X Institute',
                                          errorText: Strings.validTitleError,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controllersList.length > 1)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0, left: 10),
                                      child: IconButton(
                                        onPressed: () => CommonDeletePopup().showDeleteConfirmationDialog(
                                          context,
                                          index,
                                              () {
                                                setState(() {
                                                  _deleteField(index);
                                                });
                                              },
                                              // () => context.read<DeclarationCubit>().deleteDeclarationField(index),
                                        ),
                                        icon: const Icon(CupertinoIcons.delete),
                                      ),
                                    ),
                                ],
                              );
                            }),
                          );
                        },
                        orElse: () => const CircularProgressIndicator(),
                      );
                    },
                  ),

                    CommonAddFieldButton(
                      onTap: (){
                        setState(() {
                          _addField();
                        });
                      },
                            // onTap: () => context.read<DeclarationCubit>().addDeclarationField(),
                            name: Strings.addHonorAward,
                          ),
                  SizedBox(height: context.height(context) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonSaveButton(
                        formKey: formKey,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            for (var controller in _allControllers) {
                              print(controller.declaration.text);
                            }
                            // context.read<DeclarationCubit>().saveDeclaration();
                            widget.onNext?.call(); // Move to next step
                          }
                        },
                        name: Strings.saveContinue,
                      ),
                      CommonResetButton(
                        formKey: formKey,
                        onTap: () {
                          _resetFields();
                          // context.read<DeclarationCubit>().resetDeclarationFields();
                        },
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

  @override
  void dispose() {
    _declarationCubit.close();
    super.dispose();
  }
}
