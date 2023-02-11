class CommonHelper {
  static String convertToIncrementedHex(
    final String text, {
    required final int withIncrement,
    final int digits = 4,
  }) {
    final intVal = int.tryParse(text, radix: 16);
    if (intVal == null) return '';

    final incrementedVal = intVal + withIncrement;
    var convertedString = incrementedVal.toRadixString(16).toUpperCase();
    if (convertedString.length < digits) {
      convertedString = convertedString.padLeft(digits, '0');
    } else if (convertedString.length > digits) {
      convertedString = convertedString.substring(0, digits);
    }
    return convertedString;
  }

  static int convertHexStringToDecimal(
    final String hex, {
    final int withIncrement = 0,
  }) {
    final intVal = int.tryParse(hex, radix: 16);
    if (intVal == null) return 0;

    final incrementedVal = intVal + withIncrement;

    return incrementedVal;
  }
}
