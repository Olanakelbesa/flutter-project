import 'package:ecom_mcp/Provider/add_to_cart_provider.dart';
import 'package:ecom_mcp/Provider/favorite_provider.dart';
import 'package:ecom_mcp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // for add to cart
          ChangeNotifierProvider(create: (_) => CartProvider()),
          // for favorite
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
          ),
          home: SplashPage(),
        ),
      );
}
