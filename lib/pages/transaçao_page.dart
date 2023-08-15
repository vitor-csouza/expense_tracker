import 'package:expensive_tracker/models/banco.dart';
import 'package:expensive_tracker/models/tipo_transacao.dart';
import 'package:expensive_tracker/pages/transacoes_page.dart';
import 'package:flutter/material.dart';

class TransacaoPage extends StatefulWidget {
  const TransacaoPage({super.key});

  static const routeName = '/transacao';

  @override
  State<TransacaoPage> createState() => _TransacaoPageState();
}

class _TransacaoPageState extends State<TransacaoPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final transacao = arguments.transacao;
    final image = bancosMap[transacao.conta.bancoId]?.logo;

    return Scaffold(
        appBar: AppBar(
          title: Text(transacao.descricao),
          backgroundColor: transacao.tipoTransacao == TipoTransacao.despesa
              ? Colors.red
              : Colors.green,
        ),
        body: Column(
          children: [
            ListTile(
              leading: ClipOval(child: Image.asset('images/$image')),
              title: Text(transacao.conta.descricao),
              subtitle: Text(transacao.descricao),
            ),
          ],
        ));
  }
}
