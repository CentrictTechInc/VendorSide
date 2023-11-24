import 'dart:io';

import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_response_dto.dart';

abstract class TaxRepository {
  Future<TaxFromResponseDto> uploadTaxForm(TaxFromDto data, File taxImage);
  Future<String> uploadPLIForm(PLIFormDto data, File pliImage);
}
