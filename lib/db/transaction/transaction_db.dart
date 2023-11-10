import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/models/category/category_model.dart';
import 'package:my_wallet/models/transactions/transaction_model.dart';

const TRANSACTION_DB_NAME='transaction-db';

abstract class TransactionDbFunction{
  Future<void> AddTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
}

class TransacionDB implements TransactionDbFunction{

  TransacionDB._internal();

  static TransacionDB instance=TransacionDB._internal();

  factory TransacionDB(){
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =ValueNotifier([]);

  @override
  Future<void> AddTransaction(TransactionModel obj)async {
    final _db=await  Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
   await _db.put(obj.id, obj);
  }

  Future<void> refresh()async{
    final _list=await getAllTransactions();
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
    transactionListNotifier.notifyListeners();
  }
  
  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final _db=await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }

}