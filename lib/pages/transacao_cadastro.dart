import 'package:expensive_tracker/models/tipo_transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class TransacaoCadastro extends StatefulWidget {
  const TransacaoCadastro({super.key});

  @override
  State<TransacaoCadastro> createState() => _TransacaoCadastroState();
}

class _TransacaoCadastroState extends State<TransacaoCadastro> {
  TipoTransacao tipoTransacaoSelecionada = TipoTransacao.receita;
  final descricaoController = TextEditingController();
  final valorController = MoneyMaskedTextController();
  final dataController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Transação'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildDescricao(),
              const SizedBox(
                height: 30,
              ),
              _buildTipoTransacao(),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: double.infinity,
              ),
              _buildValor(),
              const SizedBox(
                height: 30,
              ),
              _buildData(),
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: descricaoController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Descrição obrigatória';
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Descrição'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.text_outline),
      ),
    );
  }

  TextFormField _buildValor() {
    return TextFormField(
      controller: valorController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Descrição obrigatória';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Valor'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
    );
  }

  TextFormField _buildData() {
    return TextFormField(
      controller: dataController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Descrição obrigatória';
        }
        return null;
      },
      onTap: () async {
        DateTime? dataSelecionada = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (dataSelecionada != null) {
          dataController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      },
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
        label: Text('Data'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
    );
  }

  DropdownMenu<TipoTransacao> _buildTipoTransacao(){
    return DropdownMenu<TipoTransacao>(
      initialSelection: tipoTransacaoSelecionada,
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: TipoTransacao.receita, label: 'Receita'),
        DropdownMenuEntry(value: TipoTransacao.despesa, label: 'Despesa'),
      ],
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
      onPressed: () {
        final valido = _key.currentState!.validate();
        if (valido) {
          print(descricaoController.text);
        }
      },
      child: const Text('Cadastrar Transação'),
    );
  }
}
