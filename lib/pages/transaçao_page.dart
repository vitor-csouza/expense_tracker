import 'package:expensive_tracker/models/banco.dart';
import 'package:expensive_tracker/models/tipo_transacao.dart';
import 'package:expensive_tracker/pages/transacoes_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            ListTile(
              title: const Text('Tipo de lançamento'),
              subtitle: Text(transacao.tipoTransacao == TipoTransacao.despesa
                  ? 'Despesa'
                  : 'Receita'),
            ),
            ListTile(
              title: const Text('Valor'),
              subtitle: Text(NumberFormat.simpleCurrency(locale: 'pt_BR')
                  .format(transacao.valor)),
            ),
            ListTile(
              title: const Text('Categoria'),
              subtitle: Text(transacao.categoria.descricao),
            ),
            ListTile(
              title: const Text('Data do Lançamento'),
              subtitle: Text(DateFormat('MM/dd/yyyy').format(transacao.data)),
            ),
            ListTile(
              title: const Text('Observação'),
              subtitle:
                  Text(transacao.detalhes.isEmpty ? '-' : transacao.detalhes),
            ),
          ],
        ));
  }
}
