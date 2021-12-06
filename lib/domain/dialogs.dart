import 'package:friflex/presentation/shared/single_button_dialog.dart';
import 'package:get/get.dart';

class ErrorDialog {
  static Future<void> show(String error) async {
    await Get.dialog<void>(SingleButtonDialog(
      titleText: 'Error',
      contentText: error,
      acceptText: 'Ok',
      onAcceptTap: Get.back,
    ));
  }

  static void hide() => Get.back<void>();
}
