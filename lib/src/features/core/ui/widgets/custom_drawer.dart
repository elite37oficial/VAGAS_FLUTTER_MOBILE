import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 200,
            height: 500,
            child: Drawer(
              
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: Text('Opção 1'),
                    onTap: () {
                      // Código para quando a opção 1 for selecionada.
                    },
                  ),
                  ListTile(
                    title: Text('Opção 2'),
                    onTap: () {
                      // Código para quando a opção 2 for selecionada.
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
