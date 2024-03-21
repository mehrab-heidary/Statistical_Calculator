import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_statistical_calculator/Core/constants/app_text_style.dart';
import 'package:simple_statistical_calculator/Core/constants/color_app.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({
    required this.controller,
    super.key,
  });
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      autofocus: false,
      maxLines: 10,
      textDirection: TextDirection.ltr,
      style: MyAppTextStyle.getBold(color: AppColors.gery7, fontSize: 35),
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.deny(
            RegExp('[ a-zA-Zآ-ی!@#?^&*()_`~|":;,{}]'))
      ],
      onChanged: (value) {
        onChanged(value);
      },
    );
  }

  void onChanged(String value) {
    if (value.isNotEmpty) {
      String lastChar = value[value.length - 1];
      if (lastChar == '[' ||
          lastChar == ']' ||
          lastChar == '\\' ||
          lastChar == '<' ||
          lastChar == '>' ||
          lastChar == '\'' ||
          lastChar == '|') {
        String currentValue = controller!.text;
        controller!.text = currentValue.substring(0, currentValue.length - 1);
      }
    }
  }
}