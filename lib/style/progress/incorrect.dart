
import 'package:flutter/material.dart';

class InCorrectBox extends StatelessWidget {
  const InCorrectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.grey,blurRadius: 15,spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.shade900
      ),
      child: const Icon(Icons.close,color: Colors.white,size: 14,),
    );
  }
}
