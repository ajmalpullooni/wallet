import 'package:flutter/material.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/add_profile.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/privacy_policy.dart';
import 'package:my_wallet/screens/home/drawer_menu_pages/terms_and_condition.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:const Text('Ajmal'),
            accountEmail:const Text('ajmalpullooni@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/ima-8.jpg'),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.black),
          ),
          ListTile(
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 20,
            ),
            title: const Text(
              'Add Camera',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProfile();
              },),);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Colors.white,
              size: 20,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return  PrivacyPolicy();
              },),);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 20,
            ),
            title: const Text(
              'Terms and Conditions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const TermsAndConditions();
              },),);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.reset_tv_sharp,
              color: Colors.white,
              size: 20,
            ),
            title: const Text(
              'Reset',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProfile();
              },),);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            title: const Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProfile();
              },),);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 20,
            ),
            title:const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProfile();
              },),);
            },
          ),
        ],
      ),
    );
  }
}
