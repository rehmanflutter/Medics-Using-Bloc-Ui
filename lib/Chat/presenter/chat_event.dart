import 'package:equatable/equatable.dart';

class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdatateInteger extends ChatEvent {
  int indexNo;
  UpdatateInteger({required this.indexNo});
  @override
  List<Object> get props => [indexNo];
}
