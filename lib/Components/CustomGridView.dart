import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> textList;

  const CustomGridView({Key? key, required this.textList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: calculateCrossAxisCount(context),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: textList.length,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                textList[index],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    // Calculate the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the ideal width for each grid item based on text size and desired spacing
    double itemWidth = 150; // You can adjust this based on your preference
    int crossAxisCount = (screenWidth / itemWidth).floor();

    return crossAxisCount > 0
        ? crossAxisCount
        : 1; // Ensure at least one grid item per row
  }
}
