import 'package:flutter/material.dart';

import '../Home_Page.dart';

Widget filterWiseData() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            controller.fetchData();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, elevation: 10, // Shadow elevation
            shadowColor: Colors.grey.shade600.withOpacity(0.3), // Text color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
          child: const Text(
            'All',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.filterByCategory(1);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, elevation: 10, // Shadow elevation
            shadowColor: Colors.grey.shade600.withOpacity(0.3), // Text color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),

          child: const Text(
            'Income',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.filterByCategory(0);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, elevation: 10, // Shadow elevation
            shadowColor: Colors.grey.shade600.withOpacity(0.3), // Text color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
          child: const Text(
            'Expance',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ),
  );
}
