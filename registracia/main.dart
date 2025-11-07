import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'LoginScreen.dart';

void main() async {

    await Supabase.initialize(//это секрет
    url: 'https://frvexfoezbscdbcvuxas.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZydmV4Zm9lemJzY2RiY3Z1eGFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk3NDY4ODgsImV4cCI6MjA3NTMyMjg4OH0.XDr9MFxBMX0P42a4MwjstxtZeh_Caqdyrfpfr7d9ec8',
  );
  // Регистрация

final supabase = Supabase.instance.client;
/*
final response = await supabase.auth.signUp(
  email: 'ula@examp.com',
  password: 'password',
);*/

// Авторизация
/*final response2 = await supabase.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password',
);*/

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriveClub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const LoginScreen(), // Стартовый экран - авторизация
    );
  }
}
