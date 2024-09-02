import 'package:e_commerce/models/theme_model.dart';
import 'package:e_commerce/views/cart_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ThemeModel>(builder: (context, thameModel, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Coder',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  accountEmail: Text(
                    'Coder@email.com',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/img/avatar.png'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/test.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                thameModel.theme == Brightness.dark
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: MaterialButton(
                          onPressed: () {
                            thameModel.convertDarkMode();
                          },
                          color: Colors.blue,
                          child: const Icon(
                            Icons.light_mode_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: MaterialButton(
                          onPressed: () {
                            thameModel.convertLightMode();
                          },
                          color: Colors.black,
                          child: const Icon(
                            Icons.dark_mode_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                CustomListTile(
                    icon: const Icon(Icons.home, size: 30),
                    text: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                    }),
                CustomListTile(
                    icon: const Icon(Icons.shopping_cart, size: 30),
                    text: 'My Products',
                    onTap: () {
                      Navigator.pushNamed(context, CartView.id);
                    }),
                CustomListTile(
                    icon: const Icon(Icons.info, size: 30),
                    text: 'About',
                    onTap: () {}),
                CustomListTile(
                    icon: const Icon(Icons.exit_to_app, size: 30),
                    text: 'Logout',
                    onTap: ()async {
                      await FirebaseAuth.instance.signOut();
                    })
              ],
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Developed by coder © 2024',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final Widget icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        onTap: onTap);
  }
}
