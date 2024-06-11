// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dominos_pizza/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';
import 'package:dominos_pizza/core/colors.dart';
import 'package:dominos_pizza/core/translates/get_tran.dart';
import 'package:dominos_pizza/widgets/general/appbar.dart';

appSideMenu(BuildContext context, {required int index}) {
  return KheasydevSideMenu(
    selectedIndex: index,
    shadowColor: AppColor.primaryColor,
    disableColor: AppColor.disableColor,
    // appName: 'Iron Post',
    sidebarItems: [
      SideBarModel(
          icon: Icons.file_copy_outlined,
          label: appTranslate("send_files"),
          onTap: () {
            KheasydevNavigatePage().pushAndRemoveUntil(context, LoginPage());
          }),
    ],
    buttomBackground: AppColor.buttomBackground,
    appBar: appAppBar(title: 'יצירת קשר'),
  );
}
