import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:uniclima/model/clima_model.dart';
import 'package:uniclima/widgets/clima_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ClimaModel climaModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    carregaClima();
  }

  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasília",
    "Campo Grande",
    "Cuiaba",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceió",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];

  String _cidadeSelecionada = "São Paulo";

  carregaClima() async {
    setState(() {
      _isLoading = true;
    });
    //variáveis auxiliares para montagem da URL de requisição
    const String _apiURL = "api.openweathermap.org";
    const String _path = "/data/2.5/weather";
    const String _appid = "f1f8502a68ea8fc0008242591ab0f7ca";
    const String _units = "metric";
    const String _lang = "pt_br";

    //montagem dos parâmetros da URL...:
    final _parms = {
      "q": _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };

    //requisição à API...
    final climaResponse = await http.get(Uri.https(_apiURL, _path, _parms));

    //apenas para depuração...
    print("URL Montada: " + climaResponse.request!.url.toString());

    if (climaResponse.statusCode == 200) {
      setState(() {
        climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              items: _cidades,
              showSelectedItems: true,
              showSearchBox: true,
              maxHeight: height - 50,
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });
              },
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              strokeWidth: 4,
                              valueColor: AlwaysStoppedAnimation(Colors.blue),
                            )
                          : climaModel != null
                              ? ClimaWidget(climaData: climaModel)
                              : Text(
                                  "Sem dados para exibir!",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: _isLoading
                            ? Text(
                                "Carregando...",
                                style: Theme.of(context).textTheme.headline4,
                              )
                            : IconButton(
                                onPressed: carregaClima,
                                icon: const Icon(Icons.refresh),
                                iconSize: 50,
                                color: Colors.blue,
                                tooltip: "Recarregar clima",
                              ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
