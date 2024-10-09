part of '../super_profile_picture.dart';

class SuperProfilePicture extends StatelessWidget {
  /// Text to show.
  ///
  /// Example: "Michael Jackson". if ```maxLabelLength=2``` then "MJ" will be shown.
  final String label;

  /// Radius of the container.
  final double radius;

  /// Text Decoration properties.
  final TextDecorationProperties? textDecorationProperties;

  /// Image Decoration properties.
  final ImageDecorationProperties? imageDecorationProperties;

  /// Use for adding border to the container.
  final BoxBorder? border;

  /// Give borderRadius to the Container.
  ///
  /// If ```borderRadius = null``` then Container will be Circular.
  final double? borderRadius;

  /// Give padding to the container.
  final EdgeInsetsGeometry? padding;

  /// Use any image provider to show images.
  ///
  /// Example: ```AssetImage```, ```NetworkImage```, ```FileImage``` or any similar provider.
  ///
  /// To cache image you can use ```CachedNetworkImageProvider``` or any other suitable method.
  final ImageProvider<Object>? image;

  /// Clip property for parent container. default is ```Clip.hardEdge```
  final Clip clipBehavior;

  const SuperProfilePicture({
    super.key,
    required this.label,
    required this.radius,
    this.image,
    this.border,
    this.borderRadius,
    this.padding,
    this.textDecorationProperties,
    this.imageDecorationProperties,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      // Show label text widget.
      return TextView(
        radius: radius,
        label: label,
        borderRadius: borderRadius,
        border: border,
        padding: padding,
        clipBehavior: clipBehavior,
        textDecorationProperties: textDecorationProperties,
      );
    } else {
      // Show image widget.
      return ImageView(
        radius: radius,
        label: label,
        borderRadius: borderRadius,
        border: border,
        padding: padding,
        image: image!,
        clipBehavior: clipBehavior,
        textDecorationProperties: textDecorationProperties,
        imageDecorationProperties: imageDecorationProperties,
      );
    }
  }
}
