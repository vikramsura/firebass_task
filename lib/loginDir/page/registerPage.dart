import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/loginDir/provider/registerProvider.dart';
import 'package:task_firebase/shared/auth/routes.dart';
import 'package:task_firebase/shared/constant/appButton.dart';
import 'package:task_firebase/shared/constant/app_details.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';
import 'package:task_firebase/shared/constant/snack_bar_toast.dart';
import 'package:task_firebase/shared/widget/textFieldWidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return ChangeNotifierProvider<RegisterProvider>(create: (_) {
      return RegisterProvider();
    }, child: Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Stack(
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppFontSize.font10),
                    child: Column(
                      children: [
                        SizedBox(height: AppFontSize.font50),
                        Text(AppDetails.appName,
                            style: TextStyle(
                                color: AppColors.blue,
                                fontSize: AppFontSize.font30,
                                fontWeight: FontWeight.bold)),
                        const Text("Register"),
                        SizedBox(height: AppFontSize.font50),
                        TextFieldFieldWidget(
                            controller: provider.nameController,
                            hintText: "Enter Name",
                            obscureText: false),
                        SizedBox(height: AppFontSize.font20),
                        TextFieldFieldWidget(
                            controller: provider.emailController,
                            hintText: "Enter Email",
                            obscureText: false),
                        SizedBox(height: AppFontSize.font20),
                        Container(height: AppFontSize.font50,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(AppFontSize.font14),border: Border.all(color: AppColor.fieldBorderColor(context))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  provider.showCountryPicker(context);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(width: AppFontSize.font10),
                                    Icon(Icons.phone, size: 20),
                                    SizedBox(width: AppFontSize.font6),
                                    provider.countryCode == null ||
                                        provider.countryCode
                                            .toString()
                                            .isEmpty
                                        ? SizedBox()
                                        : Text(
                                      provider.countryCode,
                                    ),
                                    SizedBox(width: AppFontSize.font18),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                    controller: provider.phoneController,
                                    textAlignVertical: TextAlignVertical.top,
                                    maxLines: 1,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "00000 00000",
                                    )),
                              ),
                            ],
                          ),
                        ),
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
                              if (provider.emailController.text
                                      .trim()
                                      .isEmpty &&
                                  provider.passwordController.text
                                      .trim()
                                      .isEmpty &&
                                  provider.nameController.text.trim().isEmpty &&
                                  provider.phoneController.text
                                      .trim()
                                      .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(context,
                                    "Please enter name, email,phone Number and password");
                              } else if (provider.nameController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter name");
                              } else if (provider.emailController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter email");
                                }
                              else if (provider.phoneController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter phone Number");
                              }
                              else if (provider.phoneController.text
                                  .trim()
                                  .length<10) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter Valid phone Number");
                              }
                              else if (provider.passwordController.text
                                  .trim()
                                  .isEmpty) {
                                AppSnackBarToast.showSnackBarToast(
                                    context, "Please enter password");
                              } else {
                                provider.userSignUp(context);
                              }
                            },
                            child:
                                AppButtons.elevatedButton("Register", context)),
                        SizedBox(height: AppFontSize.font30),
                        Text.rich(TextSpan(
                            text: "Already an account ",
                            style: TextStyle(
                              fontSize: AppFontSize.font16,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: "login".toUpperCase(),
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: AppFontSize.font16,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutes.loginPage,
                                          (route) => false);
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
                child: Scaffold(
                  backgroundColor: Colors.black45,
                  body: Center(
                    child: CircularProgressIndicator(
                        color: AppColor.fieldBorderColor(context)),
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
