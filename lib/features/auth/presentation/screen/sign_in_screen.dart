import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/presentation/screen/main_nav_holder_screen.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';
import '../../data/model/sign_in_params.dart';
import '../provider/sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignInProvider _signInProvider = SignInProvider();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (_) => _signInProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    appLogo(),
                    Text(
                      "Sign In",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .w700,
                      ),
                    ),
                    Text(
                      "Login your account with your email and password",
                      style: textTheme.bodyLarge,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
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
                      controller: _passwordController,
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
                        TextButton(
                          onPressed: _onTapForgetButton,
                          child: Text("Forgot Password"),
                        ),
                      ],
                    ),
                    Consumer<SignInProvider>(
                      builder: (context, _, _) {
                        if (_signInProvider.isSignInProgress) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _signInButton,
                          child: Text("Sign Ip"),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Haven't any account? ",
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .w800,
                            ),
                            text: "Sing Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = _signUpButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapForgetButton() {}

  void _signInButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    SignInParams params = SignInParams(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    final bool isSuccess = await _signInProvider.signIn(params);
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, _signInProvider.errorMessage!);
    }
  }

  void _signUpButton() {
    Navigator.pop(context);
  }
}
