import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/loginDir/provider/loginProvider.dart';
import 'package:task_firebase/shared/auth/routes.dart';
import 'package:task_firebase/shared/constant/appButton.dart';
import 'package:task_firebase/shared/constant/app_details.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';
import 'package:task_firebase/shared/constant/snack_bar_toast.dart';
import 'package:task_firebase/shared/widget/textFieldWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return ChangeNotifierProvider<LoginProvider>(create: (_) {
      return LoginProvider();
    }, child: Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Stack(
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppFontSize.font12),
                    child: Column(
                      children: [
                        SizedBox(height: AppFontSize.font50),
                        Text(AppDetails.appName,
                            style: TextStyle(
                                color: AppColors.blue,
                                fontSize: AppFontSize.font30,
                                fontWeight: FontWeight.bold)),
                        Text("Login"),
                        SizedBox(height: AppFontSize.font50),
                        TextFieldFieldWidget(
                            controller: provider.emailController,
                            hintText: "Enter Email",
                            obscureText: false),
                        SizedBox(height: AppFontSize.font20),
                        TextFieldFieldWidget(
                            controller: provider.passwordController,
                            hintText: "Enter Password",
                            obscureText: provider.isPasswordShow,
                            isSuffixIcon: true,
                            icon: provider.isPasswordShow
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onPressed: () {
                              provider.setShowPassword();
                              // setState(() {});
                            }),
                        SizedBox(height: AppFontSize.font50),
                        InkWell(
                            onTap: () {
                              if (provider.emailController.text.trim().isEmpty &&
                                  provider.passwordController.text
                                      .trim()
                                      .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter email and password");
                              } else if (provider.emailController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter email");
                              } else if (provider.passwordController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter password");
                              } else {
                                provider.userSign(context);
                              }
                            },
                            child: AppButtons.elevatedButton("Login", context)),
                        SizedBox(height: AppFontSize.font30),
                        Text.rich(
                            TextSpan(text: "New Member  ",style: TextStyle(
                                fontSize: AppFontSize.font16,
                               ), children: <InlineSpan>[
                          TextSpan(
                              text: "sign up ".toUpperCase(),style: TextStyle(
                            color: AppColors.blue,
                            fontSize: AppFontSize.font16,
                            fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoutes.registerPage, (route) => false);
                                })
                        ])),
                        SizedBox(height: AppFontSize.font4),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: provider.isLoading,
                child:  Scaffold(
                  backgroundColor: Colors.black45,
                  body: Center(
                    child: CircularProgressIndicator(color:AppColor.fieldBorderColor(context)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
