import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_response_dto.dart';
import 'package:vendor_app/data/provider/network/apis/tax_form_api.dart';
import 'package:vendor_app/domain/repository/tax_repository.dart';

class TaxRepositoryImpl extends TaxRepository {
  @override
  Future<TaxFromResponseDto> uploadTaxForm(
      TaxFromDto data, File taxImage) async {
    try {
      final response = await TaxFromAPI.uploadTaxForm(data, taxImage).request();
      TaxFromResponseDto res = TaxFromResponseDto.fromRawJson(response);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadPLIForm(PLIFormDto data, File pliImage) async {
    try {
      final response = await TaxFromAPI.uploadPLIForm(data, pliImage).request();
      Map<String, dynamic> msg = jsonDecode(response);
      return msg["message"];
    } catch (e) {
      rethrow;
    }
  }
}
