import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/screens/auth-ui/welcome-screen.dart';
import 'package:login_firebase/utils/app-constant.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: Get.height/25),

        child: Drawer(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )
    ),
          backgroundColor: AppConstant.appSecondaryColor,
          child: Wrap(
            runSpacing: 10,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Himanshu',style: TextStyle(color: AppConstant.appTextColor),),
                  subtitle: Text("this is subtitle",style: TextStyle(color: AppConstant.appTextColor)),
                  leading: CircleAvatar(
                    radius: 22.0,
                    backgroundColor: AppConstant.appMainColor,
                    child: Text("H"),
                  ),
                ),
                ),

                Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1.5,
                  color: Colors.lightBlueAccent,
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Home',style: TextStyle(color: AppConstant.appTextColor)),
                    leading: Icon(Icons.home),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Products',style: TextStyle(color: AppConstant.appTextColor)),
                    leading: Icon(Icons.production_quantity_limits),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Orders',style: TextStyle(color: AppConstant.appTextColor)),
                    leading: Icon(Icons.shopping_bag),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Contact',style: TextStyle(color: AppConstant.appTextColor)),
                    leading: Icon(Icons.contact_page),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                      onTap: ()async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signOut();
                        await googleSignIn.signOut();
                        Get.offAll(() => Welcomescreen());
                      },
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Logout',style: TextStyle(color: AppConstant.appTextColor)),
                    leading: Icon(Icons.logout),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),

              ],
          ),
    ),
    );
  }
}
