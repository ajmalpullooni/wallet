import 'package:flutter/material.dart';
import 'package:my_wallet/screens/Transactions/transaction_list/transaction_list.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TransactionList(),
        ],
      ),
    );
  }
}