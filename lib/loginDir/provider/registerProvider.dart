import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_firebase/loginDir/service/registerService.dart';
import 'package:task_firebase/shared/auth/routes.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  bool isPasswordShow = true;
  String selectedCountry = "INDIA";
  String countryCode = "+91";
  String countryFlag = "flags/ind.png";

  setShowPassword() {
    isPasswordShow = !isPasswordShow;
    notifyListeners();
  }

  userSignUp(context) {
    isLoading = true;
    notifyListeners();
    RegisterService.getInstance()
        .register(
            context,
            nameController.text.trimRight().trimLeft(),
            emailController.text.trim(),
            passwordController.text.trim(),
            "$countryCode${phoneController.text.trim()}",
            selectedCountry)
        .then((value) {
      if (value == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginPage, (route) => false);
      }
      isLoading = false;
      notifyListeners();
    });
  }

  void showCountryPicker(context) async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      countryFlag = country.flag;
      countryCode = country.callingCode;
      selectedCountry = country.name.toString();

      notifyListeners();
    }
  }
}
