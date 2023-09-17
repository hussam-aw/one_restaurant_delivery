import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/image_picker_helper.dart';

class ProfileScreenController {
  ImagePickerHelper imagePickerHelper = ImagePickerHelper();
  RxString selectedUserImage = ''.obs;

  Future<void> getSelectedUserImage() async {
    selectedUserImage.value = await imagePickerHelper.pickImage();
  }
}
