import 'package:flutter/material.dart';
import 'package:my_projects/src/features/dashboard/dashboard.dart';
import 'package:my_projects/src/features/dashboard/dashboard_provider.dart';
import 'package:my_projects/src/features/dashboard/homescreen_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: Consumer<HomeScreenProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            restorationScopeId: 'app',
            title: "Ashish Pipaliya | Flutter Developer",
            theme: value.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (context) => const Dashboard(),
            },
          );
        },
      ),
    );
  }
}
