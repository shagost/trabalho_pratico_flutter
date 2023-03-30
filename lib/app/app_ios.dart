import 'package:flutter/cupertino.dart';
import 'package:trabalho_pratico_flutter/pages/home_page_ios.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
