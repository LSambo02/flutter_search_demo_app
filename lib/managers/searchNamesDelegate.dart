import 'package:flutter/material.dart';
import 'searchManager.dart';


//Esta é uma implementação do SearchDelegate que tem os métodos
// de controle de estado de SearchPages
class SearchNamesDelegate extends SearchDelegate {
  final SearchManager manager;

  SearchNamesDelegate({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    manager.sNomes.add(query);//mandar os dados para o sink do PublishSubject
    // TODO: implement buildSuggestions
    return StreamBuilder<List<String>>(

        stream: manager.filteredNames(query: query),//receber a lista de elementos que resultam da pesquisa
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              print(snapshot.data);
              List<String> nomes = snapshot.data;
              return ListView.separated(
                itemCount: nomes?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(nomes[index]),
                    subtitle: Text('perfecto'),
                    leading: CircleAvatar(),
                  );
                  //separa os vários resultados presentes em 'ListTiles'
                }, separatorBuilder: (BuildContext context, int index) =>Divider(),
              );
        });
  }
}
