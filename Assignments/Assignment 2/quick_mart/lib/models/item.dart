
class Item {
  String id;
  String title;
  double price;
  String category;
  String description;
  String imageName;
  Item(
    {
      required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.imageName

    }
  );
  factory Item.fromJson(Map<String,dynamic> json){
    return Item(
         id:json['id'],
         title:json['title'],
         price:json['price'],
        category:json['category'],
         description:json['description'],
         imageName:json['imageName']
    );
  }
}