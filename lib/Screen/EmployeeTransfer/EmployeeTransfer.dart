import 'package:firefly_app/Components/CustomElevatedButton.dart';
import 'package:firefly_app/Components/partionCustomRow2.dart';
import 'package:firefly_app/app_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeTransfer extends StatefulWidget {
  // final Map<String, dynamic> arguments;
  // NewEscalation({required this.arguments});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeTransferState createState() => _EmployeeTransferState();
}

class _EmployeeTransferState extends State<EmployeeTransfer> {
  bool isSelected = false;
  bool active = false;
  bool imageactive = false;

  TextEditingController searchController = TextEditingController();

  // late SharedPreferences _prefs;

  @override
  // void initState() {
  //   super.initState();
  //   _initPrefs();
  // }

  // Future<void> _initPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _loadDataFromPrefs();
  // }

  // void _loadDataFromPrefs() {
  //   setState(() {
  //     _selectedEquipment = _prefs.getString('selectedEquipment') ?? '';
  //     _selectedReason = _prefs.getString('selectedReason') ?? '';
  //     commentController.text = _prefs.getString('commentText') ?? '';
  //     _EquipmentId = _prefs.getString('equipmentId') ?? '';
  //     ImageList = _prefs
  //             .getStringList('imageList')
  //             ?.map((path) => File(path))
  //             .toList() ??
  //         [];
  //     isSelected = _prefs.getBool('isSelected') ?? false;
  //     active = _prefs.getBool('active') ?? false;
  //     imageactive = _prefs.getBool('imageActive') ?? false;
  //   });
  // }

  // void _saveDataToPrefs() {
  //   _prefs.setString('selectedEquipment', _selectedEquipment);
  //   _prefs.setString('selectedReason', _selectedReason);
  //   _prefs.setString('commentText', commentController.text);
  //   _prefs.setString('equipmentId', _EquipmentId);
  //   _prefs.setStringList(
  //       'imageList', ImageList.map((file) => file.path).toList());
  //   _prefs.setBool('isSelected', isSelected);
  //   _prefs.setBool('active', active);
  //   _prefs.setBool('imageActive', imageactive);
  // }

  // void _onEquipmentChanged(String value) {
  //   setState(() {
  //     _selectedEquipment = value;
  //     isSelected = true;
  //   });
  //   _saveDataToPrefs();
  // }

  // void _onReasonChanged(String value) {
  //   setState(() {
  //     _selectedReason = value;
  //     if (isSelected) {
  //       active = true;
  //     }
  //   });
  //   _saveDataToPrefs();
  // }

  // void _onCommentChanged(String value) {
  //   commentController.text = value;
  //   _saveDataToPrefs();
  // }

  // Future<void> _onSubmit() async {
  //   if (active) {
  //     final url = Uri.parse('https://example.com/api/escalation');
  //     try {
  //       // final accessToken = await getGlobalAccessToken();
  //       // if (accessToken == null) {
  //       //   print('Access token not found');
  //       //   return;
  //       // }
  //       final requestBody = {
  //         'selectedEquipment': _selectedEquipment,
  //         'selectedReason': _selectedReason,
  //         'comment': commentController.text,
  //         'imageList': ImageList.map((file) => file.path).toList(),
  //       };

  //       final response = await http.post(url,
  //           body: jsonEncode(requestBody),
  //           headers: {'Content-Type': 'application/json'});

  //       if (response.statusCode == 200) {
  //         // Handle successful response
  //         print('Data submitted successfully');

  //         // Reset the state
  //         setState(() {
  //           _selectedEquipment = '';
  //           _selectedReason = '';
  //           commentController.clear();
  //           ImageList.clear();
  //           isSelected = false;
  //           active = false;
  //           imageactive = false;
  //         });

  //         // Clear the shared preferences
  //         _prefs.remove('selectedEquipment');
  //         _prefs.remove('selectedReason');
  //         _prefs.remove('commentText');
  //         _prefs.remove('imageList');
  //         _prefs.remove('isSelected');
  //         _prefs.remove('active');
  //         _prefs.remove('imageActive');
  //       } else {
  //         // Handle error response
  //         print('Error submitting data: ${response.statusCode}');
  //       }
  //     } catch (e) {
  //       // Handle any exceptions
  //       print('Error: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: CustomAppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Employee transfer'),
          onLeadingTap: () {
            // Handle leading icon tap here
            Navigator.pop(context);
            print('Leading icon tapped!');
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PartionCustomRow2(
                inputText: 'Current outlet',
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
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: searchController,
                  // onChanged: ,
                  decoration: const InputDecoration(
                    hintText: 'Search Outlet',
                    // prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              PartionCustomRow2(
                inputText: 'Enter employee name/phone number',
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
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: searchController,
                  // onChanged: ,
                  decoration: const InputDecoration(
                    hintText: 'Employee name/ phone no.',
                    // prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              PartionCustomRow2(
                inputText: 'Transfer to',
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
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: searchController,
                  // onChanged: ,
                  decoration: const InputDecoration(
                    hintText: 'Select outlet',
                    // prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 300),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: CustomElevatedButton(
                  onPressed: () async {},
                  // icon: Icon(Icons.camera_alt),
                  // iconColor: Colors.blue,
                  label: 'Upload',
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  width: 400.0,
                  height: 40.0,
                  backgroundColor: active ? Colors.blue : Colors.grey,
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
