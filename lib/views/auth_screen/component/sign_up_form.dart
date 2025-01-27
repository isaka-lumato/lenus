import 'package:lenus1/component/app_text_field.dart';
import 'package:lenus1/component/loading_indicator.dart';
import 'package:lenus1/component/our_button.dart';
import 'package:lenus1/controllers/auth/auth_controller.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/views/auth_screen/component/agree_condition.dart';
import 'package:lenus1/views/auth_screen/component/have_account.dart';
import 'package:lenus1/views/auth_screen/component/welcome_text.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  // Controllers

  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRetypeController =
      TextEditingController();

  //sanitizing text entry
  void signupMethod(BuildContext context) {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String retypePassword = passwordRetypeController.text.trim();

    //signup
    _authController.signupMethod(
      context: context,
      name: name,
      email: email,
      password: password,
      retypePassword: retypePassword,
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WelcomeTextWidget(),
          20.h.heightBox,
          SimpleTextField(
            labelText: APPCONST.name,
            textEditingController: nameController,
            accentColor: darkBlueColor,
            textColor: Colors.black,
            // validator: controller.validateEmail(value),
          ),
          20.h.heightBox,
          SimpleTextField(
            labelText: APPCONST.email,
            textEditingController: emailController,
            accentColor: darkBlueColor,
            textColor: Colors.black,
            // validator: controller.validateEmail(value),
          ),
          20.h.heightBox,
          SimpleTextField(
            labelText: APPCONST.password,
            textEditingController: passwordController,
            accentColor: darkBlueColor,
            textColor: Colors.black,
            obscureText: true,
            // validator: controller.validateEmail(value),
          ),
          20.h.heightBox,
          SimpleTextField(
            labelText: APPCONST.confirmpassword,
            textEditingController: passwordRetypeController,
            accentColor: darkBlueColor,
            textColor: Colors.black,
            obscureText: true,
          ),
          20.h.heightBox,
      agreeConditionWidget(),
      
          //Login Buttons
          Obx(
            () => _authController.isLoading.value
                ? Center(child: loadingIndicator())
                : ourButton(
                    textColor: darkBlueColor,
                    title: "login",
                    onTap: () async {
                      _authController.isLoading(true);
                      await _authController.signupMethod(
                        context: context,
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        retypePassword: passwordRetypeController.text.trim(),
                      );
                      _authController.isLoading(false);
                      VxToast.show(context, msg: "Logged in");
                      //Get.offAll(() => const Home());
                      Get.offAll(() => const Messaging());
                    }),
          ),
          10.h.heightBox,
          alreadyHaveAccount(),
          10.h.heightBox,
        ],
      ),
    );
  }
}
