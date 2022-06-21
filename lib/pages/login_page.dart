import 'package:flutter/material.dart';
import 'package:ybc_manager/pages/forget_password_page.dart';
import 'package:ybc_manager/pages/main_page.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/widgets/long_button.dart';
import 'package:ybc_manager/widgets/my_snackbar.dart';
import 'package:ybc_manager/widgets/small_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggingIn = false;
  bool passwordVisibility = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  showSnackBar(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: AppColor.error, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20, // Inner padding for SnackBar content.
        ),
        backgroundColor: AppColor.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )));
  }

  _loginPage() => SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 50),
            _loginForm(),
          ],
        ),
      );
  _header() => Container(
        margin: const EdgeInsets.only(right: 20),
        width: double.infinity,
        child: const Image(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/login_header_01.png"),
        ),
      );
  _loginForm() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(fontSize: 16),
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColor.primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: AppColor.navColor,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: passwordVisibility,
              keyboardType: TextInputType.text,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 16),
                prefixIcon: Icon(
                  Icons.password,
                  color: AppColor.primaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  icon: Icon(
                    passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColor.primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: AppColor.navColor,
              ),
            ),
            const SizedBox(height: 20),
            LongButton(
              onPress: () async {
                setState(() {
                  isLoggingIn = true;
                });
                await Future.delayed(const Duration(seconds: 1));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              text: "LOGIN",
              isLoading: isLoggingIn,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage()));
                },
                child: SmallText(
                  text: "Forget password?",
                  color: AppColor.primaryColor,
                ))
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: _loginPage(),
    );
  }
}
