import 'dart:async';
import 'dart:convert';

import 'package:dukanatek/models/Resources.dart';
import 'package:dukanatek/models/Status.dart';
import 'package:dukanatek/screens/login/models/UserModel.dart';
import 'package:dukanatek/utils/SharedPreferencesConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../App.dart';

class FirebaseServices {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  StreamController<UserModel> userController = StreamController<UserModel>();

  Future<UserModel?> getUserProfile(String userId) async {
    // Get user profile for id
    UserModel? userModel;
    await db.collection('users').doc(userId).get().then((value) {
      if (value.exists) userModel = UserModel.fromJson(value.data()!);
    });
    // Convert and return
    return userModel!;
  }

  Future<String> addNewUser(
      String userId, String name, String email, String phone) async {
    String? state;
    await db.collection('users').doc(userId).set({
      "id": userId,
      "name": name,
      "email": email,
      "phone": phone,
      "status": "active",
      "fcm_token": "fcm_token"
    }).then((value) {
      state = "success";
    }).catchError((e) {
      state = e.toString();
    });
    return state!;
  }

//register with email and password
  Future<Resource<String>> register(
      String email, String password, String name, String phone) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addNewUser(credential.user!.uid, name, email, phone);
      UserModel? user = await getUserProfile(credential.user!.uid);
      currentUserID = credential.user!.uid;
      userController.add(user!);

      // save user data as string in shared preference and make it logged in
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(LOGGED_IN, true);
      await prefs.setString(USER_ID, credential.user!.uid);
      await prefs.setString(USER_DETAILS, jsonEncode(user.toJson()));
      return Resource(Status.SUCCESS, data: "");
    } on FirebaseAuthException catch (e) {
      return Resource(Status.ERROR, errorMessage: e.message);
    }
  }

  // login with email and password
  Future<Resource<UserModel>> login(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel? user = await getUserProfile(credential.user!.uid);
      currentUserID = credential.user!.uid;
      userController.add(user!);

      // save user data as string in shared preference and make it logged in
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(LOGGED_IN, true);
      await prefs.setString(USER_ID, credential.user!.uid);
      await prefs.setString(USER_DETAILS, jsonEncode(user.toJson()));
      return Resource(Status.SUCCESS, data: user);
    } on FirebaseAuthException catch (e) {
      return Resource(Status.ERROR, errorMessage: e.message);
    }
  }

  Future<Resource<UserModel>> signInWithGoogle() async {
    print('Google');

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential credentialUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      UserModel? user = await getUserProfile(credentialUser.user!.uid);

      if (user == null) {

        user = UserModel.initial();
        user.id = credentialUser.user!.uid;
        user.name = credentialUser.user!.displayName;
        user.email = credentialUser.user!.email;

        await addNewUser(credentialUser.user!.uid,
            credentialUser.user!.displayName!, credentialUser.user!.email!, "");
      }
      currentUserID = credentialUser.user!.uid;
      userController.add(user);

      // save user data as string in shared preference and make it logged in
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(LOGGED_IN, true);
      await prefs.setString(USER_ID, credentialUser.user!.uid);
      await prefs.setString(USER_DETAILS, jsonEncode(user.toJson()));
      return Resource(Status.SUCCESS, data: user);
    } catch (e) {
      print('errrrorr ${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }
}
