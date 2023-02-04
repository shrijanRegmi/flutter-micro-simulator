class CommonHelper {
  static String convertToHex(
    final String text, {
    final int withIncrement = 0,
  }) {
    final intVal = int.tryParse(text, radix: 16);
    if (intVal == null) return '';

    final incrementedVal = intVal + withIncrement;
    var convertedString = incrementedVal.toRadixString(16).toUpperCase();
    if (convertedString.length < 4) {
      for (var i = 0; i <= (4 - convertedString.length); i++) {
        convertedString = '0$convertedString';
      }
    }
    return convertedString;
  }
}
