import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GeneralDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Perfil'),
            onTap: () {
              // Adicione a navegação para a tela do perfil aqui
            },
          ),
          ListTile(
            title: Text('Rotinas de Exercícios'),
            onTap: () {
              // Adicione a navegação para a tela de rotinas de exercícios aqui
            },
          ),
          ListTile(
            title: Text('Rastreamento de Atividades'),
            onTap: () {
              // Adicione a navegação para a tela de rastreamento de atividades aqui
            },
          ),
          ListTile(
            title: Text('Dicas de Saúde'),
            onTap: () {
              // Adicione a navegação para a tela de dicas de saúde aqui
            },
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () async {
              await _signOut();
              Navigator.pop(context); // Fechar o Drawer
            },
          ),
        ],
      ),
    );
  }
}
