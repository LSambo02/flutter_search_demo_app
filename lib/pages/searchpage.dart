import 'package:flutter/material.dart';
import 'package:flutter_search_demo_app/managers/searchManager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_search_demo_app/managers/overseer.dart';
import 'package:flutter_search_demo_app/managers/searchNamesDelegate.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  TextEditingController tFcontroller;

  @override
  Widget build(BuildContext context) {
    SearchManager manager = Provider.of<Overseer>(context).fetch(SearchManager);
    //Stream<QuerySnapshot> snapshots ;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Ache a Moça - Pesquisa módulo"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //chamamos o widget responsável por apresentar os resultados
                  // com o contexto e o delegado que deve ser passado o 'manager' como parâmetro
                  //que é o que gere o dado da pesquisa
                  showSearch(context: context, delegate: SearchNamesDelegate(manager: manager));
                })
          ],
        ),

            );
  }
  @override
  void dispose() {
    tFcontroller.dispose();
    super.dispose();
  }

}
