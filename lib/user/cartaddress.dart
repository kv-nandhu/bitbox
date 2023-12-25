// import 'package:bitebox/costum.dart';
// import 'package:bitebox/function/address_function.dart';
// import 'package:bitebox/models/address_model.dart';
// import 'package:bitebox/user/address_screen.dart';
// import 'package:bitebox/user/payment_screen.dart';
// import 'package:flutter/material.dart';

// class cartAddress extends StatefulWidget {
//   final dynamic totelPrice;
//   final int index;
//   cartAddress({
//     super.key,
//     required this.index,
//     required this.totelPrice,
//   });

//   @override
//   State<cartAddress> createState() => _cartAddressState();
// }

// class _cartAddressState extends State<cartAddress> {
//   @override
//   void initState() {
//     super.initState();
//     adhlp.getalladress();
//   }

//   addressHelper adhlp = addressHelper();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: customeText(
//           texts: 'Address',
//           textsize: 26,
//           textcolor: Colors.white,
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Card(
//             elevation: 10,
//             child: Container(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Center(
//                       child: customeText(
//                         texts: '1',
//                         textcolor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 2,
//                     width: 100,
//                     color: Colors.black54,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Center(
//                       child: customeText(
//                         texts: '2',
//                         textcolor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 2,
//                     width: 100,
//                     color: Colors.black54,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Center(
//                       child: customeText(
//                         texts: '3',
//                         textcolor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             color: Colors.blue,
//             child: Card(
//               elevation: 15,
//               child: ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => AddressScreen()));
//                 },
//                 leading: Icon(Icons.add),
//                 title: customeText(texts: 'Add Address'),
//               ),
//             ),
//           ),
//           Expanded(
//               child: ValueListenableBuilder(
//             valueListenable: addresslist,
//             builder: (context, List<Address> adrslist, Widget? child) {
//               return ListView.builder(
//                   itemCount: adrslist.length,
//                   itemBuilder: (context, index) {
//                     final addres = adrslist[index];
//                     return Card(
//                       elevation: 10,
//                       child: ListTile(
//                         onTap: () {
//                           print(addres);
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PaymentScreen()));
//                         },
//                         trailing: IconButton(
//                             onPressed: () {
//                               adhlp.delete(addres.id);
//                               print(addres.id);
//                             },
//                             icon: Icon(Icons.delete)),
//                         title: customeText(
//                           texts: addres.names,
//                           textweight: FontWeight.w600,
//                         ),
//                       ),
//                     );
//                   });
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }

