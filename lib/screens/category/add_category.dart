import 'package:flutter/material.dart';
import 'package:my_wallet/db/category/category_db.dart';
import 'package:my_wallet/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategory =
    ValueNotifier(CategoryType.income);

Future<void> ShowCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        backgroundColor: Colors.black,
        title: const Text('Add Category',style: TextStyle(
          color: Colors.white,
        ),),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _nameEditingController,
              decoration: const InputDecoration(
                hintText: 'Category name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                RadioButton(title: 'Income', type: CategoryType.income),
                RadioButton(title: 'Expense', type: CategoryType.expense),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final _name = _nameEditingController.text;
                if (_name.isEmpty) {
                  return;
                }
                final _type = selectedCategory.value;
                final _category=CategoryModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: _name,
                    type: _type,
                    );


                    CategoryDB().insertCategory(_category);
                    Navigator.of(ctx).pop();
              },
              child: const Text('Add',style: TextStyle(
                color: Colors.black,
              ),),
            ),
          ),
        ],
      );
    },
  );
}



class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder( 
            valueListenable: selectedCategory,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                value: type,
                groupValue: newCategory,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  selectedCategory.value = value;
                  selectedCategory.notifyListeners();
                },
              );
            },
            ),
        Text(title,style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
