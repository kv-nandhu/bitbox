import 'package:bitebox/function/cancel_function.dart';
import 'package:bitebox/models/cancel_model.dart';
import 'package:flutter/material.dart';

cancelHelper cncl = cancelHelper();

Future<void> cancelbutton(ordercancel, BuildContext context) async {
  final cancel = Cancelorder(
      name: ordercancel!.productName,
      price: ordercancel.productPrice,
      about: ordercancel.productabout,
      image: ordercancel.productImage,
      deliveryAddress: ordercancel.deliveryAddress,
      deliveryName: ordercancel.deliveryName,
      deliveryPhone: ordercancel.deliveryPhone,
      pincode: ordercancel.pincode,
      productCount: ordercancel.productCount.toString(),
      id: ordercancel.id, 
      deliveryCity: ordercancel.deliveryCity);
      cncl.cancelthisorder(cancel);
      cncl.getall();

}
