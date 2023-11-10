import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Add_Transactions extends StatefulWidget {
  const Add_Transactions({super.key});

  @override
  State<Add_Transactions> createState() => _Add_TransactionsState();
}

// ignore: camel_case_types
class _Add_TransactionsState extends State<Add_Transactions>
    with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController dateinput = TextEditingController();

  final List<String> genderItems = ['Food', 'Travel', 'Other'];

  String? selectedValue;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                indicatorWeight: .6,
                dividerColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'INCOME',
                  ),
                  Tab(
                    text: 'EXPENSE',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 30, right: 30, top: 20),

                        //   //Category dropdown menu....
                        //   child: TextField(
                        //     readOnly: true,
                        //     style: const TextStyle(color: Colors.white),
                        //     decoration: InputDecoration(
                        //       hintText: 'Select Category',
                        //       hintStyle: const TextStyle(color: Colors.grey),
                        //       border: const OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(20)),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             color: Colors.grey, width: 1),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             color: Colors.grey, width: 1),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //dropdown textfield with package ...
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: DropdownButtonFormField(
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            //             decoration: InputDecoration(
                            //   // Add Horizontal padding using menuItemStyleData.padding so it matches
                            //   // the menu padding when button's width is not specified.
                            //   // contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(15),
                            //   ),
                            //   // Add more decoration..
                            // ),
                            decoration: InputDecoration(
                              hintText: 'Select Category',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            items: genderItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {},
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10),
                        //   child: Container(
                        //     height: 50,
                        //     width: 320,
                        //     decoration: BoxDecoration(
                        //       color: Colors.black,
                        //       borderRadius: myConstantBorderRadius,
                        //       border: Border.all(
                        //         color: Colors.grey,
                        //         width: 1,
                        //       ),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         const Padding(
                        //           padding: EdgeInsets.only(left: 20),
                        //           child: Text(
                        //             'All',
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           width: 50,
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.only(
                        //               left: 140, bottom: 7),
                        //           child: DropdownButton(items: const [
                        //             DropdownMenuItem(
                        //               value: 'dashh',
                        //               child: Text('All'),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: 'All',
                        //               child: Text('spark'),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: 'dashh',
                        //               child: Text('dash'),
                        //             ),
                        //           ], onChanged: (value) {}),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Enter the amount',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            controller: dateinput,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                // contentPadding: const EdgeInsets.all(30),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Colors.grey,
                                ),
                                hintText: 'Select date',
                                hintStyle: const TextStyle(color: Colors.grey)),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1998),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                // ignore: avoid_print
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                print(formattedDate);

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Enter the Descrption',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)),
                                child: const Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

//   Future<void> _selectDate()async{
//     DateTime? _picked=await showDatePicker(
//       context: context,
//      initialDate: DateTime.now(),
//       firstDate: DateTime(1998),
//        lastDate: DateTime(2100),
//        );
//       //  if(_picked!=null){
//       //   setState(() {
//       //     _date.text=_picked.toString().split('')[0];
//       //   });
//       //  }
//       if(_picked != null ){
//     print(_picked);  //pickedDate output format => 2021-03-10 00:00:00.000
//     String formattedDate = DateFormat('yyyy-MM-dd').format(_picked);
//     print(formattedDate); //formatted date output using intl package =>  2021-03-16
// }else{
//     print("Date is not selected");
// }
//   }
}
