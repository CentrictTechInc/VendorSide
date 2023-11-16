import 'dart:convert';

import 'package:vendor_app/data/provider/network/apis/contact_us_api.dart';
import 'package:vendor_app/domain/entity/contact_model.dart';
import 'package:vendor_app/domain/repository/contact_repository.dart';

class ContactUsRepositoryImpl extends ContactUsRepository {
  @override
  Future<String> contactUs(ContactUs contactUs) async {
    try {
      final response = await ContactAPI.contactUs(contactUs).request();
      Map<String, dynamic> res = jsonDecode(response);
      return res['message'];
    } catch (e) {
      rethrow;
    }
  }
}
