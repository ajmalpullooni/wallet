import 'package:flutter/material.dart';

import 'package:my_wallet/screens/Transactions/transaction_list/screen_add_transaction.dart';
import 'package:my_wallet/screens/Transactions/transaction_list/transaction_list.dart';
import 'package:my_wallet/screens/core/constants.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/drawer_menu.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: mainColor),
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'MyWallet',
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return const Add_Transactions();
        // },),);
        Navigator.of(context).pushNamed(AddNewTransactions.routeName);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      drawer: const DrawerMenu(),
      backgroundColor: Colors.black,
      body: SafeArea( 
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _head(),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                      'Transaction History',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const TransactionList();
                          }));
                        },
                        child:const Text('See All'),
                      ),
                    ),
              ],
            ),
          
            
          ],
        ),
        
        // child: CustomScrollView(

          
          // slivers: [
          //   SliverToBoxAdapter(
          //     child: _head(),
          //   ),
          //   SliverToBoxAdapter(
          //     child: Padding(
          //       padding: const EdgeInsets.only(top: 20),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           const Text(
          //             'Transaction History',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 19,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //           Container(
          //             height: 35,
          //             width: 80,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
                     
          //             child: TextButton(
          //               style: TextButton.styleFrom(
          //                 foregroundColor: Colors.black,
          //               ),
          //               onPressed: () {
          //                 Navigator.push(context, MaterialPageRoute(builder: (context){
          //                   return TransactionList();
          //                 }));
          //               },
          //               child:const Text('See All'),
          //             ),
          //           ),
                   
          //         ],
          //       ),
          //     ),
              
          //   ),
            
            // Column(
            //   children: [
            //     ListView.separated(itemBuilder: (ctx,index){
            //       return ListTile(
            //         leading: Text('12 dec'),
            //         title: Text('10000'),
            //         trailing: Text('Travel'),
            //       );
            //     },
            //      separatorBuilder: (ctx,index){
            //       return SizedBox(height: 10,);
            //      },
            //      itemCount: 10,
            //      ),

            //   ],
            // ),
          // ],
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context){
      //         return  AddTransaction();
      //     }));
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ), // You can customize the icon.
      // ),
    );
  }

  Widget _head() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            height: 180,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Total Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹ 48000',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_downward,
                                color: mainColor,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(width: 60,),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_upward,
                                color: mainColor,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ 48000',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: mainColor),
                      ),
                      Text(
                        '₹ 2000',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: mainColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class Transaction extends StatelessWidget {
//   const Transaction({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (ctx, index) {
//         return const ListTile(
//           leading: Text('12 dec'),
//           title: Text('10000'),
//           subtitle: Text('Travel'),
//         );
//       },
//       separatorBuilder: (ctx, index) {
//         return const SizedBox(
//           height: 10,
//         );
//       },
//       itemCount: 10,
//     );
//   }
// }
