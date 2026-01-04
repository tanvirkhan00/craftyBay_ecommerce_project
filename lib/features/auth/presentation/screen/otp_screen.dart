import 'package:ecommerce_project/features/auth/presentation/provider/verify_otp_provider.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:ecommerce_project/features/common/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/center_circular_progress.dart';
import '../../data/model/verify_otp_params.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;
  static const String name = "/otp-screen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();



  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  SizedBox(height: 8,),
                  SvgPicture.asset("assets/images/logo.svg", height: 100,),
                  Text("Enter Your OTP Code",
                    style: textTheme.headlineLarge?.copyWith(fontWeight: .bold),),
                  Text("A 4 digit OTP code hase been sent",
                    style: TextStyle(fontWeight: .w300),),
                  SizedBox(height: 8,),
                  Pinput(
                    mainAxisAlignment: .spaceBetween,
                    controller: _otpController,
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                  ),
                  Consumer<VerifyOtpProvider>(
                    builder: (context,_,_) {
                      if (_verifyOtpProvider.isVerifyOtpInProgress) {
                        return CenterCircularProgress();
                      } else {
                        return FilledButton(onPressed: _onTapOtpButton, child: Text(
                            "Next"));
                      }
                    }
                  ),
                  RichText(text: TextSpan(
                      text: "This code will expire in",
                      style: TextStyle(fontWeight: .w300),
                      children: [
                        TextSpan(
                            text: "120s",
                            style: TextStyle(color: Colors.tealAccent)
                        )
                      ]
                  )),
                  Text("Resend Code", style: TextStyle(fontWeight: .w300),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapOtpButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }


  Future<void> _verifyOtp() async {
    VerifyOtpParams params= VerifyOtpParams(
      email: widget.email,
      otp: _otpController.text,
    );
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);
    if(isSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) =>false);
    } else {
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
  }



//.......... PinCode Box Widgets.............//
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(12),
    ),
  );

}

