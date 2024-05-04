// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:like_button/like_button.dart';
// import 'package:provider/provider.dart';
// import 'package:travelapp/apps/router/router_name.dart';
// import 'package:travelapp/provider/like_provider.dart';

// class PostAppBar extends StatelessWidget {
//   const PostAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () {
//                 context.goNamed(RouterName.homepage);
//               },
//               child: Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         blurRadius: 3,
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white),
//                 child: Icon(Icons.arrow_back_ios_new, size: 20),
//               ),
//             ),
//             Container(
//               width: 45,
//               height: 45,
//               decoration: BoxDecoration(boxShadow: [
//                 BoxShadow(
//                   color: Colors.black,
//                   blurRadius: 3,
//                 )
//               ], borderRadius: BorderRadius.circular(10), color: Colors.white),
//               child: LikeButton(
//                 onTap: (like) {
//                   context.read<LikeProviderLct>().onLike(item.id);
//                   return Future.value(!like);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
