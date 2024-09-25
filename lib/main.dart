import 'package:firefly_app/Screen/Profile.dart';
// import 'package:firefly_app/Screen/Escalation/NewEscalation.dart';
// import 'package:firefly_app/Screen/Escalation/TicketHistory.dart';
// import 'package:firefly_app/Screen/Escalation/ViewAllEscalation.dart';
// import 'package:firefly_app/Screen/ImageUploadApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Map<String, dynamic> arguments = {
  'user_type': 'central', // Provide default values if necessary
  'outlets': [],
  'outlet': 'MCC',
  'outlet_info': {},
  'premissions': [],
};

void main() {
  runApp(
    Profile(),
// Operations(
//     arguments: arguments,
//   )
  );
}
