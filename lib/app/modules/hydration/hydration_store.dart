import 'package:app_idosos/db/models/hydration.dart';

import 'package:app_idosos/db/stores/store_definition/hidratacao_db.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'hydration_store.g.dart';

class HydrationStore = _HydrationStoreBase with _$HydrationStore;

abstract class _HydrationStoreBase with Store {
  final quantidadeLiquidoController = TextEditingController();

  Hydration hidratacao = Hydration();

  @observable
  bool setValidator = false;
  @observable
  bool getValidator = false;
  @observable
  double meta = 0.0;
  @observable
  double consumido = 0.0;
  @observable
  double porcentagem = 0.0;
  @observable
  String data = " ";


  @action
  getValueHydration() async {
    getValidator = true;
    String date = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    List<Hydration> listDados = await HidratacaoDb().getAll();
    var dados = listDados.firstWhere((element) => element.data == date, orElse: () => Hydration(data: "", consumido: 0.0, meta: 0.0, sincronizado: false) );
    if(dados.data == ""){
      hidratacao.data = date;
      hidratacao.consumido = 0.0;
      hidratacao.meta = 2000;
      hidratacao.sincronizado = false;
      await HidratacaoDb().put(hidratacao);
      data = formatarData(date);
      if(hidratacao.consumido == 0){
        porcentagem = 0 ;
      }else{
        porcentagem = (dados.consumido! / dados.meta!) * 100;
      }
      consumido = hidratacao.consumido!;
      meta = hidratacao.meta!;
    }else{
      data = formatarData(dados.data!);
      if(dados.consumido == 0.0){
        porcentagem = 0 ;
      }else{
        porcentagem = (dados.consumido! / dados.meta!) * 100;
      }
      consumido = dados.consumido!;
      meta = dados.meta!;
    }

    getValidator = false;


  }
  @action
  setNewValueHydration(double quantidade) async {
    setValidator = true;
    String date = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    List<Hydration> listDados = await HidratacaoDb().getAll();
    var dados = listDados.firstWhere((element) => element.data == date, orElse: () => Hydration(data: "", consumido: 0.0, meta: 0.0, sincronizado: false) );
    if(dados.data == ""){
      hidratacao.data = date;
      hidratacao.consumido = quantidade;
      hidratacao.meta = 2000;
      hidratacao.sincronizado = false;
      await HidratacaoDb().put(hidratacao);
    }else{
      dados.consumido = quantidade + dados.consumido!;
      await HidratacaoDb().put(dados);
    }


    setValidator = false;

  }

  @action
  String formatarData(String dataString) {
    List<String> partes = dataString.split('/');
    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);

    const List<String> diasDaSemana = [
      'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'
    ];

    const List<String> meses = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho',
      'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];

    String diaDaSemana = diasDaSemana[DateTime(ano, mes, dia).weekday];
    String diaFormatado = dia.toString().padLeft(2, '0');
    String mesFormatado = meses[mes - 1];

    return '$diaDaSemana, $diaFormatado de $mesFormatado de $ano';
  }


}
