// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unnecessary_new

import 'package:flutter/material.dart';
import 'package:practica_03/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nomCtrl = new TextEditingController();
  final data = new Data(nombre: '', sexo: '');
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Practica 03'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomCtrl,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
                value: _valor,
                items: [
                  DropdownMenuItem(
                    child: Text('Mujer'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Hombre'),
                    value: 2,
                  )
                ],
                onChanged: (int? selected) {
                  setState(() {
                    _valor = selected!;
                  });
                }),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange[200], onPrimary: Colors.white),
                child: Text('Enviar'),
                onPressed: () {
                  setState(() {
                    data.nombre = nomCtrl.text;

                    if (_valor == 1) {
                      data.sexo = 'Mujer';
                    } else {
                      data.sexo = 'Hombre';
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DatosPage(data: data)));
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class Data {
  String nombre;
  String sexo;

  Data({required this.nombre, required this.sexo});
}
