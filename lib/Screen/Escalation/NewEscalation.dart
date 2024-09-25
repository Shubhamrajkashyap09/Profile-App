import 'dart:convert';
import 'dart:io';

import 'package:firefly_app/Components/CustomDropdown.dart';
import 'package:firefly_app/Components/CustomElevatedButton.dart';
import 'package:firefly_app/Components/CustomOutlinedButton.dart';
import 'package:firefly_app/Components/CustomTextFormField.dart';
import 'package:firefly_app/Components/IssueCustomIconContainer.dart';
import 'package:firefly_app/Components/partionCustomRow2.dart';
import 'package:firefly_app/Screen/Escalation/ViewEscalation.dart';
import 'package:firefly_app/app_bar/CustomAppBar.dart';
import 'package:firefly_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NewEscalation extends StatefulWidget {
  // final Map<String, dynamic> arguments;
  // NewEscalation({required this.arguments});

  @override
  // ignore: library_private_types_in_public_api
  _NewEscalationState createState() => _NewEscalationState();
}

class _NewEscalationState extends State<NewEscalation> {
  bool isSelected = false;
  bool active = false;
  bool imageactive = false;
  List<String> equipments = [
    'Microwave',
    'Oven',
    'Refrigerator',
    'Beverage Dispensers',
    'Coffee Brewer',
    'Ice Machine',
    'Food Processors',
    'Mixers',
    'Spice Grinders',
  ];

  List<String> reasons = [
    'Not Woking',
    'Broken',
    'Part Missing',
    'Lost',
  ];

  List<String> names = ['Upload'];
  List<String> iconPaths = ['assets/Upload.svg'];
  String _selectedEquipment = '';
  String _selectedReason = '';
  String _EquipmentId = '';
  TextEditingController commentController = TextEditingController();
  List<File> ImageList = [];

