import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
        color: Colors.white, 
      ),
        title: Text('Privacy Policy',style: TextStyle(
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