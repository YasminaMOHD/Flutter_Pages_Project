import 'package:api_project/providers/my_provider.dart';
import 'package:api_project/ui/splachscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.dbHelper.intDatabase();
  runApp(
    ChangeNotifierProvider<MyProvider>(
        create: (context) => MyProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplachScreen(),
        )),
  );
}
