import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_response_dto.dart';
import 'package:vendor_app/data/provider/network/apis/tax_form_api.dart';
import 'package:vendor_app/domain/repository/tax_repository.dart';

class TaxRepositoryImpl extends TaxRepository {
  @override
  Future<TaxFromResponseDto> uploadTaxForm(TaxFromDto data) async {
    try {
      final response = await TaxFromAPI.uploadTaxForm(data).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadPLIForm(PLIFormDto data) async {
    try {
      final response = await TaxFromAPI.uploadPLIForm(data).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
