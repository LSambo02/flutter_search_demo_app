
//Overseer é a classe responsável por registar
// os managers usados para controlo de estado

import 'searchManager.dart';


class Overseer{
  Map<dynamic, dynamic> repository = {};


  Overseer(){
    register(SearchManager, SearchManager());
  }

  register(name, object){
    repository[name]=object;

  }

  fetch(name)=>repository[name];
}