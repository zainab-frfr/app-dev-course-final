import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/data/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';
part 'states.dart';

class InformationBloc extends Bloc<Events, States>{

  final FirebaseFirestore store = FirebaseFirestore.instance;

  InformationBloc() : super(FetchingState()) {
    on<FetchData>(_fetchData);
  }

  void _fetchData( FetchData event, Emitter<States> emit) async{
    emit(FetchingState());
    try{

      List<Model> transactions =[];
      QuerySnapshot snapshot = await store.collection('transactions').get();
      transactions = snapshot.docs.map((doc) {
        //debugPrint(doc.toString());
        return Model.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      num balance = calculateBalance(transactions);

      emit(FetchedState(balance: balance, transactions: transactions));

    }catch (e){
      emit(ErrorState(message: e.toString()));
    }
  }

  num calculateBalance(List<Model> transactions){
    num balance = 0;
    for (Model transaction in transactions){
      if(transaction.incoming){
        balance += transaction.amount;
      }else{
        balance -= transaction.amount;
      }
    }

    return balance;
  }
  
}