class TrendingArticleModel {
  String images;
  String title;
  String date;
  String read;
  TrendingArticleModel(
      {required this.images,
      required this.title,
      required this.date,
      required this.read});
}

class PopularProductModel {
  String images;
  String title;
  String ml;
  double price;
  PopularProductModel(
      {required this.images,
      required this.title,
      required this.ml,
      required this.price});
}
