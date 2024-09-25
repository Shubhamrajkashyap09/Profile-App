import 'package:flutter/material.dart';

class StatusSelector extends StatefulWidget {
  final Function(String)? onTap;
  final String nowStatus;

  const StatusSelector({
    Key? key,
    required this.nowStatus,
    this.onTap,
  }) : super(key: key);

  @override
  _StatusSelectorState createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  late String nowStatus; // Declare nowStatus as a late variable

  @override
  void initState() {
    super.initState();
    nowStatus = widget.nowStatus; // Initialize nowStatus in initState
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusButton("Open"),
        _buildStatusButton("In Progress"),
        _buildStatusButton("Closed"),
      ],
    );
  }

  Widget _buildStatusButton(String status) {
    return GestureDetector(
      onTap: () {
        setState(() {
          nowStatus = status;
        });
        if (widget.onTap != null) {
          widget.onTap!(status); // Call the onTap function passed from outside
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: nowStatus == status ? Color(0xFF0A66C2) : Colors.white,
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
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5.5),
        child: Text(
          status,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: nowStatus == status ? Color(0xFFF8F8F8) : Color(0xFF696C7C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
