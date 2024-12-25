// import 'package:flutter/material.dart';
//
//
// import '../Home_Page.dart';
//
//
// Expanded searchField(BuildContext context) {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal:10 ),
//       child: Material(
//         color: Colors.transparent,
//         child: TextField(
//           controller: controller.txtSearch,
//           cursorColor:
//           Theme.of(context).colorScheme.onSurface,
//           onChanged: (value){
//             controller.fetchFilterRecordBySearch(value);
//           },
//           decoration: InputDecoration(
//             hintText: 'Search category...',
//             hintStyle: TextStyle(
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface
//                   .withOpacity(0.5),
//             ),
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     ),
//   );
// }