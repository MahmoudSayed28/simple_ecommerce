
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key, required this.product, 
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
      builder: (context, Cart, child) 
        
      
    {  return Card(
        clipBehavior: Clip.none,
        elevation: 2,
        child: Column(
          children: [
            Image.asset(
              product.image,
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  '\$${product.price}',
                  style: const TextStyle( fontSize: 17,fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {
                    Cart.addproduct(product);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
              ],
            )
          ],
        ),
      );}
    );
  }
}
