import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_demo_app/pages/searchpage.dart';

class SearchManager {
  //cntrola o conteudo que está sendo inserido
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  //final PublishSubject<int> _counterSubject = PublishSubject<int>();


  //responsável por passar o resultado da pesquisa para streams
  Stream<List<String>> filteredNames({query}) =>
      Stream.fromFuture(_resultados(query: query));

  //recebe cada input
  Sink<String> get sNomes => _filterSubject.sink;

/*  Observable<int> get count$ => _counterSubject.stream;
  void dispose() {
    _counterSubject.close();
    _filterSubject.close();
  }*/

  List<String> lista = [
    'Ana',
    'Carla',
    'Joana',
    'Alice',
    'Amber',
    'Carla',
    'Perla',
    'Bethy'
  ];

  List<String> auxList = new List();


  //filtra resultados, a partir do que está patente na barra de pesquisa
  Future<List<String>> _resultados({query}) async {
    print(query);
    //pega o último valor patente
    _filterSubject.listen((value) {
      print(value);
      if (value != '') {
        for (var aux in lista) {
          if (aux.toLowerCase().contains(value.toLowerCase())) {
            auxList.insert(0,aux);
            break;
            //_validateSearch(auxList);
            print(aux);
            // return auxList;
          }
        }
      }else{
        auxList = new List();
        //return auxList;

      }

      //print(auxList);
    });
    return auxList;

  }
}
