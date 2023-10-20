import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
