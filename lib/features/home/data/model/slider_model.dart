// "_id": "680d16ca408c2a3e015a83b0",
// "photo_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbpR5UwmiL1npP790Q-3rPsAm18AMvUk180ixGC44Kwy-eCMC_OwE15SpK3PHSeqRuTqk&usqp=CAU",
// "description": "Iphone 16 pro",
// "product": null,
// "brand": "679a05182b11cd5ff18023e9",

class SliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String productId;
  final String brand;

  SliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.productId,
    required this.brand
  });
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      productId: json['product'],
      brand: json['brand'],
    );
  }
}