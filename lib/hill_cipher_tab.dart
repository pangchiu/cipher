import 'package:cipher/global.dart';
import 'package:flutter/material.dart';

class HillCipherTab extends StatefulWidget {
  @override
  HillCipherTabState createState() => HillCipherTabState();
}

class HillCipherTabState extends State<HillCipherTab> {
  TextEditingController k11Controler = TextEditingController();
  TextEditingController k12Controler = TextEditingController();
  TextEditingController k21Controler = TextEditingController();
  TextEditingController k22Controler = TextEditingController();
  TextEditingController myStringController = TextEditingController();
  String result = "";
  bool vi = false;

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
                    child: Text("k11:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: k11Controler,
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
                    child: Text("k12:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: k12Controler,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("k21:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: k21Controler,
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
                    child: Text("k22:",style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        controller: k22Controler,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
            ),
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
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('mã tiếng việt'),
              Switch(
                  value: vi,
                  onChanged: (value) {
                    setState(() {
                      this.vi = value;
                    });
                  }),
            ],
          ),
        ),
        Text(result),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Global.instance
                      .encodeHill(myStringController.text.trim(), [
                    [
                      int.parse(k11Controler.text.trim()),
                      int.parse(k12Controler.text.trim())
                    ],
                    [
                      int.parse(k21Controler.text.trim()),
                      int.parse(k22Controler.text.trim())
                    ]
                  ],type: vi ? TypeCharset.viet : TypeCharset.normal);
                });
              },
              child: Text("mã hóa",style: TextStyle(fontSize: 15)),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Global.instance
                      .decodeHill(myStringController.text.trim(), [
                    [
                      int.parse(k11Controler.text.trim()),
                      int.parse(k12Controler.text.trim())
                    ],
                    [
                      int.parse(k21Controler.text.trim()),
                      int.parse(k22Controler.text.trim())
                    ]
                  ],type: vi ? TypeCharset.viet : TypeCharset.normal);
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
