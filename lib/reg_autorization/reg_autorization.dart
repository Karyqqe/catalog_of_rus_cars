import 'package:flutter/material.dart';

import 'package:untitled1/colors/colors.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isMale = true;
  bool? isSignupScreen = true;
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://avatars.mds.yandex.net/get-autoru-vos/10868311/78073051d5a8c48fbdded5e03c55746a/1200x900n',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color.fromARGB(151, 83, 128, 165).withOpacity(.70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome to',
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 25,
                          color: Colors.yellow[700],
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen == true
                                ? " Lada's Shop"
                                : ' Back',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isSignupScreen == true
                          ? 'Signup to Continue'
                          : 'Signin to Continue',
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen == true ? 230 : 240,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              padding: const EdgeInsets.all(20),
              height: isSignupScreen == true ? 380 : 250,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen == false
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignupScreen == false)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: isSignupScreen == false
                                      ? Colors.orange
                                      : Colors.transparent,
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen == true
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignupScreen == true)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: isSignupScreen == true
                                      ? Colors.orange
                                      : Colors.transparent,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen == true) buildSignupSection(),
                    if (isSignupScreen == false) buildSignInSection()
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen == true
                    ? 'Or sign up with'
                    : 'Or sign in with'),
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(Icons.facebook_outlined, 'Facebook',
                          Palette.facebookColor),
                      buildTextButton(
                          Icons.elderly, 'Google', Palette.googleColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildSignInSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.email, 'info@demori.com', false, true),
          buildTextField(Icons.password, '**********', true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    onChanged: (value) {
                      setState(
                            () {
                          isRememberMe == false;
                        },
                      );
                    },
                  ),
                  const Text(
                    'Remeber me',
                    style: TextStyle(fontSize: 12, color: Palette.textColor1),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 12, color: Palette.textColor1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.account_box_sharp, 'User Name', false, false),
          buildTextField(Icons.email_outlined, 'email', false, false),
          buildTextField(Icons.password, 'password', false, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                          isMale ? Palette.textColor2 : Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.male,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                          isMale ? Colors.transparent : Palette.textColor2,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Palette.textColor1
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.female,
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By pressing 'Submit' you agree to our ",
                style: TextStyle(color: Palette.textColor2),
                children: [
                  TextSpan(
                    //recognizer: ,
                    text: "term & conditions",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: const Size(160, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: backgroundColor,
        iconColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildBottomHalfContainer(bool showShadow) {
    return Positioned(
      top: isSignupScreen == true ? 570 : 450,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 235, 235),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1)),
            ],
          ),
          child: showShadow == false
              ? ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/to_product_list');
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          )
              : const Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        obscureText: isPassword,
        keyboardType:
        isEmail == true ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 129, 129, 129),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
