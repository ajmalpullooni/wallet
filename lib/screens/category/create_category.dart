// import 'package:flutter/material.dart';
// import 'package:my_wallet/screens/category/add_category.dart';

// class CreateCategory extends StatefulWidget {
//   const CreateCategory({super.key});

//   @override
//   State<CreateCategory> createState() => _CreateCategoryState();
// }

// class _CreateCategoryState extends State<CreateCategory> {
//   @override
//   Widget build(BuildContext context) {

//     Widget buildTextfileld(String hint,TextEditingController controller){
//       return Container(
//         margin:const EdgeInsets.all(5),
//         child: TextField(
//            decoration: InputDecoration(
//              labelText: hint,
//              border:const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.yellow,
//               )
//              )
//            ),
//            controller: controller,
//         ),
//       );
//     }

//     var usernameController=TextEditingController();
//     var emailController=TextEditingController();
//     var passwordController=TextEditingController();
//     return Container(
//       height: 100,
//       width: 200,
//       child: Column(
//         children: [
//           const Text('Add User',style: TextStyle(
//             fontWeight: FontWeight.w400,
//             fontSize: 32,
//             color: Colors.red
//           ),),
//           buildTextfileld('username',usernameController),
//           buildTextfileld('Email',emailController),
//           buildTextfileld('Password',passwordController),

//           ElevatedButton(onPressed: (){
//             ShowCategoryAddPopup(context);
//           }, child:const Text('add'),
//           ),
//         ],
//       ),
//     );
//   }
// }