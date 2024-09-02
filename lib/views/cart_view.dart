
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });
  static const id = 'cart view';
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
    return Consumer<Cart>(builder: (context, Cart, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [CustomAppbar(title: 'Checkout', price: Cart.totalPrice,onPressed: () {
            
          },)],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Cart.totalProductse,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          Cart.products[index].image,
                        ),
                      ),
                      title: Text(
                        Cart.products[index].title,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal),
                      ),
                      subtitle: Text(
                        Cart.products[index].price.toString(),
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal),
                      ),
                      trailing: GestureDetector(
                          onTap: () {
                            Cart.remove(Cart.products[index]);
                          },
                          child: const Icon(
                            Icons.remove,
                          )),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: MaterialButton(
                elevation: 5,
                height: 50,
                onPressed: () {
                     

                },
                color: Colors.green,
                child:  Text(
                  'Pay \$${Cart.totalPrice}',
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
