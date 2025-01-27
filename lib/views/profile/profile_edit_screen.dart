import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;
import 'package:lenus1/component/app_text_field2.dart';
import 'package:lenus1/component/loading_indicator.dart';
import 'package:lenus1/component/our_button.dart';
import 'package:lenus1/controllers/profile/profile_controller.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xfffbfbfb),
        title: "Edit Profile".text.make().marginOnly(top: 5),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new, color: darkBlueColor)
            .onTap(() {
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
        ),
      ),
      bottomNavigationBar: _buildJoinDate(),
    );
  }

  Widget _buildProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileImage(),
        _buildProfileDetails(),
      ],
    );
  }

  Widget _buildProfileImage() {
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
                () => controller.snapshotData['imageUrl'] == '' &&
                        controller.profileImgPath.isEmpty
                    ? Image.asset(phUser,
                        width: 100.w, height: 100.h, fit: BoxFit.cover)
                    :
                    //if data is not empty but controller path is empty
                    controller.snapshotData['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            controller.snapshotData['imageUrl'],
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                          )
                        :
                        //if both are empty
                        Image.file(File(controller.profileImgPath.value),
                            width: 100.w, height: 100.h, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.h,
          left: 230.w,
          child: Icon(
            Icons.edit,
            size: 14.sp,
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
        controller.profileImageLink = controller.snapshotData['imageUrl'];
      }
      try {
        // Attempt to update the profile with the new image URL.
        await controller.updateProfileImage(
          imageUrl: controller.profileImageLink,
        );
        // Show a toast message indicating success.
        // ignore: use_build_context_synchronously
        VxToast.show(context,
            msg: "Profile image change successful", showTime: 200);
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
          controller.snapshotData['username']
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
    controller.nameController.text = controller.snapshotData['username'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textField(
            labelText: APPCONST.username,
            hintText: APPCONST.usernameHint,
            controller: controller.nameController,
            onPressed: controller.nameController.clear,
            suffixIcon: Icons.clear),
        30.h.heightBox,
        textField(
            labelText: APPCONST.oldPassword,
            hintText: APPCONST.password,
            controller: controller.oldPasswordController,
            onPressed: controller.oldPasswordController.clear,
            suffixIcon: Icons.clear),
        textField(
            labelText: APPCONST.newPassword,
            hintText: APPCONST.password,
            controller: controller.newPasswordController,
            onPressed: controller.newPasswordController.clear,
            suffixIcon: Icons.clear),
      ],
    ).p20();
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
                controller.isLoading(true);

                if (await controller.snapshotData['password'] ==
                    controller.oldPasswordController.text) {
                  await controller.changeAuthPassword(
                      email: controller.snapshotData['email'],
                      password: controller.oldPasswordController.text,
                      newPassword: controller.newPasswordController.text);

                  await controller.updateProfile(
                    storename: controller.nameController.text,
                    password: controller.newPasswordController.text,
                  );
                  controller.oldPasswordController.clear();
                  controller.newPasswordController.clear();
                } else if (controller
                        .oldPasswordController.text.isEmptyOrNull &&
                    controller.newPasswordController.text.isEmptyOrNull) {
                  await controller.updateProfile(
                    storename: controller.nameController.text,
                    password: controller.snapshotData['password'],
                  );
                  // ignore: use_build_context_synchronously
                  VxToast.show(context, msg: "Fill store name and Password");
                } else {
                  // ignore: use_build_context_synchronously
                  VxToast.show(context, msg: "Wrong old password");
                  controller.isLoading(false);
                }
              }).px(20.w),
    );
  }

  Widget _buildJoinDate() {
    return Row(
      children: [
        "Joined at "
            .text
            .size(14.sp)
            .fontFamily(medium)
            .color(blueColor.withAlpha(200))
            .make(),
        intl.DateFormat('yyyy-MM-dd')
            .format(controller.snapshotData['created_on'].toDate())
            .text
            .fontFamily(semibold)
            .make(),
      ],
    )
        .box
        .color(
          const Color(0xfff7f7f7),
        )
        .make()
        .paddingSymmetric(horizontal: 20.w, vertical: 20.h);
  }
}
