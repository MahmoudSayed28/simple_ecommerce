import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<ProductModel> products=[];
  double price=0;
  addproduct(ProductModel product){
    products.add(product);
    price+=product.price;
    notifyListeners();
  }
void remove(ProductModel product){
 int index= products.indexOf(product);
 products.removeAt(index);
 price-=product.price;
 notifyListeners();
}
get totalPrice=>price;
get totalProductse=>products.length;
}