import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/models/user-model.dart';
import 'package:login_firebase/screens/user-panel/main-screen.dart';

class GoogleSignInController extends GetxController{
  final GoogleSignIn googleSignIn=GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<void> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();

      if(googleSignInAccount!=null){
        EasyLoading.show(status: "Please wait ...");
        final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
        final AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential=await _auth.signInWithCredential(credential);
        final User? user=userCredential.user;

        if(user!=null){
          UserModel userModel=UserModel(
              uId: user.uid,
              username: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: '',
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
          );

          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          EasyLoading.dismiss();
          Get.offAll(()=>Mainscreen());
        }
      }

    }catch(e){
      EasyLoading.dismiss();
      print("error $e");
    }
  }
}