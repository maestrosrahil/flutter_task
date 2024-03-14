import 'package:flutter/material.dart';
import 'package:flutter_task/screen/home_screen.dart';


import '../components/custom_button_widget.dart';
import '../components/custom_loader_widget.dart';
import '../components/custom_text_field_widget.dart';
import '../components/custom_text_widget.dart.dart';
import '../components/new_user_widget.dart';
import '../helper/size_config.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isvisible = true;
  bool islogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  children: [
                    SizedBox(height: 25.0),
                    Image.asset(
                      'assets/images/demo.png',
                      height: SizeConfig.height() / 4.8,
                      width: SizeConfig.width() / 2.0,
                    ),
                    const SizedBox(height: 25.0),
                    CustomTextWidget(
                        text: 'Login',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                        textColor: Theme.of(context).primaryColorLight),
                    const SizedBox(height: 10.0),
                    CustomTextWidget(
                        text: 'Please enter your mobile and Login.',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        textColor: Theme.of(context).hintColor),
                    const SizedBox(height: 25.0),
                    CustomTextFieldWidget(
                        hintText: 'Enter  / Email',
                        controller: _emailcontroller,
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        prefixIcon: Icons.phone_android_rounded),
                    const SizedBox(height: 10.0),
                    CustomPasswordFieldWidget(
                      hintText: 'Enter Password',
                      controller: _passwordcontroller,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      prefixIcon: Icons.password_sharp,
                      isPasswordVisible: isvisible,
                      onPasswordView: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                    ),
                    const SizedBox(height: 15.0),

                    SizedBox(height: 45.0),
                    islogin
                        ? CustomLoaderWidget()
                        : CustomButtonWidget(
                      text: 'Login',
                      onClick: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                       // login();
                      },
                    ),
                    const SizedBox(height: 35.0),
                    NewUserWidget(

                        onClick: () {


                        },
                        firstTitle: "Don't have an Account? ",
                        secondTitle: 'Sign up'),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
