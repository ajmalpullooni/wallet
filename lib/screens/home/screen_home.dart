import 'package:flutter/material.dart';
import 'package:my_wallet/screens/Transactions/screen_transactions.dart';
import 'package:my_wallet/screens/category/screen_category.dart';
import 'package:my_wallet/screens/home/widgets/bottom_navigation.dart';
import 'package:my_wallet/screens/insights/screen_insights.dart';

class ScreenHome extends StatelessWidget {
    ScreenHome({super.key});

  static ValueNotifier<int> selectedIndex=ValueNotifier(0);
  final _pages= [   
  const ScreenTransaction(),
  const ScreenCategory(),
   ScreenInsights(), 
   
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text('MyWallet',style: TextStyle(
      //       color: Colors.white,
      //     ),),
      //   ),
      //   backgroundColor: Colors.orange,
      // ),
      bottomNavigationBar: const BottomNAvigation(),
      body: SafeArea(child: ValueListenableBuilder(valueListenable: selectedIndex,
       builder: (BuildContext context,int updatedIndex,_ ) {
         return _pages[updatedIndex];
       },),
      ),
       backgroundColor: Colors.black,
    );
  }
}