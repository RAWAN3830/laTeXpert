import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/domain/declaration_model/declaration_controller.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_bloc.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/core/constant/strings.dart';

import '../../../infra/bloc/declaration_bloc/declaration_state.dart';
import '../../common_widgets/common_text/common_heading.dart';

class DeclarationScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const DeclarationScreen({Key? key, this.showAppBar = true, this.onNext})
      : super(key: key);

  @override
  State<DeclarationScreen> createState() => _DeclarationScreenState();
}

class _DeclarationScreenState extends State<DeclarationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeclarationBloc(),
      child: Scaffold(
        appBar: widget.showAppBar
            ? const CustomAppBar(title: Strings.declaration)
            : null,
        body: BlocBuilder<DeclarationBloc, DeclarationState>(
          builder: (context, state) {
            final cubit = context.read<DeclarationBloc>();
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonHeading(title: '${Strings.honorAward} ${index + 1}'),
                              CommonTextformfield(
                                controller: controllers[index].declaration,
                                labelText: 'Won X Hackathon at X Institute',
                                errorText: Strings.validTitleError,
                              ),
                            ],
                          );
                        },
                      ),
                      if (controllers.length < 4)
                        CommonAddFieldButton(
                          onTap: () => context
                              .read<DeclarationBloc>()
                              .addDeclarationField(),
                          name: Strings.declaration,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: _formKey,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final declarationList = context
                                    .read<DeclarationBloc>()
                                    .controllersList
                                    .map((controllers) {
                                  return controllers.toModel(); // clean conversion
                                }).toList();

                                context
                                    .read<DeclarationBloc>()
                                    .registerDeclaration(
                                    context, declarationList);
                              }
                            },
                            name: Strings.saveContinue,
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
