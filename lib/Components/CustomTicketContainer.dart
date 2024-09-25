import 'dart:io';

import 'package:firefly_app/Components/IssueCustomIconContainer.dart';
import 'package:flutter/material.dart';

class CustomTicketContainer extends StatelessWidget {
  final String ticketId;
  final String equipmentName;
  final String? equipmentId;
  final String? comment;
  final String issue;
  final String date;
  final List<File> ImageList;

  CustomTicketContainer({
    Key? key,
    required this.ticketId,
    required this.equipmentName,
    this.equipmentId,
    this.comment,
    required this.issue,
    required this.date,
    required this.ImageList,
  }) : super(key: key);

  // List<File> ImageList = [];

  @override
  Widget build(BuildContext context) {
    Color statusTextColor;
    switch (issue.toLowerCase()) {
      case 'not working':
        statusTextColor = Color(0xFFDC3D3D);
        break;
      case 'in_processing':
        statusTextColor = Colors.orange;
        break;
      case 'closed':
        statusTextColor = Colors.green;
        break;
      default:
        statusTextColor = Colors.black;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFECF6FF),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket ID: $ticketId',
                style: const TextStyle(
                  color: Color(0xFF0A66C2),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '$date',
                style: const TextStyle(
                  color: Color(0xFF0A66C2),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Divider(
            thickness: 1,
            color: Color(0xFF74ADE5),
          ),
          if (equipmentId != null) ...[
            Row(
              children: [
                Text(
                  '$equipmentName',
                  // 'Equipment: $equipmentName (ID: $equipmentId)',
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF44475B)),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  '(ID: $equipmentId)',
                  style: const TextStyle(
                      fontSize: 11.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7E8C)),
                ),
                Spacer(),
                Text(
                  '$issue',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: statusTextColor),
                ),
              ],
            ),
          ],
          if (equipmentId == null) ...[
            Text(
              '$equipmentName',
              style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF44475B)),
            ),
            Spacer(),
            Text(
              '$issue',
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: statusTextColor),
            ),
          ],
          if (comment != null) ...[
            const SizedBox(height: 8.0),
            Text(
              '$comment',
              style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF44475B)),
            ),
          ],
          const SizedBox(height: 8.0),
          if (ImageList != null) ...[
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: ImageList?.length,
              itemBuilder: (BuildContext context, int index) {
                if (ImageList != null && index < ImageList.length) {
                  return IssueCustomIconContainer(
                    Image: ImageList[index],
                  );
                } else {
                  return SizedBox
                      .shrink(); // Return an empty container if the index is out of bounds or the file is null
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
