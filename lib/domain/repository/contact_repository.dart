import 'package:vendor_app/domain/entity/contact_model.dart';

abstract class ContactUsRepository {
  Future<String> contactUs(ContactUs contactUs);
}
