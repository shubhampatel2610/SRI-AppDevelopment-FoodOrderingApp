import 'package:first_app/modles/prod_model.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'cart_screen.dart';
import 'welcome.dart';
import 'food_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<ProductModel> cart = [];
  int TotalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order your food :)'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'Foods & Drinks',
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Cart'),
                  SizedBox(width: 10),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ]),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignIn()));
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.logout_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => welcome()));
                },
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            FoodScreen((orderedFood) {
              setState(() {
                cart.add(orderedFood);
                TotalPrice = 0;
                cart.forEach((item) {
                  TotalPrice = TotalPrice + item.price;
                });
              });
            }),
            CartScreen(cart, TotalPrice),
          ],
        ),
      ),
    );
  }
}
