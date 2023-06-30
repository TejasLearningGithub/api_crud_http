import 'package:flutter/material.dart';
import 'package:http_self_first/provider/get_provider.dart';
import 'package:http_self_first/screen/create_data.dart';
import 'package:http_self_first/screen/disp_data.dart';
import 'package:http_self_first/screen/update_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetProvider()),
      ],
      child: const MaterialApp(
        home: DispData(),
      ),
    );
  }
}


