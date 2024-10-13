import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_firebase/screens/user-panel/all-categories-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';
import 'package:login_firebase/widgets/banner-widget.dart';
import 'package:login_firebase/widgets/category-widget.dart';
import 'package:login_firebase/widgets/custom-drawer-widget.dart';
import 'package:login_firebase/widgets/flash-sale-widget.dart';
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

              HeadingWidget(headingTitle: 'Categories', headingSubTitle: 'Budget', onTap: ()=>Get.to(()=>AllCategoriesScreen()), buttonText: 'See more..'),
              CategoriesWidget(),
              HeadingWidget(headingTitle: 'flash sale', headingSubTitle: 'Budget', onTap: (){}, buttonText: 'See more..'),
              FlashSaleWidget(),
              HeadingWidget(headingTitle: 'Categories2', headingSubTitle: 'Budget', onTap: (){}, buttonText: 'See more..'),
            ],
          ),
        ),
      ),
    );
  }
}
