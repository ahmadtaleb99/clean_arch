import 'package:clean_arch/app/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'app/MyApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModules();
  runApp( MyApp());
}
