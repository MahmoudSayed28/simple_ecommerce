
import 'package:e_commerce/models/all_products.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/views/cart_view.dart';
import 'package:e_commerce/views/product_view.dart';
import 'package:e_commerce/widgets/custom_card.dart';
import 'package:e_commerce/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const id = 'home view';
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
      builder: (context, Cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(211, 164, 255, 193),
                          shape: BoxShape.circle),
                      child: Text(
                        Cart.totalProductse.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CartView.id);
                      },
                      icon: const Icon(Icons.add_shopping_cart)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 5),
                child: Text(
                  '\$ ${Cart.totalPrice}',
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              )
            ],
          ),
          body: Consumer<AllProducts>(
              // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
              builder: (context, AllProducts, child) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              itemCount: AllProducts.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductView(product: AllProducts.products[index]);
                    }));
                  },
                  child: CustomCard(
                    product: AllProducts.products[index],
                  ),
                );
              },
            );
          }),
          drawer:   const CustomDrawer(),
        );
      },
    );
  }
}
