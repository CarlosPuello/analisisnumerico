import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

class funciones{
  static String funcionf = "";
  static String funciong = "";
  static String derivada = "";

  static double f(double point){
    Parser p = Parser();
    //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
    //Expression exp = p.parse('(x^3)+((4)*(x^2))-10');
    //Expression exp = p.parse('e^(-(x^2)+7)-x*ln(x^4+5)-x^2+20');
    //Expression exp = p.parse('x*ln(x)-x');
    Expression exp = p.parse(funcionf);
    Variable x = Variable('x');
    ContextModel cm = ContextModel()
      ..bindVariable(x, Number(point));
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    print('Expression: $exp');
    print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
    return eval;
  }

  static double dif(double point){
    Parser p = Parser();
    //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
    //Expression exp = p.parse('(3*x^2)+(8*x)');
    //Expression exp = p.parse('e^(-(x^2)+7)-x*ln(x^4+5)-x^2+20');
    //Expression exp = p.parse('ln(x)');
    Expression exp = p.parse(derivada);
    Variable x = Variable('x');
    ContextModel cm = ContextModel()
      ..bindVariable(x, Number(point));
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    print('Expression: $exp');
    print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
    return eval;
  }

  static double g(double point){
    Parser p = Parser();
    //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
    //Expression exp = p.parse('(e^(-(x^2)+7)-x*ln(x^4+5)+20)/x');
    //Expression exp = p.parse('x*ln(x)');
    Expression exp = p.parse(funciong);
    Variable x = Variable('x');
    ContextModel cm = ContextModel()
      ..bindVariable(x, Number(point));
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    print('Expression: $exp');
    print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
    return eval;
  }
}

