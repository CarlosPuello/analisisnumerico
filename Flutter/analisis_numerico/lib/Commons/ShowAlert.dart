import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlert({String title, String msg, BuildContext context}){
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"))
          ],
      ),
      barrierDismissible: false
  );
}