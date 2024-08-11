import 'package:equatable/equatable.dart';
import 'package:medical_bloc/Chat/model.dart';

class ChatStats extends Equatable {
  int indexselect;
  List<ChatModel> chatuser = [];

  ChatStats({required this.chatuser, required this.indexselect});

  ChatStats copyWith(List<ChatModel>? chatuser, int? indexselect) {
    return ChatStats(
        chatuser: [], indexselect: indexselect ?? this.indexselect);
  }

  @override
  List<Object> get props => [indexselect];
}
