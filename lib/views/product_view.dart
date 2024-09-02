
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/cart_view.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.product});
  static const id = 'product view';
  final ProductModel product;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool iscolabse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomAppbar(
            onPressed: () {
              Navigator.pushNamed(context, CartView.id);
            },
            title: widget.product.title,
            price: 0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.image,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(fontSize: 23),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Text('Rate',
                      style: TextStyle(
                          backgroundColor: Colors.greenAccent, fontSize: 20)),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  const Text(
                    'Product Shop',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.product.details,
                style: const TextStyle(fontSize: 18),
                maxLines: iscolabse ? 3 : null,
                overflow: TextOverflow.fade,
              ),
            ),
            TextButton(
              onPressed: () {
                iscolabse = !iscolabse;
                setState(() {});
              },
              child: iscolabse
                  ? const Text(
                      'Show more',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  : const Text(
                      'Show less',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
