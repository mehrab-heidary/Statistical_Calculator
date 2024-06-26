import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_statistical_calculator/Core/constants/color_app.dart';
import 'package:simple_statistical_calculator/Core/themes/themes.dart';
import 'package:simple_statistical_calculator/Core/widgets/controller/custom_appbar_controller.dart';

class SwitchDarkLight extends StatefulWidget {
  const SwitchDarkLight({super.key});
  @override
  State<SwitchDarkLight> createState() => _SwitchDarkLightState();
}

class _SwitchDarkLightState extends State<SwitchDarkLight> {
  final customAppBarClr = Get.put(CustomAppbarController());
  Future<void> _saveThemeMode(int themeMode) async {
    final numberMode = await SharedPreferences.getInstance();
    await numberMode.setInt('thememode', themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedToggleSwitch<int?>.rolling(
        current: customAppBarClr.selectedLDMode.value,
        allowUnlistedValues: true,
        values: const [0, 1],
        onChanged: (i) => setState(() {
          customAppBarClr.selectedLDMode.value = int.parse(i.toString());
          convertValue(int.parse(i.toString()));
          Get.changeTheme(int.parse(i.toString()) == 0
              ? MyAppTheme().darkTheme()
              : MyAppTheme().lightTheme());
          Get.changeThemeMode(
              int.parse(i.toString()) == 0 ? ThemeMode.dark : ThemeMode.light);
          _saveThemeMode(int.parse(i.toString()));
        }),
        iconBuilder: null,
        borderWidth: 4.5,
        minTouchTargetSize: 10,
        style: ToggleStyle(
          indicatorColor: customAppBarClr.selectedLDMode == 0
              ? AppColors.gery1
              : AppColors.gery6,
          backgroundGradient: AppColors.gradientColor,
          borderColor: const Color.fromARGB(0, 226, 198, 198),
        ),
        height: 28,
        spacing: 10,
        loading: null,
      ),
    );
  }

  void convertValue(int value) {
    if (value == 0) {
      customAppBarClr.modeCurrent.value = false;
    } else {
      customAppBarClr.modeCurrent.value = true;
    }
  }
}
