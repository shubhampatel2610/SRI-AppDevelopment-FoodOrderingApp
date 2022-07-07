import 'package:flutter/material.dart';
import '../modles/prod_model.dart';

class FoodScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;
  FoodScreen(this._valueSetter);

  List<ProductModel> foods = [
    ProductModel('Cheese Burger', 100, 'images/burger.png'),
    ProductModel('Chicken Tanduri', 100, 'images/chicken.png'),
    ProductModel('Chinese Bhel', 100, 'images/chinese.png'),
    ProductModel('Cold Drinks', 100, 'images/drinks.png'),
    ProductModel('Egg Curry', 100, 'images/egg.png'),
    ProductModel('Gujarati Full Dish', 100, 'images/gujarati.png'),
    ProductModel('Mocktails', 100, 'images/mocktail.png'),
    ProductModel('Paneer Tikka', 100, 'images/paneer.png'),
    ProductModel('Red Chilly Pasta', 100, 'images/pasta.png'),
    ProductModel('Margherita Pizza', 100, 'images/pizza.png'),
    ProductModel('Veg Salad', 100, 'images/salad.png'),
    ProductModel('Masala Dosa', 100, 'images/south_indian.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                foods[index].image,
              ),
            ),
            title: Text(
              foods[index].foodname,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${foods[index].price}' + ' Rs/-',
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
                    Icons.add_outlined,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _valueSetter(foods[index]);
                  },
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        padding: const EdgeInsets.all(10),
        itemCount: foods.length);
  }
}
