import 'package:equatable/equatable.dart';
import 'package:medical_bloc/Online_Pharmacy/model.dart';
import 'package:medical_bloc/utils/images.dart';

class ArcticlesStatus extends Equatable {
  List<TrendingArticleModel> TrendingArticles = [];
  List<PopularProductModel> PopularProduct = [];
  List<TrendingArticleModel> SavedArticles;
  int NoCount;

  ArcticlesStatus(
      {required this.TrendingArticles,
      required this.PopularProduct,
      this.SavedArticles = const [],
      required this.NoCount});
  ArcticlesStatus copyWith({
    List<TrendingArticleModel>? TrendingArticles,
    List<TrendingArticleModel>? SavedArticles,
    int? NoCount,
  }) {
    return ArcticlesStatus(
        TrendingArticles: TrendingArticles ?? this.TrendingArticles,
        NoCount: NoCount ?? this.NoCount,
        SavedArticles: SavedArticles ?? this.SavedArticles,
        PopularProduct: [
          PopularProductModel(
              images: Images.panadol,
              title: 'Panadol',
              ml: '20pcs',
              price: 15.99),
          PopularProductModel(
              images: Images.m1,
              title: 'Bodrex Herbal',
              ml: '100ml',
              price: 7.99),
          PopularProductModel(
              images: Images.m2, title: 'Konidin', ml: '3pcs', price: 5.99),
          PopularProductModel(
              images: 'images/md.png',
              title: 'OBH Combi',
              ml: '75ml',
              price: 9.99)
        ]);
  }

  @override
  List<Object> get props => [SavedArticles, NoCount];
}
