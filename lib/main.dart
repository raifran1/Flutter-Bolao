import 'package:flutter/material.dart';
import 'package:bolao_brasileiro/database_helper.dart';

void main(){
  runApp(MaterialApp(
    title: "App Bolão",
    home: Home()));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{


    List<String> placar=["0","1","2","3","4","5",];
    List<String> clubes = ["Clubes","Flamengo","Palmeiras","Corinthians","Vasco","São Paulo","Santos","Cruzeiro","Botafogo","Fluminense","Atletico","Chape","Athletico","Grêmio","Inter","Csa","Avaí","Fortaleza","Ceará","goiás","Bahia",];

    //List<String> placar2=["1","2","3",];

    String _placar = "0";
    String _placar2 = "0";
    String _clube1 = "Clubes";
    String _clube2 = "Clubes";

    

  TextEditingController nome_clienteController = TextEditingController();
  TextEditingController valor_apostaController = TextEditingController();

  GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  
  String _suasApostas = "";
  String _cliente = "";
  String _placarTot = "";
  String _valor = "";

  String _cliente2 = "";
  String _placarTot2 = "";
  String _valor2 = "";

  String _cliente3 = "";
  String _placarTot3 = "";
  String _valor3 = "";

  String _cliente4 = "";
  String _placarTot4 = "";
  String _valor4 = "";

  String _cliente5 = "";
  String _placarTot5 = "";
  String _valor5 = "";
  //String _valor= "";


  void placarHome (String value){
  setState((){
    _placar = value;
  });

}
 void placarAway (String value){
  setState((){
    _placar2 = value;
  });

}

void clubHome (String value){
  setState((){
    _clube1 = value;
  });

}
void clubAway (String value){
  setState((){
    _clube2 = value;
  });

}


void validarAposta(){
  setState((){
    _cliente = ("Nome do Cliente:\n ${nome_clienteController.text}");
    _placarTot = ("Seu Palpite:\n ${_clube1}  ${_placar}  x  ${_placar2} ${_clube2}");
    _valor = ("Valor:\n ${valor_apostaController.text} R\$");
    //saveData;

  });
}


  final dbHelper = DatabaseHelper.instance; 

  void _inserir() async {
    // linha para incluir
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome : '${nome_clienteController.text}',
      DatabaseHelper.columnTime1  : '${_clube1}',
      DatabaseHelper.columnTime2 : '${_clube2}',
      DatabaseHelper.columnPT1: '${_placar}',
      DatabaseHelper.columnPT2: '${_placar2}',
      DatabaseHelper.columnVlrAposta: '${valor_apostaController.text}'
    };
    final id = await dbHelper.insert(row);
    
    print('linha inserida id: $id');
    _consultar();
    validarAposta();
    _deletarJogo();
  } 

void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));

    setState((){
      if (todasLinhas.length == 0){
        _cliente = ('Você ainda não fez nenhuma aposta no nosso app!');
      }
      if (todasLinhas.length == 1){
        _suasApostas = ("Suas Apostas Abaixo: \n\n");
        _cliente = ("${todasLinhas.first.values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot = ("Seu Palpite:\n ${todasLinhas.first.values.elementAt(2)}  ${todasLinhas.first.values.elementAt(4)}  x  ${todasLinhas.first.values.elementAt(5)} ${todasLinhas.first.values.elementAt(3)}\n-------------------------------------------------------------");
        _valor = ("Valor:\n R\$ ${todasLinhas.first.values.elementAt(6)}\n\n");

      }
      if (todasLinhas.length == 2){
        _suasApostas = ("Suas Apostas Abaixo: \n\n");
        _cliente = ("${todasLinhas.sublist(0).elementAt(0).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(0).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(0).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(0).values.elementAt(6)}\n\n");

        _cliente2 = ("${todasLinhas.last.values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot2 = ("Seu Palpite:\n ${todasLinhas.last.values.elementAt(2)}  ${todasLinhas.last.values.elementAt(4)}  x  ${todasLinhas.last.values.elementAt(5)} ${todasLinhas.last.values.elementAt(3)}\n-------------------------------------------------------------");
        _valor2 = ("Valor:\n R\$ ${todasLinhas.last.values.elementAt(6)} R\$");

      }
      if (todasLinhas.length == 3){
        _suasApostas = ("Suas Apostas Abaixo: \n\n");
        _cliente = ("${todasLinhas.sublist(0).elementAt(0).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(0).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(0).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(0).values.elementAt(6)}\n\n");

        _cliente2 = ("${todasLinhas.sublist(0).elementAt(1).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot2 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(1).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(1).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor2 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(1).values.elementAt(6)}\n\n");

        _cliente3 = ("${todasLinhas.last.values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot3 = ("Seu Palpite:\n ${todasLinhas.last.values.elementAt(2)}  ${todasLinhas.last.values.elementAt(4)}  x  ${todasLinhas.last.values.elementAt(5)} ${todasLinhas.last.values.elementAt(3)}\n-------------------------------------------------------------");
        _valor3 = ("Valor:\n R\$ ${todasLinhas.last.values.elementAt(6)}\n\n");

      }
      if (todasLinhas.length == 4){
        _suasApostas = ("Suas Apostas Abaixo: \n\n");
        _cliente = ("${todasLinhas.sublist(0).elementAt(0).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(0).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(0).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(0).values.elementAt(6)}\n\n");

        _cliente2 = ("${todasLinhas.sublist(0).elementAt(1).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot2 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(1).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(1).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor2 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(1).values.elementAt(6)}\n\n");

        _cliente3 = ("${todasLinhas.sublist(0).elementAt(2).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot3 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(2).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(2).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(2).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(2).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor3 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(2).values.elementAt(6)}\n\n");

        _cliente4 = ("${todasLinhas.sublist(0).elementAt(3).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot4 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(3).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(3).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(3).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(3).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor4 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(3).values.elementAt(6)}");

      }
      if (todasLinhas.length > 4){

        _suasApostas = ("Você atingiu o limite de cadastro de apostas!! \n\nSuas Apostas Abaixo: \n\n");
        _cliente = ("${todasLinhas.sublist(0).elementAt(0).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(0).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(0).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(0).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(0).values.elementAt(6)}\n\n");

        _cliente2 = ("${todasLinhas.sublist(0).elementAt(1).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot2 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(1).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(1).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(1).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor2 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(1).values.elementAt(6)}\n\n");

        _cliente3 = ("${todasLinhas.sublist(0).elementAt(2).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot3 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(2).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(2).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(2).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(2).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor3 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(2).values.elementAt(6)}\n\n");

        _cliente4 = ("${todasLinhas.sublist(0).elementAt(3).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot4 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(3).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(3).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(3).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(3).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor4 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(3).values.elementAt(6)}\n\n");

        _cliente5 = ("${todasLinhas.sublist(0).elementAt(4).values.elementAt(1)}\n-------------------------------------------------------------");
        _placarTot5 = ("Seu Palpite:\n ${todasLinhas.sublist(0).elementAt(4).values.elementAt(2)}  ${todasLinhas.sublist(0).elementAt(4).values.elementAt(4)}  x  ${todasLinhas.sublist(0).elementAt(4).values.elementAt(5)} ${todasLinhas.sublist(0).elementAt(4).values.elementAt(3)}\n-------------------------------------------------------------");
        _valor5 = ("Valor:\n R\$ ${todasLinhas.sublist(0).elementAt(4).values.elementAt(6)}");
      }
    });

  }

void _deletarJogo(){
  setState((){
    nome_clienteController.text = "";
    valor_apostaController.text = "";
    _clube1 = "Clubes";
    _clube2 = "Clubes";
    _placar = "0";
    _placar2 = "0";

    _placarTot = "";
    _cliente = "";
    _valor=  "";

    _placarTot2 = "";
    _cliente2 = "";
    _valor2 =  "";

    _placarTot3 = "";
    _cliente3 = "";
    _valor3=  "";

    _placarTot4 = "";
    _cliente4 = "";
    _valor4=  "";

    _placarTot5 = "";
    _cliente5 = "";
    _valor5=  "";

    _suasApostas = "";
  });
}



  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bolão da Sorte", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        //style: TextStyle(color: Colors.black),

        backgroundColor: Colors.lightGreen[200],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
        onPressed: _deletarJogo,
        )
        ], 
      ),

      body:Stack(
        children: <Widget>[
          Image.asset("imagens/campo2.jpeg",
          fit: BoxFit.cover,
          height: 700.0,
          width: 600.0, 
          ),
          SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              Text("    Bem vindo ao nosso bolão \n      Cadastre-se e boa sorte",
              style: TextStyle(fontSize: 18.0),),
                
              Padding(padding: EdgeInsets.only(top: 20.0),),

              TextFormField(
                validator: (String){
                  if (String.isEmpty){
                    return "Insira seu nome para continuar com o cadastro";
                  }
                },
                
                controller: nome_clienteController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightGreen[50],
                  //hintText: "NOME DO CLIENTE",
                  labelText: "NOME DO CLIENTE",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(60.0)
                  )
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0),),


              Row(
                children: <Widget>[
                  
                  DropdownButton(
                  onChanged: (String value){
                    clubHome(value);
                  },
                  value: _clube1         ,
                  items: clubes.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  
                ),
                Text("   "), 
                    DropdownButton(
                    
                  onChanged: (String value){
                    placarHome(value);
                  },
                  
                  value: _placar,
                  items: placar.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("  X   "),
                DropdownButton(
                    
                  onChanged: (String value){
                    placarAway(value);
                  },
                  value: _placar2,
                  items: placar.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("   "),
                DropdownButton(
                    
                  onChanged: (String value){
                    clubAway(value);
                  },
                  value: _clube2,
                  items: clubes.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ]
              ),
              
                Padding(padding: EdgeInsets.only(top: 20.0),),
              
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (String){
                  if (String.isEmpty){
                    return "Insira o valor da aposta";
                  }
                },
                controller: valor_apostaController,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.lightGreen[50],
                  //hintText: "Valor (R\$)",
                  labelText: "Valor (R\$)",
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0)
                  ),
                ),
              ),
                Padding(padding: EdgeInsets.only(top: 20.0),),

              Row(
              children: <Widget>[
                Text("         "),
              RaisedButton(
                  child: Text("Validar aposta"),
                  color: Colors.green,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                    _inserir();
                    }
                  },
                ),
                Text("             "),
                RaisedButton(
                  child: Text("Suas Apostas"),
                  color: Colors.green,
                  onPressed: (){
                    _consultar();
                  },
                ),
                ]
              ),

              Text(
                _suasApostas,
                textAlign: TextAlign.center,
                                  
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              
              ),

              //1º cliente
              Text(
                _cliente,
                textAlign: TextAlign.center,
                                  
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              
              ),
              Text(
                _placarTot,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                _valor,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

              //2º cliente
              Text(
                _cliente2,
                textAlign: TextAlign.center,
                                  
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              ),
              Text(
                _placarTot2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                _valor2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

              //3º cliente
              Text(
                _cliente3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              ),
              Text(
                _placarTot3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                _valor3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

              //4º cliente
              Text(
                _cliente4,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              ),
              Text(
                _placarTot4,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                _valor4,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

              //5º cliente
              Text(
                _cliente5,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              ),
              Text(
                _placarTot5,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                _valor5,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

            ]
          )
        )

      ),
        ]
      ) 
        
    );
  }
} 

