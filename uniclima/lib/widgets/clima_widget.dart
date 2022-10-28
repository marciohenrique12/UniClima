import 'package:flutter/material.dart';
import 'package:uniclima/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({Key? key, required this.climaData}) : super(key: key);

  final ClimaModel climaData;

  String primeiraMaiuscula(String s) =>
      s[0].toUpperCase() + s.substring(1); // vai cair na prova

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(
        "http://openweathermap.org/img/wn/${climaData.icone}@2x.png",
        fit: BoxFit.fill,
        width: 120,
      ),
      Text(
        "${climaData.temperatura.toStringAsFixed(0)} ºC",
        style: const TextStyle(fontSize: 50),
      ),
      Text(
        primeiraMaiuscula(climaData.descricao),
        style: const TextStyle(fontSize: 50),
      ),
      const SizedBox(height: 20),
      Text(
        "Mínima do momento: ${climaData.tempMin} ºC",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Mínima do momento: ${climaData.tempMax} ºC",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Sensação térmica: ${climaData.sensacaoTermica} ºC",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Pressão: ${climaData.pressao} hPa",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Umidade: ${climaData.umidade}%",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Visibilidade: ${climaData.visibilidade}m",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Velocidae do vento: ${climaData.velocidadeVento}m/s",
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        "Direção do vento: ${climaData.direcaoVento}º",
        style: const TextStyle(fontSize: 18),
      ),
    ]);
  }
}
