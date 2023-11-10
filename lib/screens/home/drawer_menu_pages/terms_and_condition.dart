import 'package:flutter/material.dart';


class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
        color: Colors.white, 
      ),
        title: Text('Terms and Condition',style: TextStyle(
          color: Colors.white,
          
        ),),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Text('helo')
      ],),
    );
  }
}