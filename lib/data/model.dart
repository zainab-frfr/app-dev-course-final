class Model{
  final num rating;
  final String deliveryTime;
  final String image;
  final String peopleRated;
  final String title;
  final String quantity;
  final String descOne; 
  final String descTwo;

  Model({
    required this.rating,
    required this.deliveryTime,
    required this.image,
    required this.title,
    required this.peopleRated,
    required this.quantity,
    required this.descOne, 
    required this.descTwo,
  });

  factory Model.fromJson(Map<String,dynamic> json){ 
    return  Model(
      rating: json['rating'], 
      deliveryTime: json['deliveryTime'],
      image:  json['image'], 
      peopleRated: json['peopleRated'], 
      title: json['title'], 
      quantity: json['quantity'], 
      descOne : json['descriptionOne'],
      descTwo : json['descriptionTwo'],
    );
  }

}