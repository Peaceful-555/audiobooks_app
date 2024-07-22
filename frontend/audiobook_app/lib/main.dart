import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/audiobook_provider.dart';
import 'providers/review_provider.dart';
import 'screens/audiobook_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudiobookProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
      ],
      child: MaterialApp(
        title: 'Audiobook App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AudiobookListScreen(),
      ),
    );
  }
}
