class ProductModel {
  final String image;
  final String title;
  final String details;
  final double price;

  ProductModel( {required this.image, required this.title, required this.price,required this.details,});
factory ProductModel.reusable(ProductModel product){
  return ProductModel(image: product.image, title: product.title, price: product.price, details: product.details);
}
}