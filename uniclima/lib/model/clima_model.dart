class ClimaModel {
  final double temperatura;
  final double tempMin;
  final double tempMax;
  final double sensacaoTermica;
  final String descricao;
  final String icone;
  final int pressao;
  final int umidade;
  final int visibilidade;
  final double velocidadeVento;
  final int direcaoVento;

  ClimaModel(
      {required this.temperatura,
      required this.tempMin,
      required this.tempMax,
      required this.sensacaoTermica,
      required this.descricao,
      required this.icone,
      required this.pressao,
      required this.umidade,
      required this.visibilidade,
      required this.velocidadeVento,
      required this.direcaoVento});

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
        temperatura: json["main"]["temp"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        sensacaoTermica: json["main"]["feels_like"],
        descricao: json["weather"][0]["description"],
        icone: json["weather"][0]["icon"],
        pressao: json["main"]["pressure"],
        umidade: json["main"]["humidity"],
        visibilidade: json["visibility"],
        velocidadeVento: json["wind"]["speed"],
        direcaoVento: json["wind"]["deg"]);
  }
}
