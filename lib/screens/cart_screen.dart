import 'package:flutter/material.dart';

import 'confirmation_page.dart';

class CartScreen extends StatelessWidget {
  final cart;
  final TotalPrice;
  CartScreen(this.cart, this.TotalPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ' + '$TotalPrice' + ' Rs/-',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => Confirmation()));
              },
              child: Text(
                'CheckOut',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    cart[index].foodname,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  trailing: Text(
                    '${cart[index].price}' + ' Rs/-',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: cart.length,
              shrinkWrap: true,
              primary: false,
            ),
          ],
        ),
      ),
    );
  }
}
