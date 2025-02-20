// import 'package:flutter/material.dart';

// class ShoeSizeSelector extends StatefulWidget {
//   // int shoeSizes;
//   const ShoeSizeSelector({super.key});

//   @override
//   _ShoeSizeSelectorState createState() => _ShoeSizeSelectorState();
// }

// class _ShoeSizeSelectorState extends State<ShoeSizeSelector> {
//   final List<int> shoeSizes = [38, 39, 40, 41, 42, 43, 44];
//   int selectedSize = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 5,
//           crossAxisSpacing: 20.0,
//           mainAxisSpacing: 20.0,
//         ),
//         itemCount: shoeSizes.length,
//         itemBuilder: (context, index) {
//           int size = shoeSizes[index];
//           bool isSelected = selectedSize == size;
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedSize = size;
//               });
//             },
//             child: SizedBox(
//               height: 10,
//               width: 10,
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: isSelected ? Colors.black : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8.0),
//                   border: Border.all(
//                     color: isSelected ? Colors.black : Colors.grey,
//                     width: 2.0,
//                   ),
//                 ),
//                 child: Text(
//                   size.toString(),
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: isSelected ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
