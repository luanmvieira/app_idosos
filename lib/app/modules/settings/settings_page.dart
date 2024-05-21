import 'package:app_idosos/app/modules/settings/widgets/card_add_numero_emergencia.dart';
import 'package:app_idosos/app/modules/settings/widgets/custom_card_settings_dropDown.dart';
import 'package:app_idosos/app/modules/settings/widgets/custom_card_settings_switch.dart';
import 'package:app_idosos/app/modules/settings/widgets/custom_card_settings_telefone_emergencia.dart';
import 'package:app_idosos/app/widgets/app_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/settings/settings_store.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key? key, this.title = 'Configurações'}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}
class SettingsPageState extends State<SettingsPage> {
  final SettingsStore store = Modular.get();

  bool switchAlarmMedication = false;
  bool switchAlarmMiccao = false;
  bool switchAlarmLiquid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,size: 30, ),
        title: Text(widget.title,style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCardSettingsSwitch(
                title: "Alarmes de Medicação",
                description: "Ativa os alarmes de medicação",
                switchValue: switchAlarmMedication,
                onSwitchChanged: (value) {
                setState(() {
                  switchAlarmMedication = value;
                });
              },
            ),
            CustomCardSettingsSwitch(
              title: "Alarmes de Micção",
              description: "Ativa os alarmes de micção",
              switchValue: switchAlarmMiccao,
              onSwitchChanged: (value) {
                setState(() {
                  switchAlarmMiccao = value;
                });
              },
            ),
            CustomCardSettingsSwitch(
              title: "Alarmes de Ingestão de Líquidos",
              description: "Ativa os alarmes de injestão de Liquidos",
              switchValue: switchAlarmLiquid,
              onSwitchChanged: (value) {
                setState(() {
                  switchAlarmLiquid = value;
                });
              },
            ),
            divider(),
            CustomCardSettingsDropDown(
              title: "Intervalo dos alarmes de Ingestão de Líquidos",
              description: "Modifica o intervalo dos alarmes de injestão de Liquidos",
            ),
            divider(),
            CustomCardSettingsDropDown(
              title: "Intervalo dos alarmes de micção",
              description: "Modifica o intervalo dos alarmes de micção",
            ),
            divider(),
            const SizedBox(
              height: 210,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0)),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.orange),
                        ),
                        child: const Text(
                          "SALVAR ALTERAÇÕES",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Modular.to.navigate("/home/");
                        },
                      ),
                    )),
              ),
            ),
          ],
        ),
      )
    );
  }
}