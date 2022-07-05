import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modles/cart_modle.dart';

class MyProvider extends ChangeNotifier {
/////////////add to cart ////////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];

  late CartModle cartModle;
  void addToCart({
    required String image,
    required String foodname,
    required String price,
  }) {
    cartModle = CartModle(
      image: image,
      foodname: foodname,
      price: price,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }
}
