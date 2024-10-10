import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/screens/auth-ui/welcome-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';
import 'package:login_firebase/widgets/banner-widget.dart';
import 'package:login_firebase/widgets/custom-drawer-widget.dart';
import 'package:login_firebase/widgets/heading-widget.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName,style: TextStyle(color: AppConstant.appTextColor),),
        centerTitle: true,

      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height/90.0,
              ),
              // Text("hello"),
              BannerWidget(),

              HeadingWidget(headingTitle: 'Categories', headingSubTitle: 'Budget', onTap: (){}, buttonText: 'See more..'),
              HeadingWidget(headingTitle: 'Categories1', headingSubTitle: 'Budget', onTap: (){}, buttonText: 'See more..'),
              HeadingWidget(headingTitle: 'Categories2', headingSubTitle: 'Budget', onTap: (){}, buttonText: 'See more..'),
            ],
          ),
        ),
      ),
    );
  }
}
