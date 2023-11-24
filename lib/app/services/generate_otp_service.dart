import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class GenerateOtpService {
  Future generateOtp(AuthRepository repo, String email) async {
    try {
      // ShowDialogBox.showDialogBoxs(true);

      String res = await repo.generateOtp(email);

      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}
