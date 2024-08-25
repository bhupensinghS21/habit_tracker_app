import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habit_tracker_app/pages/user_page.dart';
import 'package:habit_tracker_app/providers/themeprovider.dart';
import 'package:habit_tracker_app/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker_app/providers/localprovider.dart';
import 'package:habit_tracker_app/pages/profile_page.dart';
import 'package:habit_tracker_app/pages/tracking_page.dart';
import 'package:habit_tracker_app/pages/home_page.dart';
import 'package:habit_tracker_app/pages/progress_page.dart';
import 'package:habit_tracker_app/providers/habitprovider.dart';
import 'package:habit_tracker_app/providers/trackingprovider.dart';
import 'package:go_router/go_router.dart';
import 'gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => HabitProvider()),
        ChangeNotifierProvider(create: (_) => TrackingProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the locale from LocaleProvider
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      locale: localeProvider.locale,
      // Add localization delegates
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavigationScreen(child: HomePage()),
    ),
    GoRoute(
      path: '/tracking',
      builder: (context, state) => const NavigationScreen(child: TrackingPage()),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const NavigationScreen(child: ProfilePage()),
    ),
    GoRoute(
      path: '/habits',
      builder: (context, state) => const NavigationScreen(child: Habitspage()),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const UserPage(),)
  ],
);

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void navigateTo(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class NavigationScreen extends StatelessWidget {
  final Widget child;
  const NavigationScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.navigateTo(index);
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/tracking');
              break;
            case 2:
              context.go('/profile');
              break;
            case 3:
              context.go('/habits');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Tracking"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: "Habits"),
        ],
      ),
    );
  }
}
