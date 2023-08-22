import 'package:expensive_tracker/models/categoria.dart';
import 'package:expensive_tracker/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_Item.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final futureCategorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: FutureBuilder<List<Categoria>>(
            future: futureCategorias,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Future incompleta
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Future completa com erro
                return const Center(
                  child: Text("Erro ao listas as categorias"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // Future completa com sucesso
                return const Center(
                  child: Text("Nenhuma categoria cadastrada"),
                );
              } else {
                // Future completa com sucesso, com dados
                final categorias = snapshot.data!;

                return ListView.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];
                    return CategoriaItem(categoria: categoria);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              }
            }));
  }
}
