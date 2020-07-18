import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityList.dart';

class ListSearch extends StatefulWidget {
  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();
  static List<String> mainDataList = getcityList();

  List<String> newDataList = mainDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              cursorColor: Color.fromRGBO(0, 202, 32, 1),
              // autofocus: true,
              controller: _textController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 202, 32, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 202, 32, 1))),
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 202, 32, 1))),
                hintText: 'Insira sua cidade...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(data),
                  onTap: () => Navigator.pop(context, data),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
