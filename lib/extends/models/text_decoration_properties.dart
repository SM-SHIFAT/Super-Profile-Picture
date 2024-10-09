import 'package:flutter/material.dart';

class TextDecorationProperties {
  /// size of text.
  ///
  /// Note: If ```useFittedBox = true``` then provided ```fontSize``` will be ignored.
  final double? fontSize;

  /// length of the number of character that you want to show.
  /// it will use first character of each word.
  ///
  /// if in your text, number of word is less than  ```maxLabelLength``` then
  /// ```maxLabelLength == total_number_of_word```
  final int maxLabelLength;

  /// Note: If ```useFittedBox = true``` then provided ```fontSize``` will be ignored.
  final bool useFittedBox;

  /// Color of the font.
  final Color fontColor;

  /// Default is ```FontWeight.bold```.
  final FontWeight? fontWeight;

  /// Default is ```letterSpacing = 1.4```.
  final double? letterSpacing;

  /// Margin around the label value. default is ```EdgeInsets.all(3.0)```
  final EdgeInsetsGeometry fontMargin;

  /// Whether to use the italic type variation of glyphs in the font.
  ///
  ///Some modern fonts allow this to be selected in a more fine-grained manner. See [FontVariation.italic] for details.
  ///
  ///Italic type is distinct from slanted glyphs. To control the slant of a glyph, consider the [FontVariation.slant] font feature..
  final FontStyle? fontStyle;

  TextDecorationProperties({
    this.fontSize,
    this.maxLabelLength = 1,
    this.useFittedBox = true,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.bold,
    this.letterSpacing = 1.4,
    this.fontStyle,
    this.fontMargin = const EdgeInsets.all(3.0),
  });
}
