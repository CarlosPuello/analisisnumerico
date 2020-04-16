import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

Widget functionLatex(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Divider(
        height: 5,
      ),
      Center(
        child: Container(
          child: Text(
            "Función: ",
            style: TextStyle(
              fontSize: 25
            ),
          )
        ),

      ),
      Divider(
        height: 5,
      ),
      Container(
        height: 80,
        child:dos()
      )
    ],
  );

}
Widget uno(){
  return TeXView(
    teXHTML: r"""$$y = {e^{x+5} - ln(x^2+6)+ sen(x)^2}$$<br> """,
    renderingEngine: RenderingEngine.Katex,  // Katex for fast render and MathJax for quality render.
    onRenderFinished: (height) {
      print("Widget Height is : $height");
    },
    onPageFinished: (string) {
      print("Page Loading finished");
    },
  );
}

Widget dos(){
  return TeXView(
    teXHTML: r"""$$y = {e^{-x^2+7} - x * ln(x^4+5)- x^2 + 20}$$<br> """,
    renderingEngine: RenderingEngine.Katex,  // Katex for fast render and MathJax for quality render.
    onRenderFinished: (height) {
      print("Widget Height is : $height");
    },
    onPageFinished: (string) {
      print("Page Loading finished");
    },
  );
}

double f(double point){
  Parser p = Parser();
  //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
  Expression exp = p.parse('(x^3)+((4)*(x^2))-10');
  //Expression exp = p.parse('e^(-(x^2)+7)-x*ln(x^4+5)-x^2+20');
  Variable x = Variable('x');
  ContextModel cm = ContextModel()
    ..bindVariable(x, Number(point));
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  print('Expression: $exp');
  print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
  return eval;
}

double dif(double point){
  Parser p = Parser();
  //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
  Expression exp = p.parse('(3*x^2)+(8*x)');
  //Expression exp = p.parse('e^(-(x^2)+7)-x*ln(x^4+5)-x^2+20');
  Variable x = Variable('x');
  ContextModel cm = ContextModel()
    ..bindVariable(x, Number(point));
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  print('Expression: $exp');
  print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
  return eval;
}

double g(double point){
  Parser p = Parser();
  //Expression exp = p.parse('e^(x+5)-ln(x^2+6)+sin(x)^2');
  Expression exp = p.parse('(e^(-(x^2)+7)-x*ln(x^4+5)+20)/x');

  Variable x = Variable('x');
  ContextModel cm = ContextModel()
    ..bindVariable(x, Number(point));
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  print('Expression: $exp');
  print('Evaluated expression: $eval\n  (with context: $cm)'); // = 1*/
  return eval;
}