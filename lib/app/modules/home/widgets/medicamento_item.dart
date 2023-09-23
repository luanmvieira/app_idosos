import 'package:flutter/material.dart';

class MedicamentoItem extends StatelessWidget {
  final String nome;
  final String dose;
  final List<String> horarios;

  MedicamentoItem({
    required this.nome,
    required this.dose,
    required this.horarios,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
