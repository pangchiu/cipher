import 'package:cipher/global.dart';
import 'package:cipher/table_result.dart';
import 'package:flutter/material.dart';

class AffineCipherTab extends StatefulWidget {
  final bool tableMode;
  AffineCipherTab({ this.tableMode = true});
  @override
  AffineCipherTabState createState() => AffineCipherTabState();
}

class AffineCipherTabState extends State<AffineCipherTab> {
  TextEditingController keyControlerA = TextEditingController();
  TextEditingController keyControlerB = TextEditingController();
  TextEditingController myStringController = TextEditingController();
  Map? result = {};
  bool isEncode = true;
  bool vi = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("khóa A:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(width: 0.5, color: Colors.black26),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            cursorHeight: 30,
                            controller: keyControlerA,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
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
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("khóa B:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(width: 0.5, color: Colors.black26),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            cursorHeight: 30,
                            controller: keyControlerB,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Bản mã hoặc Bản rõ:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(width: 0.5, color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      cursorHeight: 30,
                      controller: myStringController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mã tiếng việt',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Switch(
                    activeColor: Colors.deepOrange,
                    value: vi,
                    onChanged: (value) {
                      setState(() {
                        this.vi = value;
                      });
                    }),
              ],
            ),
          ),
          buildView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      result = Global.instance.encodeAffine(
                          myStringController.text.trim(),
                          {
                            'a': int.parse(keyControlerA.text.trim()),
                            'b': int.parse(keyControlerB.text.trim())
                          },
                          type: vi ? TypeCharset.viet : TypeCharset.normal);
                          isEncode = true;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("Mã Hóa",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      result = Global.instance.decodeAffine(
                          myStringController.text.trim(),
                          {
                            'a': int.parse(keyControlerA.text.trim()),
                            'b': int.parse(keyControlerB.text.trim())
                          },
                          type: vi ? TypeCharset.viet : TypeCharset.normal);
                          isEncode = false;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("giải mã",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

 Widget buildView() {
    if (result == null) {
      return Expanded(child: Text("không hợp lệ"));
    } else {
      return Expanded(
        child: result!.isEmpty
            ? Text("mời nhập")
            : TableResult(
              tableMode : widget.tableMode,
                listX: result!["listX"],
                listY: result!["listY"],
                listK: result!["listK"],
                banMa: result!["banMa"],
                banRo: result!["banRo"],
                stt: result!["stt"],
                listInverseOfK: result!["listInverseOfK"],
                isEncode: isEncode,
                inverseOfK: result!["inverseOfK"],
                result: result!["result"],
              ),
      );
    }
  }

 
}
