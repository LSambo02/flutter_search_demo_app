import 'package:rxdart/rxdart.dart';


//determina como são passados para ui os resultados tratados pelo PublishSubject
class SearchManager {
  //cntrola o conteudo que está sendo inserido
  final PublishSubject<String> _filterSubject = PublishSubject<String>();

  //responsável por passar o resultado da pesquisa para streams
  Stream<List<String>> filteredNames({query}) =>
      Stream.fromFuture(_resultados(query: query));

  //recebe cada input
  Sink<String> get sNomes => _filterSubject.sink;

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

  //filtra resultados, a partir do que está patente na área de pesquisa
  Future<List<String>> _resultados({query}) async {
    //pega o valor patente na área de pesquisa
    _filterSubject.listen((value) {
      print(value);
      if (value != '') {
        for (var aux in lista) {
          if (aux.toLowerCase().contains(value.toLowerCase()) && !auxList.contains(aux)) {
            auxList.insert(0, aux);
          }
        }
        //limpar a lista após apresentar resultados de um valor introduzido
        auxList = new List();
      }
    });
    return auxList;
  }
}
