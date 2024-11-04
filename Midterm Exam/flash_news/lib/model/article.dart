class Article{
  String headline;
  String content;
  String image; 
  String category;
  String writer;
  String publishDate;
  Article(
    {
     required this.headline,
     required this.content,
     required this.image,
     required this.category,
     required this.writer,
     required this.publishDate
    }
  );
   factory Article.fromJson(Map<String,dynamic> json){
    return Article(
         headline:json['headline'],
         content:json['content'],
         image:json['image'],
         category:json['category'],
         writer:json['writer'],
         publishDate:json['publishDate']
    );
  }
}
