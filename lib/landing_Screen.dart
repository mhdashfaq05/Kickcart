import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kickcart_admin/colourconst.dart';
import 'package:kickcart_admin/feature/user_auth/screens/homePage.dart';
import 'package:kickcart_admin/imageconst.dart';

import 'main.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),

          colors: [
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ], // Gradient from
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h * 0.7,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                      color: ColorConst.home,
                      borderRadius:
                          BorderRadius.all(Radius.circular(w * 0.01))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConst.logo,
                            width: w * 0.1,
                          ),
                        ],
                      ),
                      Container(
                        height: h * 0.05,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * 0.01))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              ImageConst.googleSvg,
                              width: w * 0.03,
                            ),
                            Text(
                              "     Login With",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: h * 0.07,
                        width: w * 0.3,
                        //color: Colors.red,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          //controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.01),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            label: const Text("Enter your email"),
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(w * 0.02)),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.07,
                        width: w * 0.3,
                        //color: Colors.red,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // controller: passwordController,
                          style: const TextStyle(color: Colors.white),
                          //controller: name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.01),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            label: const Text("Password"),
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(w * 0.02)),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home_page(),
                              ));
                        },
                        child: Container(
                          width: w * 0.15,
                          height: w * 0.035,
                          decoration: BoxDecoration(
                              color: ColorConst.containerColour,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(w * 0.03))),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
