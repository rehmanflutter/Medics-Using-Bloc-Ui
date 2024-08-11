import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/Chat/model.dart';
import 'package:medical_bloc/Chat/presenter/chat_event.dart';
import 'package:medical_bloc/Chat/presenter/chat_stat.dart';
import 'package:medical_bloc/utils/images.dart';

class ChatBloc extends Bloc<ChatEvent, ChatStats> {
  ChatBloc()
      : super(ChatStats(chatuser: [
          ChatModel(
              Name: 'Dr. Marcus Horizon',
              message: 'I don,t have any fever, but headchace...',
              pick: Images.doctor3,
              time: '10.24'),
          ChatModel(
              Name: 'Dr. Alysa Hana',
              message: 'Hello, How can i help you?',
              pick: Images.doctor4,
              time: '09:04'),
          ChatModel(
              Name: 'Dr. Maria Elena ',
              message: 'Do you have fever?',
              pick: Images.doctor5,
              time: '09:04')
        ], indexselect: 0)) {
    on<UpdatateInteger>((event, emit) {
      emit(ChatStats(chatuser: [
        ChatModel(
            Name: 'Dr. Marcus Horizon',
            message: 'I don,t have any fever, but headchace...',
            pick: Images.doctor3,
            time: '10.24'),
        ChatModel(
            Name: 'Dr. Alysa Hana',
            message: 'Hello, How can i help you?',
            pick: Images.doctor4,
            time: '09:04'),
        ChatModel(
            Name: 'Dr. Maria Elena ',
            message: 'Do you have fever?',
            pick: Images.doctor5,
            time: '09:04')
      ], indexselect: event.indexNo));
    });
  }

  // void _UpdatateInteger(UpdatateInteger event, Emitter<ChatStats> emit) {
  //   emit(state.copyWith(indexselect: event.indexNo));
  // }
}
