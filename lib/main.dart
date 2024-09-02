
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/models/all_products.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/theme_model.dart';
import 'package:e_commerce/views/cart_view.dart';
import 'package:e_commerce/views/home_view.dart';
import 'package:e_commerce/views/login_view.dart';
import 'package:e_commerce/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  void initState() {
FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('***********User is currently signed out!************');
    } else {
      print('*********User is signed in!********');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ChangeNotifierProvider<AllProducts>(create: (context) => AllProducts()),
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          
        

        return MaterialApp(
          theme: ThemeData(
            brightness: themeModel.theme,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
                iconTheme: IconThemeData(color: Colors.white)),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            RegisterView.id: (context) => const RegisterView(),
            LoginView.id: (context) => const LoginView(),
            HomeView.id: (context) => const HomeView(),
            CartView.id: (context) => const CartView(),
          },
          home: FirebaseAuth.instance.currentUser == null ?const LoginView():const HomeView(),
        );}
      ),
    );
  }
}

