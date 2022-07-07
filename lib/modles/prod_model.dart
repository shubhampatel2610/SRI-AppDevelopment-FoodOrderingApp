class ProductModel {
  late String image;
  late String foodname;
  late int price;

  ProductModel(String foodname, int price, String image) {
    this.foodname = foodname;
    this.price = price;
    this.image = image;
  }
}
