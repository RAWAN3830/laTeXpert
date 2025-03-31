import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latexpert/core/constant/extension.dart';

import '../../../core/constant/strings.dart';
import '../common_text/common_heading.dart';
import 'comman_textformfield.dart';

class CommonYearsTextField extends StatelessWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  const CommonYearsTextField(
      {super.key,
      required this.startDateController,
      required this.endDateController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: Strings.startDate),
              _buildDatePicker(context, startDateController, isStart: true),
            ],
          ),
        ),
        SizedBox(width: context.width(context) * 0.05),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: Strings.endDate),
              _buildDatePicker(context, endDateController, isStart: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(
      BuildContext context, TextEditingController controller,
      {required bool isStart}) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1990),
          lastDate: DateTime(3000),
          initialDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('MMMM, yyyy').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      child: AbsorbPointer(
        child: CommonTextformfield(
          labelText: isStart ? Strings.startDateHint : Strings.endDateHint,
          controller: controller,
          errorText: Strings.enterValidValue,
        ),
      ),
    );
  }
}
