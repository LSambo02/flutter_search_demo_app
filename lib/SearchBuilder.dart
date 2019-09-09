import 'dart:async';

import 'package:flutter_search_demo_app/observer.dart';
import 'package:flutter/material.dart';

//criar nosso próprio builder baseado em stream
class SearchBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;


  //definição de parâmetros
  SearchBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {

    return Observer<List<String>>(
      stream: stream,
      //implementar funções do stream
      onSuccess: (BuildContext context, List<String> data) =>
          builder(context, data),
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}