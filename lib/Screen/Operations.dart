import 'package:firefly_app/Components/PartionCustomRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../app_bar/custom_app_bar.dart';
import '../app_bar/appbar_title.dart';
// import '../app_bar/appbar_subtitle.dart';
import '../Components/rating_container.dart';
import '../Components/CustomIconContainer.dart';

class Operations extends StatefulWidget {
  // const Operations({Key? key}) : super(key: key);

  final Map<String, dynamic> arguments;
  Operations({
    required this.arguments,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  bool notification = true;
  String userType = "";
  List<String> names = [];
  List<String> iconPaths = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      userType = widget.arguments['user_type'];
    });
    if (userType == 'outlet') {
      names = [
        'PSV',
        'GRN',
        'STO',
        'Wastage',
      ];

      if (userType == 'outlet' &&
          widget.arguments['outlet'].contains("Central Kitchen")) {
        names.add("CK-Dispatch");
      }
    } else if (userType == 'audit') {
      names = ['Audit'];
    }
    for (int i = 0; i < names.length; i++) {
      iconPaths.add('assets/${names[i]}.svg');
    }
  }

  void onTapAudit() {
    // Handle PSV icon tap
    print('Tapped Audit');
    // Add your logic for PSV onTap action here
  }

  void onTapPSV() {
    // Handle PSV icon tap
    print('Tapped PSV');
    // Add your logic for PSV onTap action here
  }

  void onTapGRN() {
    // Handle GRN icon tap
    print('Tapped GRN');
    // Add your logic for GRN onTap action here
  }

  void onTapSTO() {
    // Handle STO icon tap
    print('Tapped STO');
    // Add your logic for STO onTap action here
  }

  void onTapWastage() {
    // Handle Wastage icon tap
    print('Tapped Wastage');
    // Add your logic for Wastage onTap action here
  }

  void onTapCKDispatch() {
    // Handle CK Dispatch icon tap
    print('Tapped CK Dispatch');
    // Add your logic for CK Dispatch onTap action here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          // width: 10,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingContainer(
                          ratingParameter: 'Outlet Rating', ratingValue: 5.0),
                      const Spacer(),
                      RatingContainer(
                          ratingParameter: 'Audit Score', ratingValue: 3.0),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  if (userType == 'outlet' || userType == 'audit')
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: PartionCustomRow('Operations'),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Replace the following with your actual icon paths and names

                      return CustomIconContainer(
                        iconPath: iconPaths[index],
                        name: names[index],
                        onTap: () {
                          // Call the corresponding onTap function based on the index
                          switch (names[index]) {
                            case 'Audit':
                              onTapAudit();
                              break;
                            case 'PSV':
                              onTapPSV();
                              break;
                            case 'GRN':
                              onTapGRN();
                              break;
                            case 'STO':
                              onTapSTO();
                              break;
                            case 'Wastage':
                              onTapWastage();
                              break;
                            case 'CK-Dispatch':
                              onTapCKDispatch();
                              break;
                            default:
                              break;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: PartionCustomRow('Learning & Development'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      // Replace the following with your actual icon paths and names
                      List<String> iconPaths = [
                        'assets/Trainings.svg',
                      ];

                      List<String> names = [
                        'L&D',
                      ];

                      return CustomIconContainer(
                        iconPath: iconPaths[index],
                        name: names[index],
                        onTap: () {
                          // Handle tap event here, for example, navigate to a new screen
                          print('Tapped ${names[index]}');
                        },
                      );
                    },
                  ),
                  if (userType == 'outlet')
                    const SizedBox(
                      height: 17,
                    ),
                  if (userType == 'outlet')
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: PartionCustomRow('Manage'),
                    ),
                  if (userType == 'outlet')
                    const SizedBox(
                      height: 5,
                    ),
                  if (userType == 'outlet')
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        // Replace the following with your actual icon paths and names
                        List<String> iconPaths = [
                          'assets/Work-Force.svg',
                        ];

                        List<String> names = [
                          'Work Force',
                        ];

                        return CustomIconContainer(
                          iconPath: iconPaths[index],
                          name: names[index],
                          onTap: () {
                            // Handle tap event here, for example, navigate to a new screen
                            print('Tapped ${names[index]}');
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 33,
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Icon(
          Icons.location_on_outlined,
          color: Colors.blue,
        ),
      ),
      margin: const EdgeInsets.only(
        top: 19,
        bottom: 14,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 6.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppbarTitle(
              text: "SJP",
            ),
            // const SizedBox(height: 3),
            // AppbarSubtitle(
            //   text: "Sarjapur Outlet",
            //   margin: EdgeInsets.only(
            //     left: 0,
            //   ),
            // ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Icon(
            notification
                ? Icons.notifications_active_sharp
                : Icons.notifications_none,
            color: Colors.black,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: CircleAvatar(
            radius: 25, // Adjust the size of the circle as needed
            backgroundImage: AssetImage(
                'assets/pexels-creation.jpg'), // Replace with your image URL
          ),
        ),
      ],
    );
  }
}
