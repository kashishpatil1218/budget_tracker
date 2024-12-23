import 'package:flutter/material.dart';

import '../Home_Page.dart';

Widget filterWiseData() {


  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            controller.fetchData();
          },
          child: const Text('All'),
        ),
        OutlinedButton(
          onPressed: () {
            controller.filterByCategory(1);
          },
          child: const Text('Income'),
        ),
        OutlinedButton(
          onPressed: () {
            controller.filterByCategory(0);
          },
          child: const Text('Expance'),
        ),
      ],
    ),
  );


}