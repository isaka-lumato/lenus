import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenus1/component/extentions.dart';
import 'package:lenus1/component/image.dart';
import 'package:lenus1/component/loading_indicator.dart';
import 'package:lenus1/component/our_button.dart';
import 'package:lenus1/controllers/auth/auth_controller.dart';
import 'package:lenus1/controllers/profile/profile_controller.dart';
import 'package:lenus1/services/firestore_services.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/utils/firebase_consts.dart';
import 'package:lenus1/utils/images.dart';
import 'package:lenus1/views/Authentication/signin.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';
import 'package:lenus1/views/profile/profile_edit_screen.dart';
import 'package:lenus1/views/profile/profile_setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            _buildProfileWidget(),
            _buildSettingList(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileWidget() {
  return GlassmorphicContainer(
    height: 140.h,
    width: AppConstants.fullWidth() - 24.w,
    borderRadius: 15.r,
    blur: 40,
    alignment: Alignment.bottomCenter,
    border: 1.r,
    linearGradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0x212943FF),
        Color(0x22296eff),
        Color(0x222958ff),
      ],
      stops: [0.5, 0.75, 0.92],
      tileMode: TileMode.clamp,
      transform: GradientRotation(180),
    ),
    borderGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color((0xFFFFFFFF)).withOpacity(0.1),
        const Color.fromARGB(255, 115, 179, 252).withOpacity(0.3),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileHeaderSetting(),
        10.h.heightBox,
        _buildProfileHeader(),
      ],
    ).paddingSymmetric(vertical: 10.w, horizontal: 10.h),
  );
}

Widget _buildProfileHeader() {
  var controller = Get.find<ProfileController>();
  return FutureBuilder<QuerySnapshot>(
    future: FirestoreServices.getUser(currentUser!.uid),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(child: loadingIndicator());
      } else {
        controller.snapshotData = snapshot.data!.docs[0];
        String storeName = controller.snapshotData['name'];
        String storeEmail = controller.snapshotData['email'];
        String storeImage = controller.snapshotData['ImageUrl'];
        return _buildStoreProfileInfo(storeName, storeEmail, storeImage);
      }
    },
  );
}

Widget _buildProfileHeaderSetting() {
  return SizedBox(
    height: 30.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Icon(
            Icons.menu,
            size: 26.sp,
            color: textDark,
          ),
        ),
      ],
    ),
  );
}

Widget _buildStoreProfileInfo(
    String storeName, String storeEmail, String storeImage) {
  return Row(
    children: [
      _buildProfileImage(image: storeImage).marginOnly(right: 12.w),
      _buildStoreInfo(storeName, storeEmail),
    ],
  );
}

Widget _buildProfileImage({
  required String? image,
}) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: darkBlueColor.withAlpha(100),
              blurRadius: 10.r,
              spreadRadius: 50.r,
            ),
          ],
        ),
        child: image == ''
            ? Image.asset(phUser, width: 75.w, height: 75.h, fit: BoxFit.cover)
            : AppImage(
                imageUrl: image!,
                width: 75,
                height: 75,
                radius: 8,
              ),
      ),
    ),
  );
}

Widget _buildStoreInfo(String storeName, String storeEmail) {
  return SizedBox(
    height: 75.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(storeName, style: AppTheme.h1Style),
        Text(storeEmail, style: AppTheme.h3Style),
      ],
    ),
  );
}

Widget _buildSettingList(BuildContext context) {
  return SizedBox(
    height: AppConstants.fullHeight() * 0.7,
    child: SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(title: "Store Marketing"),
          _buildSettingListItem(
            settingText: "Messages",
            icon: Icons.mail,
            onTap: () {
              Get.to(() => const Messaging());
            },
          ),
          _buildHeader(title: "Store Management"),
          _buildSettingListItem(
            settingText: "Edit User Profile",
            icon: Icons.manage_accounts_sharp,
            onTap: () {
              Get.to(() => const EditProfileScreen());
            },
          ),
          10.h.heightBox,
          _buildSettingListItem(
            settingText: "Store Setting",
            icon: Icons.store,
            onTap: () {
              Get.to(() => const StoreSettingsScreen());
            },
          ),
          _buildHeader(title: "Settings"),
          _buildSettingListItem(
            settingText: "Dark theme",
            icon: Icons.sunny,
            onTap: () {
              Get.bottomSheet(Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.wb_sunny_outlined),
                    title: const Text("Light Themes"),
                    onTap: () => {Get.changeTheme(ThemeData.light())},
                  ),
                  ListTile(
                    leading: const Icon(Icons.wb_sunny),
                    title: const Text("Dark Themes"),
                    onTap: () => {Get.changeTheme(ThemeData.dark())},
                  ),
                ],
              ));
            },
          ),
          _buildHeader(title: "Support"),
          _buildSettingListItem(
            settingText: "Help center",
            icon: Icons.new_releases,
            onTap: () {
              Get.to(() => const Messaging());
            },
          ),
          10.h.heightBox,
          _buildLogOutButton(context),
        ],
      ).marginSymmetric(horizontal: 12.w, vertical: 12.h),
    ),
  );
}

Widget _buildSettingListItem({
  required String settingText,
  required IconData icon,
  required Function() onTap,
}) {
  return Row(
    children: [
      _buildSettingIcon(icon),
      10.w.widthBox,
      Text(
        settingText,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: semibold,
          color: textDark,
        ),
      ),
    ],
  ).box.height(60.h).roundedSM.make().ripple(onTap);
}

Widget _buildSettingIcon(icon) {
  return GlassmorphicContainer(
      height: 50.h,
      width: 50.w,
      borderRadius: 10.r,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0.5.w,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          blueColor.withOpacity(0.2),
          blueColor.withOpacity(0.3),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: 22.sp,
          color: blueColor,
        ),
      ));
}

Widget _buildHeader({required String title}) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: bold,
          fontSize: 24.sp,
          color: textDark,
        ),
      ).pOnly(bottom: 5.h, top: 10.h),
    ],
  );
}

Widget _buildLogOutButton(BuildContext context) {
  return ourButton(
    color: [
      const Color(0x4c2943ff),
      const Color(0x4c296eff),
      const Color(0x4c2958ff),
    ],
    colorArr: [
      0.1,
      0.8,
      1,
    ],
    colorBorder: [
      const Color.fromARGB(255, 41, 66, 255),
      const Color.fromARGB(255, 41, 109, 255).withOpacity(.1),
    ],
    title: "Log Out",
    onTap: () async {
      await Get.put(AuthController()).signoutMethod(context);
      Get.offAll(() => SignIn());
      VxToast.show(context, msg: APPCONST.loggedOut);
    },
  );
}
