import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController controllerAltura = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  //late FocusNode focoAltura;
  double resultado = 0;
  String legendaResultado = "";
/*
  @override
  void initState() {
    super.initState();
    focoAltura = FocusNode();
  }

  @override
  void dispose() {
    focoAltura.dispose();
    super.dispose();
  }
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Cálculo IMC',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controllerAltura,
                  autofocus: true,
                  //focusNode: focoAltura,
                  decoration: const InputDecoration(
                    /*enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),*/
                    border: OutlineInputBorder(),
                    labelText: 'Altura:',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso:',
                  ),
                  controller: controllerPeso,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controllerAltura.clear();
                        controllerPeso.clear();
                      },
                      child: const Text('Limpar')),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          //focoAltura.requestFocus();
                          setState(() {
                            resultado = double.parse(controllerPeso.text) /
                                (double.parse(controllerAltura.text) *
                                    double.parse(controllerAltura.text));
                            legendaResultado = resultado.toStringAsFixed(2);
                            if (resultado < 18.5) {
                              legendaResultado += "\n Magreza";
                            } else if (resultado > 18.5 && resultado < 25) {
                              legendaResultado += "\n Normal";
                            } else if (resultado > 25 && resultado < 30) {
                              legendaResultado += "\n Sobrepeso";
                            } else if (resultado > 30 && resultado < 35) {
                              legendaResultado += "\n Obesidade grau I";
                            } else if (resultado > 35 && resultado < 40) {
                              legendaResultado += "\n Obesidade grau II";
                            } else if (resultado > 40) {
                              legendaResultado += "\n Obesidade grau III";
                            }
                          });

                          /*
      Menor que 18,5	Magreza
      18,5 a 24,9	Normal
      25 a 29,9	Sobrepeso
      30 a 34,9	Obesidade grau I
      35 a 39,9	Obesidade grau II
      Maior que 40	Obesidade grau III
      
       */
                        },
                        child: const Text('Calcular')),
                  ),
                ],
              ),
              Text(
                'Resultado: $legendaResultado',
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
