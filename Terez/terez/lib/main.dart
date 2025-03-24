import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terez/Provider/counter_stream.dart';
import 'package:terez/Provider/future_provider.dart';
import 'package:terez/Provider/sign_up_provider.dart';
import 'package:terez/pages/Future_Screen.dart';
import 'package:terez/pages/Home_page.dart';
import 'package:terez/pages/SignUp_page.dart';
import 'package:terez/pages/Stream_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        FutureProvider<String>(
          create: (_) => fetchUserName(),
          initialData: 'Loading...',
          child: MyApp(),
        ),
        StreamProvider<int>(
          create: (context) => counterStream(),
          initialData: 0,
        ),
        ChangeNotifierProvider(create: (_) => SignUpProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterScreen(),
    );
  }
}
