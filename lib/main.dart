import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakathon_elancer/database/db_controller.dart';
import 'package:hakathon_elancer/modules/auth/admin/login_screen.dart';
import 'package:hakathon_elancer/modules/auth/freelancer/login_screen.dart';
import 'package:hakathon_elancer/modules/auth/freelancer/register_screen.dart';
import 'package:hakathon_elancer/modules/freelancer/profile/add_project.dart';
import 'package:hakathon_elancer/modules/freelancer/profile/edit_profile.dart';
import 'package:hakathon_elancer/modules/home/home_screen.dart';
import 'package:hakathon_elancer/modules/launch/launch_screen.dart';
import 'package:hakathon_elancer/modules/launch/onboarding_screen.dart';
import 'package:hakathon_elancer/prefs/shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/on_boarding_screen': (context) => const OnBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/edit_profile_screen': (context) => const EditProfileScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/add_project_screen': (context) => const AddProfileScreen(),
        '/admin_login_screen': (context) => const AdminLoginScreen(),
      },
    );
  }
}
