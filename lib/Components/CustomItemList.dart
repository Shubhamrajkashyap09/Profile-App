import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class CustomItemList extends StatefulWidget {
  final List<Tuple2<String, bool>> items;
  final Tuple2<String, bool>? selectedItem;

  const CustomItemList({Key? key, required this.items, this.selectedItem})
      : super(key: key);

  @override
  _CustomItemListState createState() => _CustomItemListState();
}

class _CustomItemListState extends State<CustomItemList> {
  var selectedItem;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxItemWidth =
            constraints.maxWidth / 4; // Adjust this value as needed
        final itemWidgets = <Widget>[];

        List<Widget> rowWidgets = [];
        double rowWidth = 0;

        for (var item in widget.items) {
          final itemWidth = item.item1.length *
              10.0; // Adjust multiplier based on font and size
          final width = itemWidth > maxItemWidth ? maxItemWidth : itemWidth;

          if (rowWidth + width + 16 <= constraints.maxWidth) {
            rowWidgets.add(
              GestureDetector(
                onTap: () {
                  // Handle container tap here
                  selectedItem = item.item1;
                  setState(() {});
                  print(selectedItem);
                  print('Tapped on: ${item.item1}');
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: item.item2
                        ? Colors.grey.shade300
                        : Colors.grey
                            .shade100, // Show container only if item.item2 is true
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(item.item1),
                    ),
                  ),
                ),
              ),
            );
            rowWidth += width + 16; // Add spacing between containers
          } else {
            itemWidgets.add(
              Row(
                children: rowWidgets,
              ),
            );
            rowWidgets = [
              if (item.item2 == true)
                GestureDetector(
                  onTap: () {
                    // Handle container tap here
                    print('Tapped on: ${item.item1}');
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    width: width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: item.item2
                          ? Colors.grey.shade300
                          : Colors.grey
                              .shade100, // Show container only if item.item2 is true
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(item.item1),
                      ),
                    ),
                  ),
                )
            ];
            rowWidth = width + 16;
          }
        }

        if (rowWidgets.isNotEmpty) {
          itemWidgets.add(
            Row(
              children: rowWidgets,
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: itemWidgets,
          ),
        );
      },
    );
  }
}


// class _CustomItemListState extends State<CustomItemList> {
//   String? _selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final maxItemWidth =
//             constraints.maxWidth / 4; // Adjust this value as needed
//         final itemWidgets = <Widget>[];

//         List<Widget> rowWidgets = [];
//         double rowWidth = 0;

//         for (var item in widget.items) {
//           final itemWidth =
//               item.length * 10.0; // Adjust multiplier based on font and size
//           final width = itemWidth > maxItemWidth ? maxItemWidth : itemWidth;

//           final isSelected = _selectedItem == item;

//           if (rowWidth + width + 16 <= constraints.maxWidth) {
//             rowWidgets.add(
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedItem = item;
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(8.0),
//                   width: width,
//                   height: 50.0,
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Colors.blue.shade300
//                         : Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 5),
//                       child: Text(item),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//             rowWidth += width + 16; // Add spacing between containers
//           } else {
//             itemWidgets.add(
//               Row(
//                 children: rowWidgets,
//               ),
//             );
//             rowWidgets = [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedItem = item;
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(8.0),
//                   width: width,
//                   height: 50.0,
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Colors.blue.shade300
//                         : Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 5),
//                       child: Text(item),
//                     ),
//                   ),
//                 ),
//               )
//             ];
//             rowWidth = width + 16;
//           }
//         }

//         if (rowWidgets.isNotEmpty) {
//           itemWidgets.add(
//             Row(
//               children: rowWidgets,
//             ),
//           );
//         }

//         return SingleChildScrollView(
//           child: Column(
//             children: itemWidgets,
//           ),
//         );
//       },
//     );
//   }
// }
