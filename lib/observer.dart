//Observer é a classe responsável por verificar
// as entradas que irão rodar em nossos streams, implementando métodos do stream


import 'dart:async';

import 'package:flutter/material.dart';

//Observer é responsável por receber e passar os dados,
// serve como intermediário, e indica o estado da mensagem
class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;

  @required
  final Function onSuccess;

  final Function onError;
  final Function onWaiting;

  const Observer({this.onError, this.onSuccess, this.stream, this.onWaiting});

  Function get _defaultOnWaiting =>
          (context) => Center(child: CircularProgressIndicator());
  Function get _defaultOnError => (context, error) => Text(error);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      //passar o contexto e a informação;
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return (onError != null)
              ? onError(context, snapshot.error)
              : _defaultOnError(context, snapshot.error);
        }

        if (snapshot.hasData) {
          T data = snapshot.data;
          return onSuccess(context, data);
        } else {
          return (onWaiting != null)
              ? onWaiting(context)
              : _defaultOnWaiting(context);
        }
      },
    );
  }
}