import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Primeiro número",
                ),
              ),
              
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Segundo número",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => calcular(context, '+'),
                    child: Text("Somar"),
                  ),
                  ElevatedButton(
                    onPressed: () => calcular(context, '-'),
                    child: Text("Subtrair"),
                  ),
                  ElevatedButton(
                    onPressed: () => calcular(context, '*'),
                    child: Text("Multiplicar"),
                  ),
                  ElevatedButton(
                    onPressed: () => calcular(context, '/'),
                    child: Text("Dividir"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calcular(BuildContext context, String operacao) {
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);
    double resultado = 0;

    switch (operacao) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        resultado = num1 / num2;
        break;
    }

    final message = resultado == double.infinity ? "Não é possível realizar esse cálculo" : "$num1 $operacao $num2 = $resultado";
    
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soma",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home:  HomePage(),
    );
  }

}
void main() => runApp(const Aplicacao());
