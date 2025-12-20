import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              children: [
                appLogo(),
                Text("Sign Up", style: textTheme.headlineMedium?.copyWith(fontWeight: .w700),),
                Text("Get started with your details", style: textTheme.bodyLarge,),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .name,
                  decoration: InputDecoration(hintText: 'Your First Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .name,
                  decoration: InputDecoration(hintText: 'Your Last Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Last Name";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Your Email'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Email";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .number,
                  decoration: InputDecoration(hintText: 'Your number'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Number";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .streetAddress,
                  decoration: InputDecoration(hintText: 'Your City'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Valid Address";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Your Password'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Password";
                    } else {
                      return null;
                    }
                  },
                ),
                FilledButton(onPressed: _signUpButton, child: Text("Sign Up")),
                RichText(text: TextSpan(
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: .w800
                      ),
                      text: "Sing In",
                      recognizer: TapGestureRecognizer()..onTap = _signInButton
                    ),

                  ]
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUpButton() {}
  void _signInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

}
