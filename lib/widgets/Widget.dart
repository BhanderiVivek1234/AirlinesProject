import 'dart:convert';

import 'package:flutter/material.dart';

Widget buildDataWidget(BuildContext context, dynamic data) {
  return Card(
    elevation: 5.0,
    child: ListTile(
      leading: Container(
          width: 100,
          child: Image.memory(
            base64.decode(data.logo),
            errorBuilder: (context, error, stackTrace) {
              return Text("Image not available");
            },
          )),
      title: Text("${data.name}"),
      subtitle: Text("${data.country}"),
      isThreeLine: true,
    ),
  );
}

Widget buildErrorWidget(String error) {
  return Container(
    alignment: Alignment.center,
    child: Text(error, style: TextStyle(color: Colors.red)),
  );
}

Widget buildLoadingWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildInitialWidget() {
  return Center(
    child: Text("No Data Available at this time"),
  );
}
