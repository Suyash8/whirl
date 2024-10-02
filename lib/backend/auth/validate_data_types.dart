class ValidateDataTypes {
  static bool isInt(dynamic val) {
    try {
      int.parse(val.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isDouble(dynamic val) {
    try {
      double.parse(val.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isString(dynamic val) {
    return val is String;
  }

  static bool isBool(dynamic val) {
    return val is bool;
  }
}