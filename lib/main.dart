import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String? _nome= null;
  int? onlyNumbers = null;
  String? _selectedOption = 'Selecione';
  List<String> _options = [
    'Selecione',
    'Recife',
    'São Paulo',
    'João Pessoa',
    'Jaboatão dos Guararapes'
  ];
  String _opcaoEscolhida = 'Selecione';
  List<String> _opcoes = [ '5', '10', '15'];
  bool _autoChecked = false;
  bool _eletroChecked = false;
  bool _densChecked = false;
  Color corDaMensagem = Colors.transparent;
  Color corDaMensagem2 = Colors.transparent;


  DateTime dataSelecionada = DateTime.now();


  Future<void> _escolherData(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2002),
      lastDate: DateTime(2300),
    );
    if (picked != null && picked != dataSelecionada) {
      setState(() {
        dataSelecionada = picked;
      });
    }
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _submitForm() {
    if (_opcaoEscolhida == "Selecione") {
      setState(() {
        corDaMensagem2 = Colors.blue;
      });
    } else {
      setState(() {
        corDaMensagem2 = Colors.transparent;
      });
    }


    if (!_autoChecked && !_eletroChecked && !_densChecked) {
      setState(() {
        corDaMensagem = Colors.green;
      });
    } else {
      setState(() {
        corDaMensagem = Colors.transparent;
      });
    }
    print("Nome:$_nome");
     print("CPF: $onlyNumbers");
    
    print("$dataSelecionada");
      print("Automação: $_autoChecked");
      print("Desenvolvimento: $_densChecked ");
      print("Eletrotecinca: $_eletroChecked");
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "FORMULÁRIO DE CADASTRO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (_nome) {
                          if (_nome == null || _nome.isEmpty) {
                            return 'Por favor, insira seu nome.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Nome Completo",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.abc),
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          validator: (onlyNumbers) {
                            if (onlyNumbers == null || onlyNumbers.isEmpty) {
                              return 'Por favor, insira seu CPF.';
                            }
                            if (onlyNumbers.runes.length != 11) {
                              return onlyNumbers;
                            } else if (onlyNumbers.length < 11) {
                              return 'Complete...';
                            }
                           },
                          decoration: InputDecoration(
                            labelText: "CPF",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${dataSelecionada.toLocal()}".split(' ')[0]),
                          ElevatedButton(
                            onPressed: () => _escolherData(context),
                            child: Text("Escolha uma data"),
                          ),
                        ],
                      ),
                      Text(
                        "Escolha a(s) área(s) de interesse:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CheckboxListTile(
                        title: Text('Automação'),
                        value: _autoChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _autoChecked = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Desenvolvimento de Sistemas'),
                        value: _densChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _densChecked = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Eletrotecnica'),
                        value: _eletroChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _eletroChecked = value!;
                          });
                        },
                      ),
                      Column(
                        children: _opcoes.map((opcao) {
                          return RadioListTile<String>(
                            title: Text(opcao),
                            value: opcao,
                            groupValue: _opcaoEscolhida,
                            onChanged: (value) {
                              setState(() {
                                _opcaoEscolhida = value!;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Endereço",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                             decoration: InputDecoration(
                          labelText: "Nº",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.map),
                        ),
                      ),),],),
                       DropdownButtonFormField<String>(
                        value: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                        items: _options.map((opcao) {
                          return DropdownMenuItem<String>(
                            value: opcao,
                            child: Text(opcao),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Cidades',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      SizedBox(
                        width: 650,
                        height: 100,
                        child: 
                      TextFormField( 
                        decoration: InputDecoration(
                          labelText: "Complemento",
                          
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.more),
                        ),
                      ),),],),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _submitForm();
                          }
                        }, 
                       label: Text("Cadastrar"),
                        icon: const Icon((Icons.save)),                                           
                         
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


