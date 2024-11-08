import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:develp/constant.dart';
import 'package:develp/models/massagsModels.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Massagsmodels> massagelist = [];

  CollectionReference massage =
      FirebaseFirestore.instance.collection(kcollection);
  void sendmassage({required String massages, required String email}) {
    massage.add({
      'massage': massages,
      'time': DateTime.now(),
      'id': email,
    });
  }

  void getmassages() {
    massage.orderBy('time', descending: true).snapshots().listen(
      (event) {
        massagelist.clear();
        for (var mass in event.docs) {
          massagelist.add(Massagsmodels.fromJson(mass));
        }
        emit(ChatSucess(massage: massagelist));
      },
    );
  }
}
