import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/controllers/google-sign-in-controller.dart';
import 'package:login_firebase/screens/auth-ui/sign-in-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';

class Welcomescreen extends StatelessWidget {
  Welcomescreen({super.key});

  final GoogleSignInController _googleSignInController=Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text(
          "Welcome",
          style: TextStyle(color: AppConstant.appTextColor,fontSize: 30),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: Column(
          children: [
            Material(
              child: Container(
                alignment: Alignment.center,
                // width: Get.width,
                // height: Get.height,
                child: TextButton.icon(
                  icon: Image.asset('assets/images/google.png',width: Get.width/12,
                      height: Get.height/12,),
                  label: Text(
                    "Sign in with Google",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: (){
                    _googleSignInController.signInWithGoogle();
                  },
                ),

              ),

            ),
            SizedBox(
              height: 20,
            ),
            Material(
              child: Container(
                alignment: Alignment.center,
                // width: Get.width,
                // height: Get.height,
                child: TextButton.icon(
                  icon: Icon(Icons.email,color: AppConstant.appTextColor,),
                  label: Text(
                    "Sign in with Email",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: (){
                    Get.to(()=> SignInScreen());
                  },
                ),

              ),

            ),
          ],
        ),
      )
    );
  }
}
