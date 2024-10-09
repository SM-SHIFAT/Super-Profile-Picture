part of '../../super_profile_picture.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.radius,
    this.borderRadius,
    this.border,
    required this.image,
    this.imageDecorationProperties,
    required this.label,
    this.padding,
    this.textDecorationProperties,
    required this.clipBehavior,
  });

// Parent container size.
  final double radius;

// Container border Radius
  final double? borderRadius;

// Border data
  final BoxBorder? border;

// Label text data.
  final String label;

// Padding for the contains
  final EdgeInsetsGeometry? padding;

// Provider image data
  final ImageProvider<Object> image;

// Image decoration data.
  final ImageDecorationProperties? imageDecorationProperties;

// Text decoration data.
  final TextDecorationProperties? textDecorationProperties;

// Cliping value.
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
        ),
        clipBehavior: clipBehavior,
        child: Image(
          image: image,
          frameBuilder: imageDecorationProperties?.frameBuilder,
          loadingBuilder: imageDecorationProperties?.loadingBuilder,
          errorBuilder: imageDecorationProperties?.errorBuilder ??
              (BuildContext context, Object exception, StackTrace? stackTrace) {
                return TextWidget(
                  label: label,
                  textDecorationProperties: textDecorationProperties,
                );
              },
          semanticLabel: imageDecorationProperties?.semanticLabel,
          excludeFromSemantics:
              imageDecorationProperties?.excludeFromSemantics ?? true,
          width: imageDecorationProperties?.width,
          height: imageDecorationProperties?.height,
          color: imageDecorationProperties?.color,
          opacity: imageDecorationProperties?.opacity,
          colorBlendMode: imageDecorationProperties?.colorBlendMode,
          fit: imageDecorationProperties?.fit,
          alignment: imageDecorationProperties?.alignment ?? Alignment.center,
          repeat: imageDecorationProperties?.repeat ?? ImageRepeat.noRepeat,
          centerSlice: imageDecorationProperties?.centerSlice,
          matchTextDirection:
              imageDecorationProperties?.matchTextDirection ?? false,
          gaplessPlayback: imageDecorationProperties?.gaplessPlayback ?? false,
          isAntiAlias: imageDecorationProperties?.isAntiAlias ?? false,
          filterQuality:
              imageDecorationProperties?.filterQuality ?? FilterQuality.medium,
        ),
      ),
    );
  }
}
