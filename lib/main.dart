import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:genz_2024/Getx/Binding.dart';
import 'package:genz_2024/Loginuser.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ytphxgjkdgxnxruyvabg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl0cGh4Z2prZGd4bnhydXl2YWJnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5MDA5NzAsImV4cCI6MjA0ODQ3Njk3MH0.w0kLk6umPbLzIeTCBXZkCkkUXCsaCxt7aQ2GCALqxlw',
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAn087P6e8cw3ZzxUjmTIALbJB16FEAtB8",
      appId: "1:308109597475:android:c7912b51c17cb1eac5ca96",
      messagingSenderId: "308109597475",
      projectId: "genz2024-c0bcd",
    ),
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: Scaffold(
        body: CreateUser(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
