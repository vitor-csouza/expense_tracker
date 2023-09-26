import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    await Future.delayed(const Duration(seconds: 5));
    final supabase = Supabase.instance;
    final data = await supabase.client
        .from('contas')
        .select<List<Map<String, dynamic>>>();

    final contas = data
        .map((map) => Conta(
              id: map['id'],
              bancoId: map['banco'],
              descricao: map['descricao'],
              tipoConta: TipoConta.values[map['tipo_conta']],
            ))
        .toList();
    return contas;
  }
}
