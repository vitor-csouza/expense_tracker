import 'package:expensive_tracker/components/conta_item.dart';
import 'package:expensive_tracker/models/conta.dart';
import 'package:expensive_tracker/repository/contas_repository.dart';
import 'package:flutter/material.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  final futureContas = ContasRepository().listarContas();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conta>>(
        future: futureContas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Future incompleta
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Future completa com erro
            return const Center(
              child: Text("Erro ao listas as contas"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Future completa com sucesso
            return const Center(
              child: Text("Nenhuma conta cadastrada"),
            );
          } else {
            // Future completa com sucesso, com dados
            final contas = snapshot.data!;

            return ListView.separated(
              itemCount: contas.length,
              itemBuilder: (context, index) {
                final conta = contas[index];
                return ContaItem(conta: conta);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        });
  }
}
