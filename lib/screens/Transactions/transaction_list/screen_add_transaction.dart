import 'package:flutter/material.dart';
import 'package:my_wallet/db/category/category_db.dart';
import 'package:my_wallet/db/transaction/transaction_db.dart';
import 'package:my_wallet/models/category/category_model.dart';
import 'package:my_wallet/models/transactions/transaction_model.dart';

class AddNewTransactions extends StatefulWidget {
  static const routeName = 'add-transaction';
  const AddNewTransactions({super.key});

  @override
  State<AddNewTransactions> createState() => _AddNewTransactionsState();
}

class _AddNewTransactionsState extends State<AddNewTransactions> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  /*
  purppose
  date
  amount
  category type
  income/expense
   */

  @override
  void initState() {
    _selectedCategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'All Transaction',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Amount
            TextFormField(
              controller: _amountTextEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Amount'),
            ),

            //Description
            TextFormField(
              controller: _purposeTextEditingController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            //calender

            TextButton.icon(
              onPressed: () async {
                final _selectedDateTemp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (_selectedDateTemp == null) {
                  return;
                } else {
                  print(_selectedDateTemp.toString());
                  setState(() {
                    _selectedDate = _selectedDateTemp;
                  });
                }
              },
              icon: const Icon(Icons.calendar_today),
              label: Text(_selectedDate == null
                  ? 'select date'
                  : _selectedDate!.toString()),
            ),

            //Radio button for choose the values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: CategoryType.income,
                      groupValue: _selectedCategorytype,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategorytype = CategoryType.income;
                          _categoryID = null;
                        });
                      },
                    ),
                    const Text('Income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CategoryType.expense,
                      groupValue: _selectedCategorytype,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategorytype = CategoryType.expense;
                          _categoryID = null;
                        });
                      },
                    ),
                    const Text('Expense'),
                  ],
                ),
              ],
            ),
            //Category Type
            DropdownButton<String>(
                hint: const Text('Select category'),
                value: _categoryID,
                items: (_selectedCategorytype == CategoryType.income
                        ? CategoryDB().incomeCategoryList
                        : CategoryDB().expnseCategoryList)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: (){
                      print(e.toString());
                      _selectedCategoryModel=e;
                    },
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  print(selectedValue);
                  setState(() {
                    _categoryID = selectedValue;
                  });
                }),
            //submit
            ElevatedButton(
              onPressed: () {
                addTransactions();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addTransactions() async {
    final _purposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;
    if (_amountText.isEmpty) {
      return;
    }
    if (_purposeText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }

    if(_selectedCategoryModel==null){
      return;
    }

    final _parseAmount=double.tryParse(_amountText);
    if(_parseAmount==null){
      return;
    }
   final _model= TransactionModel(
      amount: _parseAmount,
      purpose: _purposeText,
      date: _selectedDate!,
      type: _selectedCategorytype!,
      category: _selectedCategoryModel!, 
    );
    TransacionDB.instance.AddTransaction(_model);
  }
}
