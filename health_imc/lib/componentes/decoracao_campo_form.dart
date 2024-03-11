import 'package:flutter/material.dart';
import 'package:health_imc/_comum/mycollors.dart';

class BlockButtons extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onPressed;
  final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: MyCollors.corBotao,
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      padding: const EdgeInsets.all(18));

  BlockButtons(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
          style: buttonStyle,
          icon: Icon(icon),
          label: Text(label),
          onPressed: onPressed),
    );
  }
}



                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20),
                  //   child: TextFormField(
                  //     controller: _alturaController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: decoracaoCampoForm("Altura (cm)"),
                  //   ),
                  // ),



//                   Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(),
//                             hintText: "Peso (Kg)",
//                             hintStyle: TextStyle(fontSize: 18)),
//                       )),