  Future<void> capture() async {
    ImagePicker picker = ImagePicker();
    File? capturedImage = await capturePhoto(picker: picker);
    if (capturedImage != null) {
      // Handle the captured image here, for example, update the UI or save the image
      print('Captured image: ${capturedImage.path}');
      setState(() {
        // ImageList.add(capturedImage);
        _onPhotoAdded(capturedImage);
      });
    } else {
      print('Image capture canceled or failed');
    }
  }

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadDataFromPrefs();
  }

  void _loadDataFromPrefs() {
    setState(() {
      _selectedEquipment = _prefs.getString('selectedEquipment') ?? '';
      _selectedReason = _prefs.getString('selectedReason') ?? '';
      commentController.text = _prefs.getString('commentText') ?? '';
      _EquipmentId = _prefs.getString('equipmentId') ?? '';
      ImageList = _prefs
              .getStringList('imageList')
              ?.map((path) => File(path))
              .toList() ??
          [];
      isSelected = _prefs.getBool('isSelected') ?? false;
      active = _prefs.getBool('active') ?? false;
      imageactive = _prefs.getBool('imageActive') ?? false;
    });
  }

  void _saveDataToPrefs() {
    _prefs.setString('selectedEquipment', _selectedEquipment);
    _prefs.setString('selectedReason', _selectedReason);
    _prefs.setString('commentText', commentController.text);
    _prefs.setString('equipmentId', _EquipmentId);
    _prefs.setStringList(
        'imageList', ImageList.map((file) => file.path).toList());
    _prefs.setBool('isSelected', isSelected);
    _prefs.setBool('active', active);
    _prefs.setBool('imageActive', imageactive);
  }

  void _onEquipmentChanged(String value) {
    setState(() {
      _selectedEquipment = value;
      isSelected = true;
    });
    _saveDataToPrefs();
  }

  void _onReasonChanged(String value) {
    setState(() {
      _selectedReason = value;
      if (isSelected) {
        active = true;
      }
    });
    _saveDataToPrefs();
  }

  void _onCommentChanged(String value) {
    commentController.text = value;
    _saveDataToPrefs();
  }

  void _onEqIDChanged(String value) {
    _EquipmentId = value;
    _saveDataToPrefs();
  }

  void _onPhotoAdded(File file) {
    setState(() {
      ImageList.add(file);
      imageactive = true;
    });
    _saveDataToPrefs();
  }

  void _onPhotoRemoved(int index) {
    setState(() {
      ImageList.removeAt(index);
      if (ImageList.isEmpty) {
        imageactive = false;
      }
    });
    _saveDataToPrefs();
  }

  Future<void> _onSubmit() async {
    if (active) {
      final url = Uri.parse('https://example.com/api/escalation');
      try {
        // final accessToken = await getGlobalAccessToken();
        // if (accessToken == null) {
        //   print('Access token not found');
        //   return;
        // }
        final requestBody = {
          'selectedEquipment': _selectedEquipment,
          'selectedReason': _selectedReason,
          'comment': commentController.text,
          'imageList': ImageList.map((file) => file.path).toList(),
        };

        final response = await http.post(url,
            body: jsonEncode(requestBody),
            headers: {'Content-Type': 'application/json'});

        if (response.statusCode == 200) {
          // Handle successful response
          print('Data submitted successfully');

          // Reset the state
          setState(() {
            _selectedEquipment = '';
            _selectedReason = '';
            commentController.clear();
            ImageList.clear();
            isSelected = false;
            active = false;
            imageactive = false;
          });

          // Clear the shared preferences
          _prefs.remove('selectedEquipment');
          _prefs.remove('selectedReason');
          _prefs.remove('commentText');
          _prefs.remove('imageList');
          _prefs.remove('isSelected');
          _prefs.remove('active');
          _prefs.remove('imageActive');
        } else {
          // Handle error response
          print('Error submitting data: ${response.statusCode}');
        }
      } catch (e) {
        // Handle any exceptions
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: CustomAppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Escalation'),
          onLeadingTap: () {
            // Handle leading icon tap here
            Navigator.pop(context);
            print('Leading icon tapped!');
          },
          icon1: Icons.view_headline_rounded,
          onIcon1Pressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewEscalation()));
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PartionCustomRow2(
                inputText: 'Select equipment',
                textStyle: TextStyle(
                  color: Color(0xFF696C7C),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                inputText2: '*',
                textStyle2: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomDropdown(
                placeholder: _selectedEquipment != ""
                    ? "$_selectedEquipment"
                    : "Equipments",
                options: equipments,
                onChanged: _onEquipmentChanged,
              ),
              SizedBox(height: 20),
              PartionCustomRow2(
                inputText: 'Select reason',
                textStyle: TextStyle(
                  color: Color(0xFF696C7C),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                inputText2: '*',
                textStyle2: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomDropdown(
                placeholder:
                    _selectedReason != "" ? "$_selectedReason" : "Reason",
                options: reasons,
                onChanged: _onReasonChanged,
              ),
              SizedBox(
                height: 16,
              ),
              PartionCustomRow2(
                inputText: 'Equipment ID',
                textStyle: TextStyle(
                  color: Color(0xFF696C7C),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                inputText2: '',
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                controller: TextEditingController(text: _EquipmentId),
                hintText: 'Add Equipment ID',
                textInputAction: TextInputAction.done,
                maxLines: 1,
                onChanged: _onEqIDChanged,
              ),
              SizedBox(height: 20),
              PartionCustomRow2(
                inputText: 'Additional comments',
                textStyle: TextStyle(
                  color: Color(0xFF696C7C),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                inputText2: '',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                controller: commentController,
                hintText: "Add comments",
                textInputAction: TextInputAction.done,
                maxLines: 7,
                onChanged: _onCommentChanged,
              ),
              SizedBox(height: 12),
              if (!imageactive) ...[
                CustomOutlinedButton(
                  text: 'Add Photo',
                  buttonTextStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    color: Color(0xFF0A66C2),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Color(0xFF0A66C2)),
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {
                    capture();
                    setState(() {
                      imageactive = true;
                    });
                  },
                ),
              ],
              if (imageactive) ...[
                PartionCustomRow2(
                  inputText: 'Related photos',
                  textStyle: TextStyle(
                    color: Color(0xFF696C7C),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  inputText2: '',
                ),
              ],
              if (imageactive) ...[
                SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFECF6FF),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFF8F8F8)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: ImageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index < ImageList.length &&
                                  ImageList[index] != null) {
                                return IssueCustomIconContainer(
                                  Image: ImageList[index],
                                  onCrossPressed: () {
                                    _onPhotoRemoved(index);
                                  },
                                );
                              } else {
                                return SizedBox
                                    .shrink(); // Return an empty container if the index is out of bounds or the file is null
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              // Replace the following with your actual icon paths and names

                              return IssueCustomIconContainer(
                                iconPath: iconPaths[index],
                                onTap: () {
                                  capture();
                                  print('Clicked on OnTap');
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )),
              ],
              if (!imageactive) ...[
                SizedBox(
                  height: 65,
                ),
              ],
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: CustomElevatedButton(
                  onPressed: () async {
                    if (active) {
                      print(_selectedEquipment);
                      print(_selectedReason);
                      print(commentController.text);
                      print(ImageList.map((file) => file.path).toList());

                      // Reset the state
                      setState(() {
                        _selectedEquipment = '';
                        _selectedReason = '';
                        commentController.clear();
                        ImageList.clear();
                        isSelected = false;
                        active = false;
                        imageactive = false;
                      });

                      // Clear the shared preferences
                      _prefs.remove('selectedEquipment');
                      _prefs.remove('selectedReason');
                      _prefs.remove('commentText');
                      _prefs.remove('imageList');
                      _prefs.remove('isSelected');
                      _prefs.remove('active');
                      _prefs.remove('imageActive');
                    }
                  },
                  // _onSubmit,
                  label: 'Submit',
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  width: 500.0,
                  height: 40.0,
                  backgroundColor:
                      active ? Color(0xFF0A66C2) : Color(0xFF8F919D),
                  cornerRadius: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
