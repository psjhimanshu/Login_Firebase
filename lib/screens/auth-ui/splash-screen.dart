import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gif_view/gif_view.dart';
import 'package:login_firebase/controllers/get-user-data-controller.dart';
import 'package:login_firebase/screens/admin-panel/admin-main-screen.dart';
import 'package:login_firebase/screens/auth-ui/welcome-screen.dart';
import 'package:login_firebase/screens/user-panel/main-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()
    {
      logedin(context);
    });
  }

  Future<void> logedin(BuildContext context) async{
    if(user!=null) {
      final GetUserDataController getUserDataController = Get.put(
          GetUserDataController());
      var userData=await getUserDataController.getUserData(user!.uid);
      if(userData[0]['isAdmin']==true){
        Get.offAll(()=>AdminMainScreen());
      }else{
        Get.offAll(()=>Mainscreen());
      }
    }else{
      Get.to(()=> Welcomescreen());
    }
  }

  @override
  Widget build(BuildContext context) {
// final size=MediaQuery.of(context).size;
return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(child: GifView.asset('assets/images/hacker.gif'
                  ),
                    // margin: EdgeInsets.only(top: 400.0),

                    alignment: Alignment.center,
                    width: Get.width,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 20.0),
                //   alignment: Alignment.center,
                //   width: Get.width,
                //   child: Text(
                //       AppConstant.appPoweredBy,
                //     style: TextStyle(
                //       color: AppConstant.appTextColor,
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold
                //     ),
                //
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
