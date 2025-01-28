

import 'package:feeling_metter/provider/form_provider.dart';
import 'package:feeling_metter/provider/select_provider.dart';
import 'package:feeling_metter/screen/view/my_home_page.dart';
import 'package:feeling_metter/screen/viewmodels/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoodFormProvider()),
        ChangeNotifierProvider(create: (_) => HomePageViewModel()),
        ChangeNotifierProvider(create: (_) => CarouselProvider()),  
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
        home: MyHomePage(),
       // Pass the routerConfig
    );
  }
}
