import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:login_firebase/controllers/get-user-data-controller.dart';
import 'package:login_firebase/screens/admin-panel/admin-main-screen.dart';
import 'package:login_firebase/screens/auth-ui/forget-password-screen.dart';
import 'package:login_firebase/screens/user-panel/main-screen.dart';
import '../../controllers/sign-in-controller.dart';
// import '../controllers/sign-in-controller.dart';
// import '../utils/constant.dart';
// import 'main-screen.dart';
import '../../utils/app-constant.dart';
import 'sign-up-screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          centerTitle: true,
          title: Text(
            "Sign In",
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                          () => TextFormField(
                        controller: userPassword,
                        obscureText: signInController.isPasswordVisible.value,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Get.to(() => ForgetPasswordScreen());
                  },
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=> ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      // Input validation
                      if (email.isEmpty || password.isEmpty) {
                        showSnackbar(
                          title: "Error",
                          message: "Please enter all details",
                        );
                        return;
                      }

                      try {
                        // Attempt login
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);

                        var userData=await getUserDataController.getUserData(userCredential!.user!.uid);

                        if (userCredential != null) {

                          if(userData[0]['isAdmin']==true){
                            Get.offAll(()=>
                                AdminMainScreen());
                            // Mainscreen()); // Navigate to MainScreen on success
                            showSnackbar(
                              title: "Success Admin Login",
                              message: "Login Successfully!",
                            );
                          }else{
                            Get.offAll(()=>
                                // AdminMainScreen());
                            Mainscreen()); // Navigate to MainScreen on success
                            showSnackbar(
                              title: "Success User Login",
                              message: "Login Successfully!",
                            );

                          }

                        } else {
                          showSnackbar(
                            title: "Error",
                            message: "Login failed, please try again",
                          );
                        }
                      } catch (e) {
                        // Handle exceptions such as FirebaseAuthException
                        showSnackbar(
                          title: "Error",
                          message: e
                              .toString(), // For debugging, you can change this to a user-friendly message.
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppConstant.appSecondaryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUpscreen()),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  void showSnackbar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstant.appSecondaryColor,
      colorText: AppConstant.appTextColor,
    );
  }
}