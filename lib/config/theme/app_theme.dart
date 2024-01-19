import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 196, 161, 231);
//=Color(0xff + codigo del color en hexadecimal , sin espacios o corchetes)

// arreglo de colores para el thema
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  // coloca como color por defecto al color base
  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor<=(_colorThemes.length -1), 
  'Colors must be between 0 and ${_colorThemes.length -1}');
  // assert delimita entre que valores tendra selectedcolor

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: _colorThemes[selectedColor],
        // brightness: Brightness.dark
        // es para el modo oscuro
        );
  }
}
