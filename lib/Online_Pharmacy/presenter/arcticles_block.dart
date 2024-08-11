import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/Online_Pharmacy/model.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_event.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_status.dart';
import 'package:medical_bloc/utils/images.dart';

class ArcticlesBlock extends Bloc<ArcticlesEvent, ArcticlesStatus> {
  ArcticlesBlock()
      : super(
          ArcticlesStatus(TrendingArticles: [
            TrendingArticleModel(
                images: Images.m7,
                title:
                    'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                date: 'Jun 12, 2021',
                read: '6 min read'),
            TrendingArticleModel(
                images: Images.m4,
                title: 'The Horror Of The Second Wave Of COVID-19',
                date: 'Jun 10, 2021',
                read: '5 min read'),
            TrendingArticleModel(
                images: Images.m5,
                title:
                    'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                date: 'Jun 12, 2021',
                read: '7 min read'),
            TrendingArticleModel(
                images: Images.m3,
                title:
                    'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                date: 'Jun 12, 2021',
                read: '6 min read'),
            TrendingArticleModel(
                images: Images.m6,
                title: 'The Horror Of The Second Wave Of COVID-19',
                date: 'Jun 10, 2021',
                read: '5 min read'),
            TrendingArticleModel(
                images: Images.m8,
                title:
                    'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                date: 'Jun 12, 2021',
                read: '7 min read')
          ], PopularProduct: [
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
          ], NoCount: 0),
        ) {
    on<AddItem>((event, emit) {
      emit(state.copyWith(NoCount: event.No));
    });
    on<SaveArticle>((event, emit) {
      //state.NoCount
      final isSaved = state.SavedArticles.contains(event.article);
      final updatedSavedArticles =
          List<TrendingArticleModel>.from(state.SavedArticles);

      if (isSaved) {
        // Remove the article if it's already saved
        updatedSavedArticles.remove(event.article);
      } else {
        // Add the article if it's not already saved
        updatedSavedArticles.add(event.article);
      }

      emit(state.copyWith(SavedArticles: updatedSavedArticles));
    });
  }
}
