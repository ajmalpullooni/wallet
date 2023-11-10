import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/models/category/category_model.dart';

const CATEGORY_DB_NAME='category-database';

abstract class CategoryDbFunctions{    
   Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String id);
  // Future<void> editCategory(String id);

}
class CategoryDB implements CategoryDbFunctions{

  CategoryDB._internal();

  static CategoryDB instance= CategoryDB._internal();
  
  factory CategoryDB(){
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryList=ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expnseCategoryList=ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
    refreshUI();
  }
  
  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
   return _categoryDB.values.toList(); 
  }
  


  Future<void> refreshUI()async{
    final _allCategories=await getCategories();
    incomeCategoryList.value.clear();
    expnseCategoryList.value.clear();
    await Future.forEach(_allCategories, (CategoryModel category) {
      if(category.type==CategoryType.income){
        incomeCategoryList.value.add(category);
      }else{
        expnseCategoryList.value.add(category);
      }
    });

    incomeCategoryList.notifyListeners();
    expnseCategoryList.notifyListeners();
  }
  
  @override
  Future<void> deleteCategory(String Category_Id) async {
    final _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.delete(Category_Id);
    refreshUI();
  }
  
//  @override
// Future<void> editCategory(String categoryId, CategoryModel updatedCategory) async {
//   final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);  final existingCategory = _categoryDB.get(categoryId);

//   if (existingCategory != null) {
//     _categoryDB.put(categoryId, updatedCategory);
//     refreshUI();
//   }
// }

}