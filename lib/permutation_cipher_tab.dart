import 'package:cipher/global.dart';
import 'package:flutter/material.dart';

class PermutationCipherTab extends StatefulWidget {
  @override
  PermutationCipherTabState createState() => PermutationCipherTabState();
}

class PermutationCipherTabState extends State<PermutationCipherTab> {
  TextEditingController keyController = TextEditingController();
  TextEditingController myStringController = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text("Từ khóa:",style: TextStyle(fontSize: 15)),
            ),
            Expanded(
              flex: 8,
              child: TextField(
                  controller: keyController,
                  keyboardType: TextInputType.name),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text("từ của bạn:",style: TextStyle(fontSize: 15)),
            ),
            Expanded(
              flex: 8,
              child: TextField(
                  controller: myStringController,
                  keyboardType: TextInputType.name),
            )
          ],
        ),
        Text(result),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Global.instance.encodePermutation(
                      myStringController.text.trim(),
                      keyController.text.trim());
                });
              },
              child: Text("mã hóa",style: TextStyle(fontSize: 15)),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Global.instance.decodePermutation(
                      myStringController.text.trim(),
                      keyController.text.trim());
                });
              },
              child: Text("giải mã",style: TextStyle(fontSize: 15)),
            )
          ],
        )
      ],
    );
  }
}
