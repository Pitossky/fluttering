import 'package:ecommerce_app/models/best_selling_product.dart';
import 'package:ecommerce_app/models/popular_product.dart';

final _headphones = PopularProduct(
  imageUrl: 'assets/images/headphones.png',
  price: 150,
  oldPrice: 350,
  discount: 50,
);

final _earphones = PopularProduct(
  imageUrl: 'assets/images/earphones.png',
  price: 90,
  oldPrice: 200,
  discount: 50,
);

final _watch = PopularProduct(
  imageUrl: 'assets/images/watch.png',
  price: 110,
  oldPrice: 250,
  discount: 50,
);

final List<PopularProduct> popularProductsList = [
  _headphones,
  _earphones,
  _watch,
];

final _eruptM9 = BestSellingProduct(
    imageUrl: 'assets/images/head1.jpeg',
    price: 179,
    description: '3D Sound 2.5Hz',
    name: 'Frid 16D',
    rating: 5,
    listImagesUrl: [
      'assets/images/head2.jpeg',
      'assets/images/head3.jpeg',
      'assets/images/head1.jpeg'
    ],
    battery: 24,
    input: 30,
    bluetooth: 3.9,
    sound: 3,
    maxDescription: '16D Technical features including a masterclass.');

final List<BestSellingProduct> bestSellingProductsList = [
  _eruptM9,
  _eruptM9,
];
