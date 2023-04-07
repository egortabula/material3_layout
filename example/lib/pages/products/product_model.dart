class ProductModel {
  final String title;
  final String description;
  final String photoUrl;
  final double price;

  ProductModel({
    required this.title,
    required this.description,
    this.photoUrl =
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-a429c.appspot.com/o/15.jpg?alt=media&token=0a3dad6f-1614-4b1a-8af6-95a68228ce00',
    this.price = 450,
  });
}
