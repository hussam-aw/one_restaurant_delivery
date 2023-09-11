import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/Authentication_code.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/user_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';
import 'package:one_restaurant_delivery/main.dart';

class AuthController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();
  TextEditingController phoneNumberController = TextEditingController();
  AuthenticationCode? phoneCode;
  TextEditingController authenticationCodeController = TextEditingController();
  var register = false.obs;

  Future<void> registerOtp() async {
    register.value = true;
    if (phoneNumberController.value.text.isNotEmpty) {
      phoneCode = await userRepo.registerOtp(phoneNumberController.value.text);

      if (phoneCode != null && phoneCode!.message == 'success') {
        Get.toNamed(AppRoutes.authPhoneCodeScreen);
      } else {
        SnackBars.showWarning('رقم الموبايل خاطئ');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة للمتابعة');
    }
    register.value = false;
  }

  Future<void> login() async {
    if (authenticationCodeController.value.text.isNotEmpty &&
        authenticationCodeController.value.text == phoneCode!.otp) {
      User? user = await userRepo.login(phoneNumberController.value.text);

      if (user != null) {
        MyApp.appUser = user;
        await boxClient.setAuthedUser(user);
        SnackBars.showSuccess("${'أهلاً بك'}${user.name}");
        Get.toNamed(AppRoutes.homeScreen);
      } else {
        SnackBars.showWarning('كود تأكيد خاطئ');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة للمتابعة');
    }
  }

  Future<void> logout() async {
    await boxClient.removeUserData();
    MyApp.appUser = null;
    Get.offAllNamed(AppRoutes.otpRegisterScreen);
  }
}
