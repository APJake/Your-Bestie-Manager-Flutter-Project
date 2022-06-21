import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/widgets/small_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  _forgetPassword() => const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SmallText(
            text:
                "လခွမ်း အဲ့အတွက်တော့ရေးမထားဘူး\nကိုယ့် password ကိုယ်သေချာမှတ်လေ သြော်",
            color: AppColor.primaryColor,
            textAlign: TextAlign.center,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: _forgetPassword(),
    );
  }
}
