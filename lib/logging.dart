import 'dart:ui';
import 'package:flutter_task/extensions.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className){
  return Logger(printer: ColorPrinter(className));
}

class ColorPrinter extends LogPrinter{
  final String className;

  ColorPrinter(this.className);

  @override
  List<String> log(LogEvent event) {

    final message = event.message.toString().split(' ');
    final red = int.parse(message[0]);
    final green = int.parse(message[1]);
    final blue = int.parse(message[2]);
    final color = Color.fromRGBO(red, green, blue, 1);

    final level = event.level;
    final logColor = PrettyPrinter.levelColors[level];


    return [logColor!('$level => class: $className      RGB: ($red, $green, $blue)     HEX: ${color.toHex()}')];
  }

}