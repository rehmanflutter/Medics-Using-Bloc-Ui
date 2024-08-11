import 'package:equatable/equatable.dart';
import 'package:medical_bloc/Online_Pharmacy/model.dart';

abstract class ArcticlesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddItem extends ArcticlesEvent {
  int No;
  AddItem({required this.No});
  @override
  List<Object> get props => [No];
}

class SaveArticle extends ArcticlesEvent {
  final TrendingArticleModel article;

  SaveArticle({required this.article});
}
