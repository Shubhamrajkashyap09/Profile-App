import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUploadApp extends StatefulWidget {
  @override
  _ImageUploadAppState createState() => _ImageUploadAppState();
}

class _ImageUploadAppState extends State<ImageUploadApp> {
  List<Asset> _images = [];

  Future<void> loadAssets() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      List<Asset> resultList = [];
      try {
        resultList = await MultipleImagesPicker.pickImages(
          maxImages: 10,
        );
      } on Exception catch (e) {
        print(e.toString());
      }

      if (!mounted) return;

      setState(() {
        _images = resultList;
      });
    } else {
      // Permission denied. Handle accordingly, e.g., show a dialog or message.
      print("Permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Raise a Ticket'),
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                'Tell us more...',
                style: TextStyle(fontSize: 16.0),
              ),
              padding: EdgeInsets.all(16.0),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Upload some pics, if you wish (not mandatory though)',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: loadAssets,
                    child: Text('Upload'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            _images.isNotEmpty
                ? Wrap(
                    children: List.generate(_images.length, (index) {
                      Asset imageAsset = _images[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            _images.removeAt(index);
                          });
                        },
                        child: Stack(
                          children: [
                            FutureBuilder<ByteData>(
                              future: imageAsset.getByteData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  final bytes =
                                      snapshot.data!.buffer.asUint8List();
                                  return Image.memory(
                                    bytes,
                                    fit: BoxFit.cover,
                                    width: 100.0,
                                    height: 100.0,
                                  );
                                }
                                return Container(); // Placeholder or loading indicator can be shown here
                              },
                            ),
                            Positioned(
                              top: -5.0,
                              right: -5.0,
                              child: IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: Colors.red,
                                onPressed: () => setState(() {
                                  _images.removeAt(index);
                                }),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                : Container(),
            Spacer(),
            ElevatedButton(
              onPressed: () =>
                  print('Submit ticket with ${_images.length} images'),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
