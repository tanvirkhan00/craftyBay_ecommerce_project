import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/features/auth/data/model/sign_up_params.dart';
import 'package:ecommerce_project/features/auth/presentation/provider/sign_up_provider.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/otp_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpProvider _signUpProvider = SignUpProvider();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (_) => _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                child: Column(
                  spacing: 8,
                  children: [
                    appLogo(),
                    Text(
                      "Sign Up",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .w700,
                      ),
                    ),
                    Text(
                      "Get started with your details",
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _firstNameController,
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
                      controller: _lastNameController,
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
                      controller: _phoneController,
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
                      controller: _cityController,
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
                      controller: _passwordController,
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
                    Consumer<SignUpProvider>(
                      builder: (context, signUpProvider, child) {
                        return Visibility(
                          visible: signUpProvider.isSignUpInProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: FilledButton(
                            onPressed: _signUpButton,
                            child: Text("Sign Up"),
                          ),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .w800,
                            ),
                            text: "Sing In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = _signInButton,
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

  void _signUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    final bool isSuccess = await _signUpProvider.signUp(
      SignUpParams(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        city: _cityController.text.trim(),
        password: _passwordController.text,
      ),
    );
    if (isSuccess) {
      Navigator.pushNamed(context, OtpScreen.name);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_signUpProvider.errorMessage!)));
    }
  }

  void _signInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
