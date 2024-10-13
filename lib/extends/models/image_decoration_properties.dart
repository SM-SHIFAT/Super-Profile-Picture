import 'package:flutter/material.dart';

class ImageDecorationProperties {
  /// A builder function responsible for creating the widget that represents this image.
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;

  /// A builder that specifies the widget to display to the user while an image is still loading.
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;

  /// A builder function that is called if an error occurs during image loading.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  /// A Semantic description of the image.
  ///
  /// Used to provide a description of the image to TalkBack on Android, and VoiceOver on iOS.
  final String? semanticLabel;

  /// Whether to exclude this image from semantics.
  ///
  /// Useful for images which do not contribute meaningful information to an application.
  final bool excludeFromSemantics;

  /// If non-null, require the image to have this width (in logical pixels).
  ///
  /// If null, the image will pick a size that best preserves its intrinsic aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height] be specified, or that the widget be placed in a context that sets tight layout constraints, so that the image does not change size as it loads. Consider using [fit] to adapt the image's rendering to fit the given width and height if the exact image dimensions are not known in advance.
  final double? width;

  /// If non-null, require the image to have this height (in logical pixels).
  ///
  /// If null, the image will pick a size that best preserves its intrinsic aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height] be specified, or that the widget be placed in a context that sets tight layout constraints, so that the image does not change size as it loads. Consider using [fit] to adapt the image's rendering to fit the given width and height if the exact image dimensions are not known in advance.
  final double? height;

  /// If non-null, this color is blended with each image pixel using [colorBlendMode].
  final Color? color;

  /// If non-null, the value from the [Animation] is multiplied with the opacity of each image pixel before painting onto the canvas.
  ///
  ///This is more efficient than using [FadeTransition] to change the opacity of an image, since this avoids creating a new composited layer. Composited layers may double memory usage as the image is painted onto an offscreen render target.
  ///
  /// See also:
  ///
  /// - [AlwaysStoppedAnimation], which allows you to create an [Animation] from a single opacity value.
  final Animation<double>? opacity;

  /// Used to combine [color] with this image.
  ///
  ///The default is [BlendMode.srcIn]. In terms of the blend mode, [color] is the source and this image is the destination.
  ///
  /// See also:
  ///
  /// - [BlendMode], which includes an illustration of the effect of each blend mode.
  final BlendMode? colorBlendMode;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at [paintImage].
  final BoxFit fit;

  /// How to align the image within its bounds.
  ///
  /// The alignment aligns the given position in the image to the given position in the layout bounds. For example, an [Alignment] alignment of (-1.0, -1.0) aligns the image to the top-left corner of its layout bounds, while an [Alignment] alignment of (1.0, 1.0) aligns the bottom right of the image with the bottom right corner of its layout bounds. Similarly, an alignment of (0.0, 1.0) aligns the bottom middle of the image with the middle of the bottom edge of its layout bounds.
  ///
  /// To display a subpart of an image, consider using a [CustomPainter] and [Canvas.drawImageRect].
  ///
  /// If the [alignment] is [TextDirection]-dependent (i.e. if it is a [AlignmentDirectional]), then an ambient [Directionality] widget must be in scope.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  /// - [Alignment], a class with convenient constants typically used to specify an [AlignmentGeometry].
  /// - [AlignmentDirectional], like [Alignment] for specifying alignments relative to text direction.
  final AlignmentGeometry alignment;

  /// How to paint any portions of the layout bounds not covered by the image.
  final ImageRepeat repeat;

  /// The center slice for a nine-patch image.
  ///
  /// The region of the image inside the center slice will be stretched both horizontally and vertically to fit the image into its destination. The region of the image above and below the center slice will be stretched only horizontally and the region of the image to the left and right of the center slice will be stretched only vertically.
  final Rect? centerSlice;

  /// Whether to paint the image in the direction of the [TextDirection].
  ///
  /// If this is true, then in [TextDirection.ltr] contexts, the image will be drawn with its origin in the top left (the "normal" painting direction for images); and in [TextDirection.rtl] contexts, the image will be drawn with a scaling factor of -1 in the horizontal direction so that the origin is in the top right.
  ///
  /// This is occasionally used with images in right-to-left environments, for images that were designed for left-to-right locales. Be careful, when using this, to not flip images with integral shadows, text, or other effects that will look incorrect when flipped.
  ///
  /// If this is true, there must be an ambient [Directionality] widget in scope.
  final bool matchTextDirection;

  /// Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes. The default value is false.
  final bool gaplessPlayback;

  /// Whether to paint the image with anti-aliasing.
  ///
  /// Anti-aliasing alleviates the sawtooth artifact when the image is rotated.
  final bool isAntiAlias;

  /// The rendering quality of the image.
  ///
  /// If the image is of a high quality and its pixels are perfectly aligned with the physical screen pixels, extra quality enhancement may not be necessary. If so, then [FilterQuality.none] would be the most efficient.
  ///
  /// If the pixels are not perfectly aligned with the screen pixels, or if the image itself is of a low quality, [FilterQuality.none] may produce undesirable artifacts. Consider using other [FilterQuality] values to improve the rendered image quality in this case. Pixels may be misaligned with the screen pixels as a result of transforms or scaling.
  ///
  /// Defaults to [FilterQuality.medium].
  ///
  /// See also:
  ///
  /// - [FilterQuality], the enum containing all possible filter quality options.
  final FilterQuality filterQuality;

  ImageDecorationProperties({
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = true,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.medium,
  });
}
