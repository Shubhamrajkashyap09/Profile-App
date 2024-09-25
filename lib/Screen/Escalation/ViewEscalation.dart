import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:firefly_app/Components/CustomTicketContainer.dart';
import 'package:firefly_app/app_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ViewEscalation extends StatefulWidget {
  const ViewEscalation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewEscalationState createState() => _ViewEscalationState();
}

class _ViewEscalationState extends State<ViewEscalation> {
  String nowStatus = "All";

  Future<List<File>> downloadImages(List<String> imageUrls) async {
    List<File> files = [];
    for (String url in imageUrls) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Get the local path to save the image
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;

        // Create a file with a unique name in the temporary directory
        String fileName = url.split('/').last;
        File file = File('$tempPath/$fileName');

        // Write the image bytes to the file
        await file.writeAsBytes(response.bodyBytes);

        files.add(file);
      }
    }
    return files;
  }

  List<ContainerSample> containerList = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    List<ContainerSample> tempList = [
      ContainerSample(
        ticketId: '123456',
        status: 'Open',
        equipmentName: 'Device ABC',
        equipmentId: '987654',
        comment: 'This is a sample query',
        issue: 'Not Working',
        date: '02-05-2024',
        imageList: await downloadImages([
          'https://www.shutterstock.com/image-photo/metal-cooking-utensils-on-table-260nw-1042252666.jpg',
          'https://www.shutterstock.com/image-photo/metal-cooking-utensils-on-table-260nw-1042252666.jpg',
          'https://www.shutterstock.com/image-photo/metal-cooking-utensils-on-table-260nw-1042252666.jpg',
        ]),
      ),
      ContainerSample(
        ticketId: '789012',
        status: 'Closed',
        equipmentName: 'Device XYZ',
        equipmentId: '543210',
        comment: 'This is another sample query',
        issue: 'Not Working',
        date: '02-05-2024',
        imageList: [],
      ),
      ContainerSample(
        ticketId: '7896785',
        status: 'In Progress',
        equipmentName: 'Device XYZ',
        equipmentId: '5436798',
        comment: 'This is another sample query',
        issue: 'Not Working',
        date: '02-05-2024',
        imageList: [],
      ),
      ContainerSample(
        ticketId: '123456',
        status: 'Open',
        equipmentName: 'Device ABC',
        equipmentId: '987654',
        comment: 'This is a sample query',
        issue: 'Not Working',
        date: '02-05-2024',
        imageList: [],
      ),
      // Add more ContainerSample instances as needed
    ];

    setState(() {
      containerList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ContainerSample> filteredList = [];
    if (nowStatus == 'All') {
      filteredList.addAll(containerList);
    } else if (nowStatus == 'Open') {
      filteredList =
          containerList.where((item) => item.status == 'Open').toList();
    } else if (nowStatus == 'In Progress') {
      filteredList =
          containerList.where((item) => item.status == 'In Progress').toList();
    } else if (nowStatus == 'Closed') {
      filteredList =
          containerList.where((item) => item.status == 'Closed').toList();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Ticket History'),
          onLeadingTap: () {
            Navigator.pop(context);
            print('Leading icon tapped!');
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        nowStatus = "All";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: nowStatus == "All"
                            ? Color(0xFF0A66C2)
                            : Colors.white,
                        border: Border.all(width: 1, color: Color(0xFF0A66C2)),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 5.5, bottom: 5.5),
                      child: Text(
                        'All',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: nowStatus == "All"
                              ? Color(0xFFF8F8F8)
                              : Color(0xFF696C7C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        nowStatus = "Open";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: nowStatus == "Open"
                            ? Color(0xFF0A66C2)
                            : Colors.white,
                        border: Border.all(width: 1, color: Color(0xFF0A66C2)),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 5.5, bottom: 5.5),
                      child: Text(
                        'Open',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: nowStatus == "Open"
                                ? Color(0xFFF8F8F8)
                                : Color(0xFF696C7C),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your onTap functionality here
                      setState(() {
                        nowStatus = "In Progress";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: nowStatus == "In Progress"
                            ? Color(0xFF0A66C2)
                            : Colors.white,
                        border: Border.all(width: 1, color: Color(0xFF0A66C2)),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 5.5, bottom: 5.5),
                      child: Text(
                        'In Progress',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: nowStatus == "In Progress"
                                ? Color(0xFFF8F8F8)
                                : Color(0xFF696C7C),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your onTap functionality here
                      setState(() {
                        nowStatus = "Closed";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: nowStatus == "Closed"
                            ? Color(0xFF0A66C2)
                            : Colors.white,
                        border: Border.all(width: 1, color: Color(0xFF0A66C2)),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 5.5, bottom: 5.5),
                      child: Text(
                        'Closed',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: nowStatus == "Closed"
                                ? Color(0xFFF8F8F8)
                                : Color(0xFF696C7C),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sarjapur',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color(0xFF44475B),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomTicketContainer(
                        ticketId: filteredList[index].ticketId,
                        equipmentName: filteredList[index].equipmentName,
                        equipmentId: filteredList[index].equipmentId ?? '',
                        comment: filteredList[index].comment ?? '',
                        issue: filteredList[index].issue,
                        date: filteredList[index].date,
                        ImageList: filteredList[index].imageList ?? [],
                      ),
                      const SizedBox(
                          height:
                              16.0), // Add spacing between CustomTicketContainers
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerSample {
  final String ticketId;
  final String status;
  final String equipmentName;
  final String? equipmentId;
  final String? comment;
  final String issue;
  final String date;
  final List<File>? imageList;

  ContainerSample({
    required this.ticketId,
    required this.status,
    required this.equipmentName,
    this.equipmentId,
    this.comment,
    required this.issue,
    required this.date,
    this.imageList,
  });
}
