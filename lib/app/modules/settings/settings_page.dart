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

  bool switchAlarm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCardSettingsSwitch(
                title: "Alarmes de Medicação",
                description: "Ativa os alarmes de medicação",
                switchValue: switchAlarm,
                onSwitchChanged: (value) {
                setState(() {
                  switchAlarm = value;
                });
              },
            ),
            CustomCardSettingsSwitch(
              title: "Alarmes de Micção",
              description: "Ativa os alarmes de micção",
              switchValue: switchAlarm,
              onSwitchChanged: (value) {
                setState(() {
                  switchAlarm = value;
                });
              },
            ),
            CustomCardSettingsSwitch(
              title: "Alarmes de Ingestão de Líquidos",
              description: "Ativa os alarmes de injestão de Liquidos",
              switchValue: switchAlarm,
              onSwitchChanged: (value) {
                setState(() {
                  switchAlarm = value;
                });
              },
            ),
            CustomCardSettingsDropDown(
              title: "Intervalo dos alarmes de Ingestão de Líquidos",
              description: "Modifica o intervalo dos alarmes de injestão de Liquidos",
            ),
            CustomCardSettingsDropDown(
              title: "Intervalo dos alarmes de micção",
              description: "Modifica o intervalo dos alarmes de micção",
            ),
            divider(),
            CustomCardSettingsTelefoneEmergencia(
              title: "Telefone de Emergência",
              description: "Defina o telefone de Emergência",
            ),
            divider(),
            SizedBox(
              height: 95,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0)),
                    color: Colors.white),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.orange),
                        ),
                        child: Text(
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