class PatientModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
  int value;

  PatientModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.review,
      required this.star,
      required this.value});
}

List<PatientModel> mainList = [
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Casual Jeans Pant",
    price: 155.99,
    review: 3.6,
    star: 4.8,
    id: 1,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "blue Coat",
    price: 143.99,
    review: 5.6,
    star: 5.0,
    id: 2,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Deep Green Jacket",
    price: 212.99,
    review: 2.6,
    star: 3.7,
    id: 3,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Orange Shirt",
    price: 432.99,
    review: 1.4,
    star: 2.4,
    id: 4,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Grey Pullover",
    price: 112.99,
    review: 4.2,
    star: 1.8,
    id: 5,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Pullover Sleeveless",
    price: 320.99,
    review: 2.1,
    star: 3.1,
    id: 6,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "Black Coat",
    price: 113.99,
    review: 3.1,
    star: 4.8,
    id: 7,
    value: 1,
  ),
  PatientModel(
    imageUrl: "assets/images/home/user_5.png",
    name: "White Shirt",
    price: 178.99,
    review: 2.6,
    star: 4.8,
    id: 8,
    value: 1,
  ),
];

List<PatientModel> itemsOnCart = [];
List<PatientModel> itemsOnSearch = [];
