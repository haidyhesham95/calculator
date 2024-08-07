import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'container_widget.dart';



class Operations extends StatefulWidget {
  @override
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];
  String input = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: containerWidget(text: input, textAlign: TextAlign.left)),
        Expanded(child: containerWidget(text: output, textAlign: TextAlign.right)),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: GridView.builder(
              itemCount: symbols.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if (symbols[index] == 'C') {
                      setState(() {
                        input = '';
                        output = '';
                      });
                    } else if (symbols[index] == 'Del') {
                      setState(() {
                        input = input.substring(0, input.length - 1);
                      });
                    } else if (symbols[index] == 'Ans') {
                      setState(() {
                        input = output;
                        output = '';
                      });
                    } else if (symbols[index] == '%' ||
                        symbols[index] == '/' ||
                        symbols[index] == '*' ||
                        symbols[index] == '+' ||
                        symbols[index] == '-') {
                      if (input.endsWith("%") ||
                          input.endsWith("*") ||
                          input.endsWith("/") ||
                          input.endsWith("+") ||
                          input.endsWith("-")) {
                      } else {
                        setState(() {
                          input += symbols[index];
                        });
                      }
                    } else if (symbols[index] == '=') {
                      Expression exp = Parser().parse(input);
                      double result =
                      exp.evaluate(EvaluationType.REAL, ContextModel());
                      setState(() {
                        output = result.toString();
                      });

                    } else {
                      setState(() {
                        input += symbols[index];
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        symbols[index],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: colorText(symbols[index]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }



  Color colorText(String x) {
    if (x == 'C' ||
        x == '%' ||
        x == 'Del' ||
        x == '/' ||
        x == '+' ||
        x == '*' ||
        x == '-' ||
        x == '=') {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }


}
