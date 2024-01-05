class BlogResponse {
  List<Article> articles;

  BlogResponse({required this.articles});

  factory BlogResponse.fromJson(Map<String, dynamic> json) {
    return BlogResponse(
      articles: (json['articles'] as List)
          .map((i) => Article.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'articles': articles.map((e) => e.toJson()).toList(),
  };
}

class Article {
  String articleCategory;
  String articleName;
  String articleDescription;
  String dateTime;
  String articleImage;

  Article({
    required this.articleCategory,
    required this.articleName,
    required this.articleDescription,
    required this.dateTime,
    required this.articleImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleCategory: json['article_category'],
      articleName: json['article_name'],
      articleDescription: json['article_description'],
      dateTime: json['date_time'],
      articleImage: json['article_image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'article_category': articleCategory,
    'article_name': articleName,
    'article_description': articleDescription,
    'date_time': dateTime,
    'article_image': articleImage,
  };
}
