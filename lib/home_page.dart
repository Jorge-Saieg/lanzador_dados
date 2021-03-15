import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lanzador de dados 🎲'),
          backgroundColor: Colors.red[700],
        ),
        body: Dados(),
      ),
    );
  }
}

class Dados extends StatefulWidget {
  Dados({Key key}) : super(key: key);

  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  int numero = 3;
  int numero2 = 1;
  bool dosDados = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/dado$numero.png',
                  width: 150,
                ),
                if (dosDados = true)
                  Image.asset(
                    'assets/images/dado$numero2.png',
                    height: 150,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => cantidadDados(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: bordeUnDado(),
                        width: 5,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/1dado.png',
                      height: 70,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => cantidadDados(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: bordeDosDados(),
                        width: 5,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/2dado.png',
                      height: 70,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          FloatingActionButton.extended(
            onPressed: () => lanzarDados(),
            label: Text('Lanzar dados!!'),
            backgroundColor: Colors.red[800],
          ),
        ],
      ),
    );
  }

  bordeUnDado() {
    if (dosDados == false) {
      return Colors.red[900];
    } else {
      return Colors.red[100];
    }
  }

  bordeDosDados() {
    if (dosDados == true) {
      return Colors.red[900];
    } else {
      return Colors.red[100];
    }
  }

  cantidadDados() {
    if (dosDados == true) {
      dosDados = false;
    } else {
      dosDados = true;
    }
  }

  lanzarDados() {
    numero = Random().nextInt(6) + 1;
    numero2 = Random().nextInt(6) + 1;
    setState(() {});
  }
}
