import 'package:bs_mechanic/screens/landing_page.dart';
import 'package:bs_mechanic/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: purple,
        child: GestureDetector(
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
                            FontAwesomeIcons.solidEnvelope,
                            color: textWhite,
                          ),
                        ),
                        labelText: 'Enter OTP',
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
                    padding: EdgeInsets.only(left: width(context) * 0.63),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: textWhite,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height(context) * 0.02),
                    child: SizedBox(
                      width: width(context) * 0.8,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: textWhite,
                          backgroundColor: orange,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            _landingPageRoute(),
                          );
                        },
                        child: const Text(
                          'Verify',
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
      ),
    );
  }
}

Route _landingPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => const LandingPage(),
    transitionsBuilder: (c, anim, a2, child) =>
        FadeTransition(opacity: anim, child: child),
    transitionDuration: const Duration(milliseconds: 1000),
  );
}
