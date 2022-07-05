import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:paklan/aplicaciones/creditCard/widgets/pagado.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var cardMask = MaskTextInputFormatter(
      mask: '####-####-####-####', filter: {"#": RegExp(r'[0-9]')});

  var dateMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  var codeMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final shape = StadiumBorder();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          Image.asset("Assets/images/tarjeta.png"),
          //Image.network("https://www.kardmatch.com.mx/uploads/tarjeta-de-credito-premier-world-elite-hsbc-grande.png"),
          const SizedBox(
            height: 30,
          ),
          _inputNombre(),
          SizedBox(
            height: 10,
          ),
          _inputCard(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.48,
                child: _inputDate(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.48,
                child: _inputCode(),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 30,
              decoration: ShapeDecoration(
                shape: shape,
                gradient: LinearGradient(
                  //begin:Alignment.topCenter,
                  //end:Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent,
                    Colors.indigo,
                  ],
                ),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        //Navigator nos pide el contexto
                        context,
                        //Y nos pide el widget a utilizar
                        MaterialPageRoute(builder: (context) => Pagado()));
                  },
                  style: ElevatedButton.styleFrom(
                    //desactivate color and shadow
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("Registrar"))),
        ],
      ),
    );
  }

  Container _inputNombre() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration:
              InputDecoration(hintText: "Su Nombre", border: InputBorder.none),
        ));
  }

  Container _inputCard() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [cardMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "0000-0000-0000-0000", border: InputBorder.none),
        ));
  }

  Container _inputDate() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [dateMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration:
              InputDecoration(hintText: "01/24", border: InputBorder.none),
        ));
  }

  Container _inputCode() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [codeMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration:
              InputDecoration(hintText: "000", border: InputBorder.none),
        ));
  }
}
