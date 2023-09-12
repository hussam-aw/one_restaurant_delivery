import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/user_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';
import 'package:one_restaurant_delivery/main.dart';

class ProfileController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  UserRepo userRepo = UserRepo();
  BoxClient client = BoxClient();
  var isLoading = false.obs;

  void setUserName(name) {
    if (name.isNotEmpty) {
      userNameController.value = TextEditingValue(text: name);
    } else {
      userNameController.clear();
    }
  }

  String getUserName() {
    return userNameController.value.text;
  }

  void setEmail(email) {
    if (email.isNotEmpty) {
      emailController.value = TextEditingValue(text: email);
    } else {
      emailController.clear();
    }
  }

  String getEmail() {
    return emailController.value.text;
  }

  void setMobilePhone(mobilePhone) {
    if (mobilePhone.isNotEmpty) {
      mobileNumberController.value = TextEditingValue(text: mobilePhone);
    } else {
      mobileNumberController.clear();
    }
  }

  String getMobilePhone() {
    return mobileNumberController.value.text;
  }

  void setAddress(address) {
    if (address.isNotEmpty) {
      addressController.value = TextEditingValue(text: address);
    } else {
      addressController.clear();
    }
  }

  String getAddress() {
    return addressController.value.text;
  }

  void setUserDetails(User? user) {
    if (user != null) {
      setUserName(user.name);
      setEmail(user.email);
      setMobilePhone(user.phone);
      setAddress(user.address);
    } else {
      setUserName('');
      setEmail('');
      setMobilePhone('');
      setAddress('');
    }
  }

  Future<void> updateProfile() async {
    String userName = getUserName();
    String email = getEmail();
    String mobilePhone = getMobilePhone();
    String address = getAddress();
    if (userName.isNotEmpty &&
        email.isNotEmpty &&
        mobilePhone.isNotEmpty &&
        address.isNotEmpty) {
      isLoading.value = true;
      var user =
          await userRepo.updateUserInfo(userName, email, mobilePhone, address);
      isLoading.value = false;
      if (user != null) {
        MyApp.appUser = user;
        setUserDetails(MyApp.appUser);
        await client.setAuthedUser(MyApp.appUser!);
        update();
        SnackBars.showSuccess('تم تعديل بيانات الملف الشخصي');
      } else {
        SnackBars.showError('فشل التعديل');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة');
    }
  }

  @override
  void onInit() {
    setUserDetails(MyApp.appUser);
    super.onInit();
  }
}
