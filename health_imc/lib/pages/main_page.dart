import 'package:flutter/material.dart';
import 'package:health_imc/_comum/mycollors.dart';
import 'package:health_imc/componentes/decoracao_campo_form.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _resultado = "";

  void _calcularIMC() {
    double peso = double.parse(_pesoController.text);
    double altura =
        double.parse(_alturaController.text) / 100; // Convert cm to meters

    if (peso <= 0 || altura <= 0) {
      setState(() {
        _resultado =
            "Valores inválidos. Digite peso e altura maiores que zero.";
      });

      return;
    }

    double imc = peso / (altura * altura);
    //usado para usar 2 números de casa decimal
    String imcFormatado = imc.toStringAsFixed(0);

    setState(() {
      if (imc < 18.5) {
        _resultado = 'Seu IMC é: $imcFormatado. \nAbaixo do peso';
      } else if (imc >= 18.6 && imc <= 24.9) {
        _resultado = 'Seu IMC é: $imcFormatado. \nPeso ideal';
      } else if (imc >= 25 && imc <= 29.9) {
        _resultado = 'Seu IMC é: $imcFormatado. \nLevemente acima do peso';
      } else if (imc >= 30 && imc <= 34.9) {
        _resultado = 'Seu IMC é: $imcFormatado. \nObesidade grau 1';
      } else if (imc >= 35 && imc <= 39.9) {
        _resultado = 'Seu IMC é: $imcFormatado. \nObesidade grau 2 (severa)';
      } else {
        _resultado = 'Seu IMC é: $imcFormatado. \nObesidade grau 3 (mórbida)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyCollors.principal,
        title: const Center(
          child: Text(
            "Cálculo IMC",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyCollors.bgAltoGradiente,
                    MyCollors.bgBaixoGradiente
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Insira os dados abaixo",
                        style:
                            TextStyle(color: MyCollors.principal, fontSize: 22),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Peso
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _pesoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Peso (Kg)"),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),

                    // Altura
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: _alturaController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Altura (cm)"),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),

                    // Calcular IMC button
                    BlockButtons(
                      icon: Icons.check,
                      label: "CALCULAR",
                      onPressed: _calcularIMC,
                    ),

                    const SizedBox(height: 20),

                    // Resultado IMC
                    Text(
                      _resultado,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // decoracaoCampoForm(String s) {
  //   const InputDecoration(border: OutlineInputBorder(), hintText: "Peso Hint");
  // }
}
