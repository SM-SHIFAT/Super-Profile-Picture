
![logo](https://github.com/user-attachments/assets/d71e5b91-a3ce-403a-8f10-ad281c5f3ee8)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![pub package](https://img.shields.io/pub/v/super_profile_picture.svg)](https://pub.dartlang.org/packages/super_profile_picture)
[![GitHub popularity](https://img.shields.io/github/stars/SM-SHIFAT/Super-Profile-Picture?logo=github&logoColor=white)](https://github.com/SM-SHIFAT/Super-Profile-Picture/stargazers/)
![version](https://img.shields.io/github/v/release/SM-SHIFAT/Super-Profile-Picture)

A customizable Flutter widget for displaying profile pictures, supporting both image and text options. It will show label text in case the image is not provided or fails to load. You can use any image provider, such as ```NetworkImage```, ```AssetImage```, and more, to display the image.

## Live Demo & Experiment Page
Live demo: [Demo & Experiment site](https://sm-shifat.github.io/Super-Profile-Picture/)

## Installation
i. Add the latest version of this package to your pubspec.yaml file, and run: 'dart pub get':
```yaml
dependancies:
  super_profile_picture: ^1.0.0
```

ii. Import the package in your Flutter App and use it.
```dart
import 'package:super_profile_picture/super_profile_picture.dart';
```

## Note
The background color will be set according to the first letter of the label. Customization of the background color is not currently supported but may be added in the future.

## Code Sample

### Default

![Screenshot_161](https://github.com/user-attachments/assets/0f59acec-af50-4f44-bc20-d96a133bcf19) ![Screenshot_160](https://github.com/user-attachments/assets/eededd37-5dbf-4aac-a28b-85fc4be36fa9)


``` dart
SuperProfilePicture(
    label: "Super Profile Picture",
    radius: 30,
);
```

``` dart
SuperProfilePicture(
    label: "Super Profile Picture",
    radius: 30,
    image: NetworkImage("https://picsum.photos/200/300.jpg"),

);
```



### Max Label Length

![Screenshot_162](https://github.com/user-attachments/assets/b41b66ce-c84a-4b21-9f68-040033f2b875)


``` dart

SuperProfilePicture(
    label: "Super Profile Picture",
    radius: 30,
    textDecorationProperties: TextDecorationProperties(
         maxLabelLength: 3,  
    ),
);
```

### Empty Name / Blank

![Screenshot_163](https://github.com/user-attachments/assets/c9d7ca19-6bf9-407f-9eaa-bbb758117345)

``` dart
SuperProfilePicture(
    label: "",
    radius: 30,
);
```

### With Border

![Screenshot_164](https://github.com/user-attachments/assets/d0fa2da8-d160-46d0-92ea-442044872bda) ![Screenshot_165](https://github.com/user-attachments/assets/494b0360-c277-4067-878e-7ddc5745d282)


``` dart
SuperProfilePicture(
    label: "Super Profile Picture",
    radius: 30,
    border: Border.all(width: 6, color: Colors.blue),
);
```

``` dart
SuperProfilePicture(
    label: "Super Profile Picture",
    radius: 30,
    image: NetworkImage("https://picsum.photos/200/300.jpg"),
    border: Border.all(width: 6, color: Colors.blue),

);
```

## Properties
  - label
  - radius
  - textDecorationProperties
    - fontSize;
    - maxLabelLength;
    - useFittedBox;
    - fontColor;
    - fontWeight;
    - letterSpacing;
    - padding;
    - fontStyle;
  - imageDecorationProperties
    - frameBuilder;
    - loadingBuilder;
    - errorBuilder;
    - semanticLabel;
    - excludeFromSemantics;
    - width;
    - height;
    - color;
    - opacity;
    - colorBlendMode;
    - fit;
    - alignment;
    - repeat;
    - centerSlice;
    - matchTextDirection;
    - gaplessPlayback;
    - isAntiAlias;
    - filterQuality;
  - border
  - borderRadius
  - image
  - clipBehavior

## Future Tasks
- Add customizable background color function.


