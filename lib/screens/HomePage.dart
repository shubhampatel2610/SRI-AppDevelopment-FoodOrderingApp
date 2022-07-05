import 'package:first_app/provider/provider.dart';
import 'package:first_app/screens/SignIn.dart';
import 'package:first_app/screens/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  TextEditingController qty = TextEditingController();

  @override
  Widget foods(
      {required String name, required String price, required String image}) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 75,
            backgroundImage: new AssetImage(image),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                price + ' Rs',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 30,
                child: TextFormField(
                  controller: qty,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Qty',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 60,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order your food :)'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => SignIn()));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddToCart()));
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 600,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                foods(
                  name: 'Cheezy 7 pizza',
                  price: '1100',
                  image: 'images/pizza.png',
                ),
                foods(
                  name: 'White sauce pasta',
                  price: '75',
                  image: 'images/pasta.png',
                ),
                foods(
                  name: ' Cheese burger',
                  price: '90',
                  image: 'images/burger.png',
                ),
                foods(
                  name: 'Chicken biryani',
                  price: '120',
                  image: 'images/chicken.png',
                ),
                foods(
                  name: 'Egg curry',
                  price: '100',
                  image: 'images/egg.png',
                ),
                foods(
                  name: 'Cold drinks',
                  price: '40',
                  image: 'images/drinks.png',
                ),
                foods(
                  name: 'Gujarati maha thali',
                  price: '90',
                  image: 'images/gujarati.png',
                ),
                foods(
                  name: 'Mocktails',
                  price: '55',
                  image: 'images/mocktail.png',
                ),
                foods(
                  name: 'Paneer tikka',
                  price: '70',
                  image: 'images/paneer.png',
                ),
                foods(
                  name: 'Egg gravy',
                  price: '85',
                  image: 'images/egg.png',
                ),
                foods(
                  name: 'Chilli pasta',
                  price: '65',
                  image: 'images/pasta.png',
                ),
                foods(
                  name: 'Hamburger',
                  price: '125',
                  image: 'images/burger.png',
                ),
                foods(
                  name: 'Mix salad',
                  price: '35',
                  image: 'images/salad.png',
                ),
                foods(
                  name: 'Masala dosa',
                  price: '45',
                  image: 'images/south_indian.png',
                ),
                foods(
                  name: 'Paneer butter masala',
                  price: '85',
                  image: 'images/paneer.png',
                ),
                foods(
                  name: 'Gujarati thali',
                  price: '45',
                  image: 'images/gujarati.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
