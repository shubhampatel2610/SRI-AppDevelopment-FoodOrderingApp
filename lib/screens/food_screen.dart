import 'package:flutter/material.dart';
import '../modles/prod_model.dart';

class FoodScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;
  FoodScreen(this._valueSetter);

  List<ProductModel> foods = [
    ProductModel('Burger', 100),
    ProductModel('Chicken', 100),
    ProductModel('Chinese', 100),
    ProductModel('Drinks', 100),
    ProductModel('Egg', 100),
    ProductModel('Gujarati', 100),
    ProductModel('Mocktail', 100),
    ProductModel('Paneer', 100),
    ProductModel('Pasta', 100),
    ProductModel('Pizza', 100),
    ProductModel('Salad', 100),
    ProductModel('South Indian', 100),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              foods[index].foodname,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            trailing: Text(
              '${foods[index].price}' + ' Rs/-',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onTap: () {
              _valueSetter(foods[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: foods.length);
  }
}
