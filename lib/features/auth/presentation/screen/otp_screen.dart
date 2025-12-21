import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const String name = "otp-screen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: .center,
            spacing: 8,
            children: [
              SizedBox(height: 8,),
              SvgPicture.asset("assets/images/logo.svg", height: 100,),
              Text("Enter Your OTP Code", style: textTheme.headlineLarge?.copyWith(fontWeight: .bold),),
              Text("A 4 digit OTP code hase been sent", style: TextStyle(fontWeight: .w300),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: .spaceAround,
                children: List.generate(4, (index) => _otpBox(index),),
              ),
              FilledButton(onPressed: (){}, child: Text("Next")),
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
    );
  }

  // ** Pin code package import kore oo kora jay // **
  Widget _otpBox (int index) {
   return SizedBox(
     width: 50,
     height: 70,
     child: TextField(
       keyboardType: .number,
       maxLength: 1,
       textAlign: .center,
       decoration: InputDecoration(
         counterText: "",
       ),
     ),
   );
  }

}
