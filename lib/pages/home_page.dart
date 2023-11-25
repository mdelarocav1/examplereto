import 'package:examplereto/pages/device_page.dart';
import 'package:examplereto/pages/init_page.dart';
import 'package:examplereto/pages/space_page.dart';
import 'package:flutter/material.dart';

//Paquetes de iconos de Pub Dev
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';


class Espacio {
  String nombre;
  String urlImage;

  Espacio({required this.nombre, required this.urlImage});
}

// Crea una lista de espacios
List<Espacio> listaEspacios = [
  Espacio(nombre: 'Sala principal', urlImage: "assets/Sala.jpg"),
  Espacio(nombre: 'Comedor', urlImage: "assets/Comedor.jpg"),
  Espacio(
      nombre: 'Habitación principal', urlImage: "assets/CuartoPrincipal.jpg"),
  Espacio(
      nombre: 'Habitación secundaria', urlImage: "assets/CuartoSecundario.jpg"),
  Espacio(nombre: 'Cocina', urlImage: "assets/Cocina.jpg"),
];


class Equipo {
  String nombreEquipo;
  IconData icono;
  String fabricante;
  String modelo;
  String mac;

  Equipo({
    required this.nombreEquipo, required this.icono, required this.fabricante
    , required this.modelo, required this.mac});
}
// Crea una lista de los elementos de Equipos
List<Equipo> listaEquipos = [
  Equipo(nombreEquipo: 'TV Cuarto', icono: Icons.monitor, fabricante: "TV Samsung", modelo: "TP-KNT", mac: "90:00:4E:87"),
  Equipo(nombreEquipo: 'Refrigeradora', icono: Icons.kitchen, fabricante: "Refri Miray", modelo: "JL-NOU", mac: "80:01:4E:55"),
  Equipo(nombreEquipo: 'Puerta Sala', icono: Icons.door_front_door, fabricante: "Puertas San Borja", modelo: "SBN-098", mac: "70:03:4E:45"),
  Equipo(nombreEquipo: 'Cochera', icono: Icons.garage, fabricante: "Cochera Smart", modelo: "UBN983334", mac: "60:20:4A:36"),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back_ios_new),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InitPage()));
                },
              );
            },
          ),
          centerTitle: true,
          title: Text('Navicury'),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/fondo_homePage.jpg"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Mis espacios",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listaEspacios.length,
                      itemBuilder: (BuildContext context, int index) {
                        Espacio espacio =
                            listaEspacios[index]; // Obtener el espacio actual
                        return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SpacePage()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(espacio
                                            .urlImage), // Ruta de la imagen en assets
                                        fit: BoxFit
                                            .cover, // Ajusta la imagen al tamaño del container
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 200,
                                    alignment: Alignment.center,
                                    child: Text(
                                      espacio.nombre,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Equipos conectados",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 600,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: listaEquipos.map((elemento) {
                        return GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => DevicePage(equipoSeleccionado: elemento)));
                              },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  elemento.icono,
                                  size: 36.0,
                                  ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  elemento.nombreEquipo,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
