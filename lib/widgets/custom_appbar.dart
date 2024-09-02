import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.price, this.onPressed,
  });
  final String title;
  final double price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    num width=MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
    return Consumer<Cart>(builder: (context, Cart, child) {
      return Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
           SizedBox(
            width: width/4.9,
          ),
          Stack(
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle),
                  child: Text(
                    Cart.totalProductse.toString(),
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  )),
              IconButton(
                  onPressed:onPressed , icon: const Icon(Icons.add_shopping_cart)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 5),
            child: Text(
              '\$ ${Cart.totalPrice.toString()}',
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          )
        ],
      );
    },);
  }
}
