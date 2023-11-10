import 'package:flutter/material.dart';
import 'package:my_wallet/screens/core/constants.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/drawer_menu.dart';

class ScreenInsights extends StatefulWidget {
  ScreenInsights({super.key});

  @override
  State<ScreenInsights> createState() => _ScreenInsightsState();
}

class _ScreenInsightsState extends State<ScreenInsights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: mainColor),
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'Insights',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      backgroundColor: Colors.black,
      
      drawer:const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: myConstantBorderRadius,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 140, bottom: 7),
                      child: DropdownButton(items: const [
                        DropdownMenuItem(
                          child: Text('All'),
                          value: 'dashh',
                        ),
                        DropdownMenuItem(
                          child: Text('spark'),
                          value: 'sparkk',
                        ),
                        DropdownMenuItem(
                          child: Text('dash'),
                          value: 'dashh',
                        ),
                      ], onChanged: (value) {}),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
             

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Income',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  'Expense',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
      
                  ),
      
                ),
      
              ],
            ),
      
            //  TabBar(
            //   controller: _tabController,
            //   labelColor: Colors.white,
            //   unselectedLabelColor: Colors.grey,
            //   indicatorColor: Colors.black,
            //   indicatorWeight: .6,
      
            //    dividerColor: Colors.black,
            //   tabs:const [
            //   Tab(text: 'INCOME',),
            //   Tab(text: 'EXPENSE',),
            // ],
            // ),
          ],
        ),
      ),
    );
  }
}

class TabBarViewMenu extends StatefulWidget {
  const TabBarViewMenu({super.key});

  @override
  State<TabBarViewMenu> createState() => _TabBarViewMenuState();
}

class _TabBarViewMenuState extends State<TabBarViewMenu> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override 
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();

    @override
    void dispose(){
      tabController.dispose();
      super.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(height: 50,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(5),child: TabBar(tabs: [
                    Tab(text: 'tab1',),
                    Tab(text: 'tab1',),
                    Tab(text: 'tab1',),
                  ]),),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
