import 'constant.dart';

// fixed color based on first latter
fixedColor(String text) {
  if (text.isEmpty) {
    return ConstantColor.defaultColor;
  }

  var split = text[0].toUpperCase();

  return ConstantColor.intialColor[split] ?? ConstantColor.defaultColor;
}
