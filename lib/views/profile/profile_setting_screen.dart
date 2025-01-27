import 'dart:io';

import 'package:lenus1/component/app_text_field2.dart';
import 'package:lenus1/component/loading_indicator.dart';
import 'package:lenus1/component/our_button.dart';
import 'package:lenus1/controllers/profile/profile_controller.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/utils/images.dart';

class StoreSettingsScreen extends StatefulWidget {
  const StoreSettingsScreen({super.key});

  @override
  State<StoreSettingsScreen> createState() => _StoreSettingsScreenState();
}

class _StoreSettingsScreenState extends State<StoreSettingsScreen> {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: "Store Settings".text.make().marginOnly(top: 5),
        centerTitle: true,
        backgroundColor: const Color(0xfffbfbfb),
        leading: const Icon(Icons.arrow_back_ios_new).onTap(() {
          Get.back();
        }),
      ),
      body: Container(
          height: AppConstants.fullHeight(),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileForm(),
                _buildInputForm(),
                _buildSaveButton(),
              ],
            ),
          )),
    );
  }

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStoreProfileImage(),
          _buildProfileDetails(),
        ],
      ),
    );
  }

  Widget _buildStoreProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: darkBlueColor.withAlpha(100),
                    blurRadius: 10,
                    spreadRadius: 50,
                  ),
                ],
              ),
              child: Obx(
                () => controller.snapshotData['store_ImageUrl'] == '' &&
                        controller.profileImgPath.isEmpty
                    ? Image.asset(phUser,
                        width: 100, height: 100, fit: BoxFit.cover)
                    :
                    //if data is not empty but controller path is empty
                    controller.snapshotData['store_ImageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            controller.snapshotData['store_ImageUrl'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        :
                        //if both are empty
                        Image.file(File(controller.profileImgPath.value),
                            width: 100, height: 100, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.h,
          left: 230,
          child: Icon(
            Icons.edit,
            size: 14.h,
            color: whiteColor,
          ).box.color(blueColor).roundedFull.p4.make(),
        ),
      ],
    ).onTap(() async {
      // Initiate an image change.
      await controller.changeImage(context);
      // Start showing a loading indicator.
      controller.isLoading(true);
      if (controller.profileImgPath.isNotEmpty) {
        // If an image is selected, upload the image.
        await controller.uploadProfileImage();
      } else {
        // If no image is selected, use the existing image URL.
        controller.profileImageLink = controller.snapshotData['store_ImageUrl'];
      }
      try {
        // Attempt to update the profile with the new image URL.
        await controller.updateStoreProfileImage(
          storemageUrl: controller.profileImageLink,
        );
        // Show a toast message indicating success.
        // ignore: use_build_context_synchronously
        VxToast.show(context,
            msg: "Profile image change successful", showTime: 10000);
      } catch (e) {
        // If an error occurs, show a toast message with the error.
        // ignore: use_build_context_synchronously
        VxToast.show(context, msg: "choose again | error $e");
        // Stop showing the loading indicator.
        controller.isLoading(false);
      }
    }).marginOnly(
      top: 10.h,
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
        padding: AppTheme.padding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          controller.snapshotData['store_name']
              .toString()
              .text
              .fontFamily(bold)
              .size(20.sp)
              .makeCentered(),
          controller.snapshotData['email']
              .toString()
              .text
              .fontFamily(regular)
              .size(14.sp)
              .makeCentered()
              .py(4.h),
        ]));
  }

  Widget _buildInputForm() {
    controller.storeNameController.text = controller.snapshotData['store_name'];
    controller.storeAddressController.text =
        controller.snapshotData['store_address'];
    controller.storeMobileController.text =
        controller.snapshotData['store_mobile'];
    controller.storeWebsiteController.text =
        controller.snapshotData['store_website'];
    controller.storeDescriptionController.text =
        controller.snapshotData['store_description'];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textField(
              labelText: APPCONST.name,
              hintText: APPCONST.name,
              controller: controller.storeNameController,
              onPressed: controller.storeNameController.clear,
              suffixIcon: Icons.clear),
          textField(
              labelText: APPCONST.name,
              hintText: APPCONST.name,
              controller: controller.storeAddressController,
              onPressed: controller.storeAddressController.clear,
              suffixIcon: Icons.clear),
          textField(
              labelText: APPCONST.name,
              hintText: APPCONST.name,
              controller: controller.storeMobileController,
              onPressed: controller.storeMobileController.clear,
              suffixIcon: Icons.clear),
          textField(
              labelText: APPCONST.name,
              hintText: APPCONST.name,
              controller: controller.storeWebsiteController,
              onPressed: controller.storeWebsiteController.clear,
              suffixIcon: Icons.clear),
          textField(
              labelText: APPCONST.name,
              hintText: APPCONST.name,
              controller: controller.storeDescriptionController,
              onPressed: controller.storeDescriptionController.clear,
              suffixIcon: Icons.clear,
              multline: true),
        ],
      ).p20(),
    );
  }

  Widget _buildSaveButton() {
    return Obx(
      () => controller.isLoading.value
          ? Center(
              child: loadingIndicator(),
            )
          : ourButton(
              color: [blueColor, const Color.fromARGB(255, 27, 57, 228)],
              textColor: lightYellowColor,
              title: APPCONST.save,
              onTap: () async {
                await controller.updateShop(
                  storeName: controller.storeNameController.text,
                  storeAddress: controller.storeAddressController.text,
                  storeMobile: controller.storeMobileController.text,
                  storeWebsite: controller.storeWebsiteController.text,
                  storeDescription: controller.storeDescriptionController.text,
                );
                // ignore: use_build_context_synchronously
                VxToast.show(context, msg: "Shop Updated");
              }).px20(),
    );
  }
}
