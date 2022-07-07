import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'confirmation_page.dart';

class CartScreen extends StatefulWidget {
  final cart;
  var TotalPrice;
  CartScreen(this.cart, this.TotalPrice);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              'Total: ' + '${widget.TotalPrice}' + ' Rs/-',
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
                    widget.cart[index].foodname,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '${widget.cart[index].price}' + ' Rs/-',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove_outlined,
                          size: 20.0,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              widget.TotalPrice =
                                  widget.TotalPrice - widget.cart[index].price;
                              widget.cart.removeAt(index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: widget.cart.length,
              shrinkWrap: true,
              primary: false,
            ),
          ],
        ),
      ),
    );
  }
}
