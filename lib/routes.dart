import 'package:quizon/about/about.dart';
import 'profile/profile.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
