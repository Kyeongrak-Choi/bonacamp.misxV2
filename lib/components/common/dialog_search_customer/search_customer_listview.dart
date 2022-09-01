import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_Customer_ListView extends StatelessWidget {
  final List<String> datas = ['보나캠프1', '보나캠프2', '보나캠프3'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text(datas[index]),
        );
      },
      //  Divider 로 구분자 추가.
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
