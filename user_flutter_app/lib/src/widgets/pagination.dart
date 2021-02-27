// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:user_flutter_app/src/models/user_model.dart';
// import 'package:user_flutter_app/src/providers/user_provider.dart';
//
// class Pagination extends StatefulWidget {
//   @override
//   _PaginationState createState() => _PaginationState();
// }
//
// class _PaginationState extends State<Pagination> {
//   List<UserModel> items(BuildContext ctx) {
//     return Provider.of<UserProvider>(context, listen: false).usersList;
//   }
//
//   int selectedItem = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final userId = ModalRoute.of(context).settings.arguments as String;
//     final selectedUser =
//         Provider.of<UserProvider>(context, listen: false).findUserById(userId);
//     return Column(
//       children: [
//         // Expanded(
//         //   child: ListView.builder(
//         //     itemCount: items(context).length,
//         //     itemBuilder: (context, index) {
//         //       return Container(
//         //         color: selectedItem == index ? Colors.blueGrey : null,
//         //         child: ListTile(
//         //           title: Text(selectedUser.firstName),
//         //           onTap: () => updateSelectedItem(index),
//         //         ),
//         //       );
//         //     },
//         //   ),
//         // ),
//         Container(
//           height: 300.0,
//           color: Theme.of(context).accentColor,
//           child: InteractiveViewer(
//             child: Image.network(
//               selectedUser.avatar,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//                 icon: Icon(Icons.navigate_before), onPressed: previousUser),
//             IconButton(
//                 icon: Icon(Icons.navigate_next),
//                 onPressed: () {
//                   nextUser(context);
//                 }),
//           ],
//         )
//       ],
//     );
//   }
//
//   void updateSelectedItem(int index) {
//     setState(() {
//       selectedItem = index;
//     });
//   }
//
//   void previousUser() {
//     setState(() {
//       currentIndex = items(context).indexOf(element)
//       selectedItem =
//     });
//   }
//
//   void nextUser(BuildContext ctx) {
//     if (selectedItem < items(ctx).length - 1) {
//       updateSelectedItem(selectedItem + 1);
//     }
//   }
// }
