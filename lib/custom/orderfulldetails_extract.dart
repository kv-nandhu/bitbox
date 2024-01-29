// import 'dart:io';

// import 'package:bitebox/models/order_model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class orderdetails extends StatelessWidget {
//   const orderdetails({
//     super.key,
//     required this.orderdetail,
//   });

//   final Oredrplace orderdetail;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             'Qty : ${orderdetail.productCount.toString()}',
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'OrderPlaced',
//             style: GoogleFonts.rubik(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class orderproduct extends StatelessWidget {
//   const orderproduct({
//     super.key,
//     required this.orderdetail,
//   });

//   final Oredrplace orderdetail;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//             height: 75,
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(20)),
//             child: Image.file(
//                 File(orderdetail.productImage))),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               Text(
//                 orderdetail.productName,
//                 style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '₹${orderdetail.totalPrice.toString()}',
//                 style: GoogleFonts.rubik(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
