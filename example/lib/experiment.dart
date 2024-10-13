import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_profile_picture/super_profile_picture.dart';

class Experiment extends StatefulWidget {
  const Experiment({super.key});

  @override
  State<Experiment> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  String label = "Super Profile Picture";
  bool borderRadiusValue = false; // ---
  double borderRadius = 0; // ---
  String? imageUrl; // = "https://picsum.photos/200/300.jpg";
  bool border = false; // ---
  bool showLoadingBuilder = false; // ---
  double fontSize = 20; // ---
  int maxLabelLength = 1; // ---
  bool useFittedBox = true; // ---
  Color fontColor = Colors.white; // ---
  FontWeight fontWeight = FontWeight.bold; // ---

  TextEditingController labelController =
      TextEditingController(text: "Super Profile Picture");
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SuperProfilePicture(
                label: label,
                radius: 60,
                borderRadius: borderRadiusValue ? borderRadius : null,
                image: imageUrl != null ? NetworkImage(imageUrl!) : null,
                border:
                    border ? Border.all(width: 6, color: Colors.blue) : null,
                textDecorationProperties: TextDecorationProperties(
                  fontSize: fontSize,
                  maxLabelLength: maxLabelLength,
                  useFittedBox: useFittedBox,
                  fontColor: fontColor,
                  fontWeight: fontWeight,
                ),
                imageDecorationProperties: ImageDecorationProperties(
                  fit: BoxFit.cover,
                  loadingBuilder: showLoadingBuilder
                      ? (context, w, i) {
                          return const CircularProgressIndicator();
                        }
                      : null,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: ListTile(title: Text("Label:"))),
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: labelController,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: ListTile(title: Text("Image Url:"))),
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: imageController,
                          )),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            "Demo image url: https://picsum.photos/200/300.jpg"),
                        IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                const ClipboardData(
                                    text: "https://picsum.photos/200/300.jpg"),
                              ).then((v) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Text Copied to Clipboard.")));
                                }
                              });
                            },
                            icon: const Icon(Icons.copy)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          label = labelController.text;
                          imageUrl = imageController.text.isEmpty
                              ? null
                              : imageController.text;
                        });
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: ListTile(
                              title: Text("Font Size:"),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Slider(
                                value: fontSize,
                                min: 5,
                                max: 80,
                                onChanged: useFittedBox
                                    ? null
                                    : (v) {
                                        setState(() {
                                          fontSize = v;
                                        });
                                      }),
                          ),
                        ],
                      ),
                      const Center(
                          child: Text("Only work if useFittedbox = false")),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: ListTile(
                          title: Text("Max Label Length:"),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Slider(
                            value: maxLabelLength.toDouble(),
                            divisions: 4,
                            label: maxLabelLength.round().toString(),
                            min: 1,
                            max: 5,
                            onChanged: (v) {
                              setState(() {
                                maxLabelLength = v.toInt();
                              });
                            }),
                      ),
                    ],
                  ),
                  SwitchListTile(
                      value: border,
                      title: const Text("Show Border"),
                      onChanged: (v) {
                        setState(() {
                          border = v;
                        });
                      }),
                  SwitchListTile(
                      value: showLoadingBuilder,
                      title: const Text("Show Image Loading Builder"),
                      onChanged: (v) {
                        setState(() {
                          showLoadingBuilder = v;
                        });
                      }),
                  SwitchListTile(
                      value: useFittedBox,
                      title: const Text("Use FittedBox on Text"),
                      onChanged: (v) {
                        setState(() {
                          useFittedBox = v;
                        });
                      }),
                  Row(
                    children: [
                      const Expanded(
                          child: ListTile(
                        title: Text("Font Weight:"),
                      )),
                      Expanded(
                        child: RadioListTile<FontWeight>(
                            value: FontWeight.bold,
                            title: const Text("Bold"),
                            groupValue: fontWeight,
                            onChanged: (v) {
                              setState(() {
                                fontWeight = v ?? FontWeight.bold;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<FontWeight>(
                            value: FontWeight.normal,
                            groupValue: fontWeight,
                            title: const Text("Normal"),
                            onChanged: (v) {
                              setState(() {
                                fontWeight = v ?? FontWeight.normal;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: ListTile(
                        title: Text("Font Color:"),
                      )),
                      Expanded(
                        child: RadioListTile<Color>(
                            value: Colors.white,
                            title: const Text("White"),
                            groupValue: fontColor,
                            onChanged: (v) {
                              setState(() {
                                fontColor = v ?? Colors.white;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<Color>(
                            value: Colors.black,
                            groupValue: fontColor,
                            title: const Text("Black"),
                            onChanged: (v) {
                              setState(() {
                                fontColor = v ?? Colors.black;
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: ListTile(
                        title: Text("Border Radius Value:"),
                      )),
                      Expanded(
                        child: RadioListTile<bool>(
                            value: true,
                            title: const Text("True"),
                            groupValue: borderRadiusValue,
                            onChanged: (v) {
                              setState(() {
                                borderRadiusValue = v ?? true;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<bool>(
                            value: false,
                            groupValue: borderRadiusValue,
                            title: const Text("null"),
                            onChanged: (v) {
                              setState(() {
                                borderRadiusValue = v ?? false;
                              });
                            }),
                      ),
                    ],
                  ),
                  AbsorbPointer(
                    absorbing: !borderRadiusValue,
                    child: Row(
                      children: [
                        const Expanded(
                          child: ListTile(
                            title: Text("Border Radius:"),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Slider(
                              value: borderRadius,
                              min: 0,
                              max: 150,
                              onChanged: borderRadiusValue
                                  ? (v) {
                                      setState(() {
                                        borderRadius = v;
                                      });
                                    }
                                  : null),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
