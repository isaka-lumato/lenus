import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lenus1/utils/firebase_consts.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot snapshotData;
  final profileImgPath = ''.obs;
  var profileImageLink = '';
  final username = ''.obs;
  final isLoading = false.obs;
  final imageUrl = RxString('');

  final nameController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final storeNameController = TextEditingController();
  final storeAddressController = TextEditingController();
  final storeMobileController = TextEditingController();
  final storeWebsiteController = TextEditingController();
  final storeDescriptionController = TextEditingController();

  Future<void> changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  Future<void> uploadProfileImage() async {
    try {
      final filename = basename(profileImgPath.value);
      final destination = 'images/${currentUser!.uid}/$filename';
      final ref = FirebaseStorage.instance.ref().child(destination);

      final fileBytes = await File(profileImgPath.value).readAsBytes();
      final uploadTask = ref.putData(fileBytes);
      final taskSnapshot = await uploadTask;

      profileImageLink = await taskSnapshot.ref.getDownloadURL();

      if (kDebugMode) {
        print('Profile image uploaded successfully. URL: $profileImageLink');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading profile image: $e');
      }
    }
  }

  Future<void> updateProfileImage({required String imageUrl}) async {
    try {
      final store = firestore.collection(usersCollection).doc(currentUser!.uid);
      await store.update({'imageUrl': imageUrl});
      isLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print('Error updating profile: $e');
      }
      // Handle the error here (e.g., show an error message to the user)
    }
  }

  Future<void> updateProfile({required String storename, required String password}) async {
    try {
      final store = firestore.collection(usersCollection).doc(currentUser!.uid);
      await store.update({
        'username': storename,
        'password': password,
        // 'imageUrl': imageUrl,
      });
      isLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print('Error updating profile: $e');
      }
      // Handle the error here (e.g., show an error message to the user)
    }
  }

  Future<void> changeAuthPassword({required String email, required String password, required String newPassword}) async {
    final credential = EmailAuthProvider.credential(email: email, password: password);

    try {
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.updatePassword(newPassword);
    } catch (error) {
      if (kDebugMode) {
        print("///////////////// ${error.toString()}/////////////////");
      }
    }
  }

  Future<void> updateStoreProfileImage({required String storemageUrl}) async {
    try {
      final store = firestore.collection(usersCollection).doc(currentUser!.uid);
      await store.update({'store_ImageUrl': storemageUrl});
      isLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print('Error updating profile: $e');
      }
      // Handle the error here (e.g., show an error message to the user)
    }
  }

  Future<void> updateShop({
    required String storeName,
    required String storeAddress,
    required String storeMobile,
    required String storeWebsite,
    required String storeDescription,
  }) async {
    final storeSetting = firestore.collection(usersCollection).doc(currentUser!.uid);
    await storeSetting.update({
      'store_name': storeName,
      'store_address': storeAddress,
      'store_mobile': storeMobile,
      'store_website': storeWebsite,
      'store_description': storeDescription,
    });
    isLoading(false);
  }
}
