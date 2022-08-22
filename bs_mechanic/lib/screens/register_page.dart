import 'package:bs_mechanic/screens/otp_page.dart';
import 'package:bs_mechanic/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).requestFocus(FocusNode())},
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: purple,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height(context) * 0.2),
                  child: SizedBox(
                    width: width(context) * 0.8,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.1,
                  ),
                  child: const TextField(
                    style: TextStyle(
                      letterSpacing: 1.0,
                      color: textWhite,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Align(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: FaIcon(
                          FontAwesomeIcons.mobile,
                          color: textWhite,
                        ),
                      ),
                      labelText: 'Enter your Mobile Number',
                      labelStyle: TextStyle(color: textWhite),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textWhite),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: orange),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height(context) * 0.08),
                  child: SizedBox(
                    width: width(context) * 0.8,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: textWhite,
                        backgroundColor: orange,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          _otpPageRoute(),
                        );
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _otpPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => const OtpPage(),
    transitionsBuilder: (c, anim, a2, child) =>
        FadeTransition(opacity: anim, child: child),
    transitionDuration: const Duration(milliseconds: 1000),
  );
}
