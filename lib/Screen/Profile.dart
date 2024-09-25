import 'package:firefly_app/Components/CustomOutlinedButton.dart';
import 'package:firefly_app/app_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('My profile'),
          onLeadingTap: () {
            // Handle leading icon tap here
            print('Leading icon tapped!');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 50, // Adjust the size of the circle as needed
                    backgroundImage: AssetImage(
                        'assets/pexels-creation.jpg'), // Replace with your image URL
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Add your edit functionality here
                      },
                      child: SvgPicture.asset('assets/edit_icon.svg',
                          width: 28, height: 28),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Anand Mehta',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                'Head chef',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20, // Adjust the height according to your preference
              ),
              Container(
                width: 328,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(
                        0xFF74ADE5), // Use the specified accent blue color
                    width: 1,
                  ),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 3),
                    Text(
                      "Currently working at",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/Kitchen.jpg'),
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 90,
                            child: VerticalDivider(
                              width: 2,
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 12,
                              right: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "SJP",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Sarjapur Outlet",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Since 2023",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(
                        0xFF74ADE5), // Use the specified accent blue color
                    width: 1,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "My team",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                    )
                  ],
                ),
              ),
              const Spacer(),
              // RichText(
              //   text: const TextSpan(
              //     children: [
              //       TextSpan(
              //         text: "Incorrect profile?",
              //         style: TextStyle(
              //           fontFamily: 'Inter',
              //           fontSize: 12,
              //         ),
              //       ),
              //       TextSpan(
              //         text: " ",
              //       ),
              //       TextSpan(
              //         text: "Get help",
              //         style: TextStyle(fontFamily: 'Inter', fontSize: 12),
              //       )
              //     ],
              //   ),
              //   textAlign: TextAlign.left,
              // ),
              CustomOutlinedButton(
                text: "Log out",
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 20,
                ),
                buttonTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  // Add your logout functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
