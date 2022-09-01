import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              hintText: 'hint_search_customer'.tr,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              )),
        )),
      ],
    );
  }
}
