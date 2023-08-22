import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  String? isEnable;
  String? isEnablePassword;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.keyboard_backspace,
                size: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "Login to your Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 12),
              child: TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    isEnable = "Email bo'sh bo'lmasligi kerak!";
                  } else if (!(value.contains("@"))) {
                    isEnable = "@ belgisi albatta bo'lishi shart!";
                  } else if (!(value.endsWith(".com"))) {
                    isEnable = " .com bn tugashi kerak";
                  } else {
                    isEnable = null;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBC0063),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  errorText: isEnable,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.5),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  fillColor: Color.fromRGBO(217, 217, 217, 0.5),
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: (isEnable != null)
                        ? Icon(
                            Icons.email,
                            size: 20,
                            color: Color(0xFFBC0063),
                          )
                        : Icon(
                            Icons.email,
                            size: 20,
                          ),
                  ),
                  hintText: "  Email",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: "Mons",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 13,
                right: 20,
              ),
              child: TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    isEnablePassword = "Password bo'sh bo'lmasligi kerak!";
                  } else if (!value.contains(RegExp(r'[0-9]'))) {
                    isEnablePassword = "Son qatnashishi kerak!";
                  } else if (!value.contains(RegExp(r'[A-Z]'))) {
                    isEnablePassword = "Katta harf qatnashishi kerak!";
                  } else if (!value.contains(RegExp(r'[a-z]'))) {
                    isEnablePassword = "Kichkina harf qatnashishi kerak!";
                  } else if (value.length < 9) {
                    isEnablePassword =
                        "Password uzunligi 8 tadan kam bolishi mumkin emas!";
                  } else {
                    isEnablePassword = null;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBC0063),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  errorText: isEnablePassword,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.5),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    child: (isEnablePassword != null)
                        ? (!isVisible)
                            ? const Icon(
                                Icons.visibility_off,
                                color: Color(0xFFBC0063),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Color(0xFFBC0063),
                              )
                        : (!isVisible)
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(
                                Icons.visibility,
                              ),
                  ),
                  fillColor: const Color.fromRGBO(217, 217, 217, 0.5),
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: (isEnablePassword != null)
                        ? Icon(
                            Icons.lock,
                            size: 20,
                            color: Color(0xFFBC0063),
                          )
                        : Icon(
                            Icons.lock,
                            size: 20,
                          ),
                  ),
                  hintText: "  Password",
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Mons",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                obscuringCharacter: "*",
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    activeColor: Color(0xFFBC0063),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      isChecked = value!;
                      setState(() {});
                    }),
                Text(
                  "Remember me",
                  style: TextStyle(
                    color: Color(0xFFBC0063),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Color(0xFFBC0063),
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  "Forgot the password?",
                  style: TextStyle(color: Color(0xFFBC0063), fontSize: 13),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 10),
              child: Center(
                child: Text(
                  "--------------------  or continue  with  --------------------",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 53,
                      width: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/logos/facebook.png"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 53,
                      width: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/logos/google.png"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 53,
                      width: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/logos/apple.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: "Mons",
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          fontFamily: "Mons",
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFBC0063),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
