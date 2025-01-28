

import 'package:feeling_metter/core/routes/routes.dart';
import 'package:feeling_metter/provider/form_provider.dart';
import 'package:feeling_metter/provider/select_provider.dart';
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
    return  MaterialApp.router(

      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router, 
      
       // Pass the routerConfig
    );
  }
}
