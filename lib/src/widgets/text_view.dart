part of '../../super_profile_picture.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.radius,
    required this.label,
    this.borderRadius,
    this.border,
    this.padding,
    this.textDecorationProperties,
    required this.clipBehavior,
  });

// Decoration for text widget.
  final TextDecorationProperties? textDecorationProperties;

  // Parent container radius
  final double radius;

  // Label text.
  final String label;

  // BorderRadius of parent container
  final double? borderRadius;

  // Border for parent container.
  final BoxBorder? border;

  // Padding for parent container.
  final EdgeInsetsGeometry? padding;

  // Clipping value for parent container.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      padding: padding,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        border: border,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
        color: label == ''
            ? ConstantColor.defaultColor
            : fixedColor(
                Utility.parseName(
                    label, textDecorationProperties?.maxLabelLength ?? 1),
              ),
      ),
      child: TextWidget(
        label: label,
        textDecorationProperties: textDecorationProperties,
      ),
    );
  }
}

// Text Widget to show label text
class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.textDecorationProperties,
    required this.label,
  });

  // Label text.
  final String label;
  // Text Decoration value.
  final TextDecorationProperties? textDecorationProperties;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      // Use fittedbox to resize text.
      fit: textDecorationProperties?.useFittedBox ?? false
          ? BoxFit.contain
          : BoxFit.none,
      alignment: Alignment.center,
      child: Padding(
        padding:
            textDecorationProperties?.fontMargin ?? const EdgeInsets.all(3.0),
        child: Text(
          // Check if text empty or not.
          label == ''
              ? ''
              : Utility.parseName(
                      label, textDecorationProperties?.maxLabelLength ?? 1)
                  .toUpperCase(),
          style: TextStyle(
            fontStyle: textDecorationProperties?.fontStyle,
            fontWeight: textDecorationProperties?.fontWeight,
            fontSize: textDecorationProperties?.fontSize,
            letterSpacing: textDecorationProperties?.letterSpacing,
            color: textDecorationProperties?.fontColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
