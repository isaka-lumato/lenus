import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/utils/firebase_consts.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = auth;
  var isLoading = false.obs;

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  //Login Method
  Future<UserCredential?> signinMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//Signup Method
  Future<void> signupMethod({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String retypePassword,
  }) async {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        retypePassword.isEmpty) {
      // Show an error message if any field is empty
      VxToast.show(context, msg: 'Please fill in all the fields');
      return;
    }

    if (password != retypePassword) {
      // Show an error message if passwords do not match
      VxToast.show(context, msg: 'Passwords do not match');
      return;
    }

    try {
      // Create the user account using FirebaseAuth
      isLoading(true);
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //  // Check if the user account was created successfully
      if (userCredential.user != null) {
        // Store user data in Firestore
        await storeUserData(
          name: name,
          email: email,
          password: password,
          userId: userCredential.user!.uid,
        );

        // Show a success message
        // ignore: use_build_context_synchronously
        VxToast.show(context, msg: 'Sign up successful');

        Get.offAll(() => const Messaging());
      }
      Get.offAll(() => const Messaging());
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? 'Sign up failed');
    } catch (e) {
      VxToast.show(context, msg: 'Sign up failed');
      isLoading(false);
    }
  }

  //User data storage method
  Future<void> storeUserData({
    required String name,
    required String password,
    required String email,
    required String userId,
    String cartCount = '00',
    String orderCount = '00',
    String wishlistCount = '00',
  }) async {
    try {
      await firestore.collection(usersCollection).doc(userId).set({
        'id': userId,
        'name': name,
        'password': password,
        'email': email,
        'imageUrl': '',
        'cart_count': cartCount,
        'order_count': orderCount,
        'wishlist_count': wishlistCount,
      });
    } catch (e) {
      // Handle the error here (e.g., show an error message to the user)
      if (kDebugMode) {
        print('Error storing user data: $e');
      }
    }
  }

//sign-out method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
