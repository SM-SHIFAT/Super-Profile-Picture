import 'package:flutter/material.dart';
import 'package:super_profile_picture/super_profile_picture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Profile Picture Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Wrap(
        children: [
          getCard(
            text: "Profile with image",
            url: "https://picsum.photos/200/300.jpg",
          ),
          getCard(
              text: "Border Radius 15 & padding 5",
              url: "https://picsum.photos/200/300.jpg",
              borderRadius: 15,
              padding: EdgeInsets.all(5)),
          getCard(
            text: "Cant load image (label shown)",
            url: "error_url_or_url_failed_to_load",
          ),
          getCard(
            text: "Image With padding 10",
            url: "https://picsum.photos/200/300.jpg",
            padding: const EdgeInsets.all(10),
          ),
          getCard(
            text: "useFittedBox = true",
            useFittedBox: true,
          ),
          getCard(
            text: "custom fontsize",
            padding: const EdgeInsets.all(10),
            useFittedBox: false,
          ),
        ],
      )),
    );
  }

  Widget getCard({
    required String text,
    String? url,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    bool? useFittedBox,
  }) {
    return SizedBox(
      height: 150,
      width: 120,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SuperProfilePicture(
                label: "Michel Jackson",
                radius: 30,
                borderRadius: borderRadius,
                padding: padding,
                image: url == null
                    ? null
                    : NetworkImage(
                        url,
                      ),
                imageDecorationProperties:
                    ImageDecorationProperties(fit: BoxFit.cover),
                textDecorationProperties: TextDecorationProperties(
                    useFittedBox: useFittedBox ?? true,
                    fontSize: 10,
                    maxLabelLength: 2,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Center(
                    child: Text(
                  text,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
