import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/ui/pages/home_page/home_page.dart';
import 'package:chat_app/ui/pages/login_page/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 49),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenUtil().statusBarHeight + 8,
          ),
          _buildAnimatedText(),
          const Expanded(
            child: SizedBox(),
          ),
          _buildTextField("Email", loginBloc.emailCtrl),
          const SizedBox(
            height: 4,
          ),
          _buildTextField("Password", loginBloc.passwordCtrl),
          const SizedBox(
            height: 16,
          ),
          _buildContinueButton(context),
          const SizedBox(
            height: 12,
          ),
          _buildDontHaveAccount(context),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  _buildContinueButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 4, 27, 66),
          fixedSize: const Size(double.maxFinite, 55),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ), (route) => false);
        },
        child: const Text(
          "Register",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "Lato"),
        ),
      ),
    );
  }

  _buildAnimatedText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(
            speed: const Duration(milliseconds: 20),
            "Please enter your email and create password. You can enter them when you come to app again.",
            textStyle: const TextStyle(
                fontSize: 18, fontFamily: "Regular", color: Colors.white),
          ),
        ],
      ),
    );
  }

  _buildDontHaveAccount(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        const Text(
          "Already have an account?  ",
          style:
              TextStyle(fontSize: 12, fontFamily: "Lato", color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const RegisterPage();
                },
              ),
            );
          },
          child: const Text(
            "Sign in",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  _buildTextField(String hint, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: ctrl,
        cursorColor: const Color.fromARGB(255, 1, 19, 49),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              fontFamily: "Lato"),
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
