class BlogDetails {
  String articleName;
  String articleDescription;
  String articleImage;

  BlogDetails({
    required this.articleName,
    required this.articleDescription,
    required this.articleImage,
  });

  factory BlogDetails.fromJson(Map<String, dynamic> json) {
    return BlogDetails(
      articleName: json['article_name'],
      articleDescription: json['article_description'],
      articleImage: json['article_image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'article_name': articleName,
    'article_description': articleDescription,
    'article_image': articleImage,
  };
}