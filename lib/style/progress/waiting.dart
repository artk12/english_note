
import 'package:flutter/material.dart';

class WaitingBox extends StatelessWidget {
  const WaitingBox({Key? key}) : super(key: key);

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
          color: Colors.grey
      ),
      child: Center(child: Text('-',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),)),
    );
  }
}
