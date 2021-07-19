import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CamposDart extends StatefulWidget {
  @override
  _CamposDart createState() => _CamposDart();
}

class _CamposDart extends State<CamposDart> {
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _valores = "";

  void _loginUsuario() {
    String usuario = _controllerUsuario.text;
    String senha = _controllerSenha.text;

    if (usuario.isEmpty) {
      setState(() {
        _valores = "Digite seu email!";
      });
    }else if (senha.isEmpty) {
      setState(() {
        _valores = "Digite sua senha!";
      });
    }else {
      _valores = "ok";
    }
    _limparCampos();
  }
  void _limparCampos() {
    _controllerUsuario.text = "";
    _controllerSenha.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
        backgroundColor: Colors.red[900]
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/imagens/logo_netflix_icon.jpg",
                  width: 300,
                  height: 300,)
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Digite seu Email e Senha",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Digite seu email"),
                style: TextStyle(fontSize: 20),
                controller: _controllerUsuario,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Digite sua senha"),
                style: TextStyle(fontSize: 20),
                controller: _controllerSenha,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                //ignore: deprecated_member_use
                child: RaisedButton(
                    color: Colors.red[900],
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Logar",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _loginUsuario),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  _valores,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}