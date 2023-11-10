
import 'package:flutter/material.dart';
import 'package:my_wallet/db/category/category_db.dart';

import 'package:my_wallet/screens/category/expense_list.dart';
import 'package:my_wallet/screens/category/income_list.dart';
import 'package:my_wallet/screens/core/constants.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/drawer_menu.dart';

import 'add_category.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController =TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // void showUserdialog(){
    //   showDialog(context: context, builder: (_){
    //     return AlertDialog();
    //     content:Adduser
    //   });
    //   }
    // }
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: mainColor),
        backgroundColor: Colors.black,
        title: const Padding(
          padding:  EdgeInsets.only(left: 90),
          child: Text(
            'Category',
            style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
        ),
        // leading: IconButton(onPressed: (){

        // }, icon: const Icon(Icons.menu,color: Colors.white,),
        // ),
      ),
      drawer:const DrawerMenu(),
      body:Column(
        children: [
          
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: .6,
            
             dividerColor: Colors.black,
            tabs:const [
            Tab(text: 'INCOME',),
            Tab(text: 'EXPENSE',),
          ],
          ),
          Expanded(
            child: TabBarView(
            
              controller: _tabController,
              children:const [
                IncomeList(),
                ExpenseList(),
            ],
            ),
          ),
          
        ],
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          ShowCategoryAddPopup(context);
        },
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}





