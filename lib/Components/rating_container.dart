import 'package:flutter/material.dart';

class RatingContainer extends StatelessWidget {
  final String ratingParameter;
  final double ratingValue;

  RatingContainer({required this.ratingParameter, required this.ratingValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ratingParameter,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8.0),
          // Row(
          //   children: List.generate(
          //     5,
          //     (index) => Icon(
          //         index < ratingValue ? Icons.star : Icons.star_border,
          //         color: ratingValue > 3 ? Colors.green : Colors.orange),
          //   ),
          // ),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.2),
                    child: Icon(
                      index < ratingValue ? Icons.star : Icons.star_border,
                      color: ratingValue > 3 ? Colors.green : Colors.orange,
                      size: 20, // Adjust the size of stars as needed
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  width:
                      7.1), // Add some space between stars and numerical rating
              Text(
                ratingValue.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
