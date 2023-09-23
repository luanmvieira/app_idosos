import 'package:app_idosos/db/stores/store_definition/medicacao_store.dart';
import 'package:flutter/material.dart';

class MedicamentoItem extends StatelessWidget {
  final int id;
  final String nome;
  final String dose;
  final List<String> horarios;

  MedicamentoItem({
    required this.id,
    required this.nome,
    required this.dose,
    required this.horarios,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(nome),
      onDismissed: (direction) {
        // Ação quando o item é deslizado
        if (direction == DismissDirection.endToStart) {

        } else if (direction == DismissDirection.startToEnd) {
          MedicacaoStore().remove(id);

        }
      },
      background: Container(
        color: Colors.red, // Cor de fundo para excluir
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue, // Cor de fundo para editar
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(Icons.edit, color: Colors.white),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          title: Text(
            nome,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dose: $dose',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Horários:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: horarios.map((horario) {
                  return Text(
                    horario,
                    style: TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
