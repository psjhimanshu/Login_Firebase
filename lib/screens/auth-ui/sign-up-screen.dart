import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/controllers/get-device-token-controller.dart';
import 'package:login_firebase/screens/auth-ui/sign-in-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';

import '../../controllers/sign-up-controller.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  final signUpController = Get.put(SignUpController());
  TextEditingController username=TextEditingController();
  TextEditingController userEmail=TextEditingController();
  TextEditingController userPhone=TextEditingController();
  TextEditingController userPassword=TextEditingController();
  final GetDeviceTokenController getDeviceTokenController=Get.put(GetDeviceTokenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text(
          "Sign Up",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: userEmail,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: username,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "UserName",
                    prefixIcon: Icon(Icons.person),
                    contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: userPhone,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                    contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Obx(
                    () => TextFormField(
                  controller: userPassword,
                  obscureText: signUpController.isPasswordVisible.value,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signUpController.isPasswordVisible.toggle();
                      },
                      child: Icon(
                        signUpController.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Material(
              color: AppConstant.appSecondaryColor,
              borderRadius: BorderRadius.circular(8.0),
              child: InkWell(
                onTap: () {
                  // Handle sign in logic
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: TextButton(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: ()async{
                      String name = username.text.trim();
                      String email = userEmail.text.trim();
                      String phone = userPhone.text.trim();
                      String password = userPassword.text.trim();
                      String userDeviceToken=getDeviceTokenController.deviceToken.toString();

                      if(name.isEmpty||email.isEmpty||phone.isEmpty||password.isEmpty){
                        Get.snackbar('Error', 'All fields are requirees',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,

                        );
                      }else{
                        UserCredential? userCredential=await signUpController.signUpMethod(name, email, phone, password, userDeviceToken);

                        if(userCredential!=null){
                          Get.snackbar('Verification email sent.', 'Please check your email',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,

                          );
                          FirebaseAuth.instance.signOut();
                          Get.offAll(()=>SignInScreen());

                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: AppConstant.appSecondaryColor),
                ),
                GestureDetector(
                  onTap: () => Get.offAll(() => SignInScreen()),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: AppConstant.appSecondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// class SignUpController extends GetxController {
//   var isPasswordVisible = false.obs;
// }
