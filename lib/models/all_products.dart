import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class AllProducts extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(image: 'assets/img/7.webp',title: 'flower',price: 10, details: 'i love flower'),
    ProductModel(image: 'assets/img/5.webp',title: 'flower',price: 20, details: 'i love flower'),
    ProductModel(image: 'assets/img/4.webp',title: 'flower',price: 30, details: 'i love flower'),
    ProductModel(image: 'assets/img/3.webp',title: 'flower',price: 40, details: 'i love flower'),
    ProductModel(image: 'assets/img/1.webp',title: 'flower',price: 50, details: 'i love flower'),
  ];
  createProduct(ProductModel product){
   products.add(ProductModel.reusable(product));
   notifyListeners();
  }
   deleteProduct(ProductModel product){
    int index= products.indexOf(product);
 products.removeAt(index);
 notifyListeners();
  }
}
