import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchList extends StatelessWidget {
  //const SearchList({Key? key}) : super(key: key);

  List<String> datas = <String>['보나캠프1', '보나캠프2', '보나캠프3'];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            padding: const EdgeInsets.all(10),
            child: Center(child: Text(datas[index])),
          );
        },
        //  Divider 로 구분자 추가.
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 10,
          color: Colors.blue,
        ),
      )
    ]);
  }
}
