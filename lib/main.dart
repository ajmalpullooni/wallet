import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet/models/category/category_model.dart';
import 'package:my_wallet/models/transactions/transaction_model.dart';
import 'package:my_wallet/screens/Transactions/transaction_list/screen_add_transaction.dart';

import 'package:my_wallet/screens/splash_screen.dart';

Future<void> main() async {

  // final obj1=CategoryDB();
  // final obj2=CategoryDB();
  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  
  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
    Hive.registerAdapter(CategoryTypeAdapter());
  }


  if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
    Hive.registerAdapter(CategoryModelAdapter());
  }

   if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)){
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home:const  SplashScreen(),
      routes: {
        AddNewTransactions.routeName:(context) => const AddNewTransactions(),
      },
    );
  }
}

