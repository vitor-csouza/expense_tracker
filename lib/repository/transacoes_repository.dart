import 'package:supabase_flutter/supabase_flutter.dart';


import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesReepository {
  Future<List<Transacao>> listarTransacoes(
      {TipoTransacao? tipoTransacao}) async {
    await Future.delayed(const Duration(seconds: 5));
    final supabase = Supabase.instance;
    final data = await supabase.client
        .from('transacoes')
        .select<List<Map<String, dynamic>>>();

    final transacoes = data
        .map((map) => Transacao(
            id: map['id'],
            descricao: map['descricao'],
            tipoTransacao: TipoTransacao.values[map['tipo_transacao']],
            valor: map['valor'],
            data: DateTime(map['data_transacao']),
            categoria: map['categoria_id'],
            conta: map['conta_id']))
        .toList();
    return transacoes;
  }
}
