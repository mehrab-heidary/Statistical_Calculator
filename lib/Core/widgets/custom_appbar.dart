import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simple_statistical_calculator/Core/constants/app_size.dart';
import 'package:simple_statistical_calculator/Core/constants/app_text_style.dart';
import 'package:simple_statistical_calculator/Core/constants/color_app.dart';
import 'package:simple_statistical_calculator/Core/widgets/controller/custom_appbar_controller.dart';

class CustomAppBar extends StatelessWidget {
  final bool? selectedDarkLight;
  CustomAppBar({super.key, this.selectedDarkLight = false});
  final List<String> nameSections = ['ماشین حساب', 'آمار احتمالات'];

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:
            selectedDarkLight == true ? AppColors.gery6 : AppColors.gery1,
        flexibleSpace: SizedBox(
          width: AppSize.setFullsizeWidth,
          child: AppbarCustomSelection(
            nameSections: nameSections,
            selectedDarkLight: selectedDarkLight,
          ),
        ));
  }
}

class AppbarCustomSelection extends StatelessWidget {
  final bool? selectedDarkLight;
  AppbarCustomSelection({
    super.key,
    required this.nameSections,
    this.selectedDarkLight,
  });

  final List<String> nameSections;
  final customApbarClr = Get.put(CustomAppbarController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          InkWell(
              onTap: () => customApbarClr.selectedSection.value = 1,
              child: Container(
                width: AppSize.setFullsizeWidth / 2,
                decoration: BoxDecoration(
                    color: selectedDarkLight == true
                        ? customApbarClr.selectedSection.value == 1
                            ? AppColors.gery6
                            : AppColors.gery5
                        : customApbarClr.selectedSection.value == 1
                            ? AppColors.gery1
                            : AppColors.gery3),
                child: Center(
                  child: Text(
                    nameSections[1],
                    style: selectedDarkLight == true
                        ? customApbarClr.selectedSection.value == 1
                            ? MyAppTextStyle.getBold(
                                color: AppColors.gery3, fontSize: 20)
                            : MyAppTextStyle.medium(
                                color: AppColors.gery7, fontSize: 20)
                        : customApbarClr.selectedSection.value == 1
                            ? MyAppTextStyle.getBold(
                                color: AppColors.gery7, fontSize: 20)
                            : MyAppTextStyle.medium(
                                color: AppColors.gery6, fontSize: 20),
                  ),
                ),
              )),
          InkWell(
              onTap: () => customApbarClr.selectedSection.value = 0,
              child: Container(
                width: AppSize.setFullsizeWidth / 2,
                decoration: BoxDecoration(
                    color: selectedDarkLight == true
                        ? customApbarClr.selectedSection.value == 0
                            ? AppColors.gery6
                            : AppColors.gery5
                        : customApbarClr.selectedSection.value == 0
                            ? AppColors.gery1
                            : AppColors.gery3),
                child: Center(
                  child: Text(
                    nameSections[0],
                    style: selectedDarkLight == true
                        ? customApbarClr.selectedSection.value == 0
                            ? MyAppTextStyle.getBold(
                                color: AppColors.gery3, fontSize: 20)
                            : MyAppTextStyle.medium(
                                color: AppColors.gery7, fontSize: 20)
                        : customApbarClr.selectedSection.value == 0
                            ? MyAppTextStyle.getBold(
                                color: AppColors.gery7, fontSize: 20)
                            : MyAppTextStyle.medium(
                                color: AppColors.gery6, fontSize: 20),
                  ),
                ),
              )),
        ],
      );
    });
  }
}
