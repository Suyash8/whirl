import 'package:whirl/backend/auth/validate_data_types.dart';

class ValidateAmizoneCredentials {
  String? validateAmizoneID(String? amizoneID) {
    if (amizoneID?.isEmpty ?? true) {
      return 'Amizone ID is required';
    }
    if (amizoneID!.length < 7) {
      return 'Amizone ID is at least 7 characters';
    }
    if (!ValidateDataTypes.isInt(amizoneID)) {
      return 'Amizone ID must be numeric';
    }

    return null;
  }

  String? validateAmizonePassword(String? amizonePassword) {
    if (amizonePassword?.isEmpty ?? true) {
      return 'Amizone password is required';
    }
    if (amizonePassword!.length < 8) {
      return 'Amizone password is at least 8 characters';
    }
    if (amizonePassword.length > 20) {
      return 'Amizone password is at most 20 characters';
    }
    if (amizonePassword.contains(' ')) {
      return 'Amizone password must not contain spaces';
    }

    return null;
  }
}