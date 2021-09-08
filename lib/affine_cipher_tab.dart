import 'package:cipher/global.dart';
import 'package:flutter/material.dart';

class AffineCipherTab extends StatefulWidget {
  @override
  AffineCipherTabState createState() => AffineCipherTabState();
}

class AffineCipherTabState extends State<AffineCipherTab> {
  TextEditingController keyControlerA = TextEditingController();
  TextEditingController keyControlerB = TextEditingController();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("a:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: keyControlerA,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("b:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: keyControlerB,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
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
                  result = Global.instance
                      .encodeAffine(myStringController.text.trim(), {
                    'a': int.parse(keyControlerA.text.trim()),
                    'b': int.parse(keyControlerB.text.trim())
                  });
                });
              },
              child: Text("mã hóa",style: TextStyle(fontSize: 15)),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Global.instance
                      .decodeAffine(myStringController.text.trim(), {
                    'a': int.parse(keyControlerA.text.trim()),
                    'b': int.parse(keyControlerB.text.trim())
                  });
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
