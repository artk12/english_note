
import 'package:flutter/material.dart';

class CorrectBox extends StatelessWidget {
  const CorrectBox({Key? key}) : super(key: key);

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
          color: Colors.green.shade900
      ),
      child: const Center(child: Icon(Icons.check,color: Colors.white,size: 14,)),
    );
  }
}
