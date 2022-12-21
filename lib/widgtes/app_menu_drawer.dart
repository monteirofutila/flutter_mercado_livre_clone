import 'package:flutter/material.dart';
import 'package:app_ml/pages/page01.dart';
import 'package:app_ml/pages/page02.dart';

class AppMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Container(
          height: 120,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 241, 89, 1)),
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Icon(Icons.people),
                    backgroundColor: Color.fromRGBO(255, 241, 89, 1),
                    foregroundColor: Colors.grey,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 4.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Olá, Monteiro',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Nivel Avançado'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _itemDrawer(context, Page01(), Icon(Icons.home), 'Home'),
        _itemDrawer(context, Page02(), Icon(Icons.hotel), 'Pagina 02'),
        Divider(color: Colors.black),
        _itemDrawer(
            context, Page01(), Icon(Icons.label_important), 'Pagina 03'),
        _itemDrawer(
            context, Page01(), Icon(Icons.location_searching), 'Pagina 04',
            badge: '5'),
        _itemDrawer(context, Page01(), Icon(Icons.filter_1), 'Pagina 05'),
        _itemDrawer(context, Page01(), Icon(Icons.face), 'Pagina 06'),
        Divider(color: Colors.black),
        _itemDrawer(context, Page01(), Icon(Icons.exit_to_app), 'Sair'),
      ],
    );
  }

  Widget _itemDrawer(context, page, Icon icon, String text,
      {String badge = ''}) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      leading: IconTheme(
        child: icon,
        data: IconThemeData(color: Colors.black),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: badge != ''
            ? Padding(
                padding: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ),
              )
            : Text(''),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
    );
  }
}
