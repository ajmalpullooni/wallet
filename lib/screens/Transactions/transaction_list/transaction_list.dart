import 'package:flutter/material.dart';

import '../../../db/transaction/transaction_db.dart';
import '../../../models/transactions/transaction_model.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    TransacionDB.instance.refresh();
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: TransacionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget?_){
          return ListView.separated(

            ///values
          itemBuilder: (context, index) {
            final _value =newList[index];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: ListTile(
                  textColor: Colors.white,
                  leading:const Icon(Icons.arrow_upward,color: Colors.green,),
                  subtitle: Text(_value.category.name),
                  title: Text('RS ${_value.amount}',style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                  ),),
                  //trailing:const Text('14\nsep'),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
          );
        },
      ),
    );
  }
}

// appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   backgroundColor: Colors.black,
      //   title: const Text(
      //     'All Transaction',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () => {}, icon: const Icon(Icons.filter_list_alt)),
      //     IconButton(
      //         onPressed: () => {},
      //         icon: const Icon(Icons.calendar_month_sharp)),
      //   ],
      // ),