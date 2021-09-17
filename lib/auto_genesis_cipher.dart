 import 'package:cipher/global.dart';
import 'package:flutter/material.dart';

class AutoGenesisCipherTab  extends StatefulWidget {
  

  @override
  AutoGenesisCipherTabState createState() => AutoGenesisCipherTabState();
}

class AutoGenesisCipherTabState extends State<AutoGenesisCipherTab> {
  TextEditingController keyControler = TextEditingController();
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
                flex: 2,
                child: Text("k:",style: TextStyle(fontSize: 15)),
              ),
              Expanded(
                flex: 8,
                child: TextField(
                    controller: keyControler,
                    keyboardType: TextInputType.number),
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
                    result = Global.instance.encodeAutogenesis(
                        myStringController.text.trim(),
                        int.parse(keyControler.text.trim()),type: vi ? TypeCharset.viet : TypeCharset.normal);
                  });
                },
                child: Text("mã hóa",style: TextStyle(fontSize: 15)),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    result = Global.instance.decodeAutogenesis(
                        myStringController.text.trim(),
                        int.parse(keyControler.text.trim()),type: vi ? TypeCharset.viet : TypeCharset.normal);
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