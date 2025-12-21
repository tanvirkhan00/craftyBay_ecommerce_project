import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/otp_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

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
                Text("Sign In", style: textTheme.headlineMedium?.copyWith(fontWeight: .w700),),
                Text("Login your account with your email and password", style: textTheme.bodyLarge,textAlign: .center,),
                const SizedBox(height: 16),
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
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(hintText: 'Your Password'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Password";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(onPressed: _onTapForgetButton, child: Text("Forgot Password") )
                  ],
                ),
                FilledButton(onPressed: _signInButton, child: Text("Sign Ip")),
                RichText(text: TextSpan(
                    text: "Haven't any account? ",
                    children: [
                      TextSpan(
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .w800
                          ),
                          text: "Sing Up",
                          recognizer: TapGestureRecognizer()..onTap = _signUpButton
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

  void _onTapForgetButton() {}

  void _signInButton() {
    Navigator.pushNamed(context, OtpScreen.name);
  }
  void _signUpButton() {
    Navigator.pop(context);
  }

}
