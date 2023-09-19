import 'package:expensive_tracker/pages/home_page.dart';
import 'package:expensive_tracker/pages/login_page.dart';
import 'package:expensive_tracker/pages/registrar_pages.dart';
import 'package:expensive_tracker/pages/transa%C3%A7ao_detalhes_page.dart';
import 'package:expensive_tracker/pages/transacao_cadastro_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const LoginPage(),
        "/registrar": (context) => const RegistrarPage(),
        "/home": (context) => const HomePage(),
        "/transacao-detalhes": (context) => const TransacaoDetalhesPage(),
        "/transacao-cadastro": (context) => const TransacaoCadastroPage(),
      },
      initialRoute: "/",
    );
  }
}
