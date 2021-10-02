import 'package:cipher/global.dart';
import 'package:cipher/table_result.dart';
import 'package:flutter/material.dart';

class HillCipherTab extends StatefulWidget {
  final bool tableMode;
  HillCipherTab({ this.tableMode = true});
  @override
  HillCipherTabState createState() => HillCipherTabState();
}

class HillCipherTabState extends State<HillCipherTab> {
  TextEditingController k11Controler = TextEditingController();
  TextEditingController k12Controler = TextEditingController();
  TextEditingController k21Controler = TextEditingController();
  TextEditingController k22Controler = TextEditingController();
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
                          child: Text("khóa k11:",
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
                            controller: k11Controler,
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
                          child: Text("khóa k12:",
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
                            controller: k12Controler,
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
                          child: Text("khóa k21:",
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
                            controller: k21Controler,
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
                          child: Text("khóa k22:",
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
                            controller: k22Controler,
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
            height: 20,
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      result = Global.instance.encodeHill(
                          myStringController.text.trim(),
                          [
                            [
                              int.parse(k11Controler.text.trim()),
                              int.parse(k12Controler.text.trim())
                            ],
                            [
                              int.parse(k21Controler.text.trim()),
                              int.parse(k22Controler.text.trim())
                            ]
                          ],
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
                      child: Text("Mã hóa",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      result = Global.instance.decodeHill(
                          myStringController.text.trim(),
                          [
                            [
                              int.parse(k11Controler.text.trim()),
                              int.parse(k12Controler.text.trim())
                            ],
                            [
                              int.parse(k21Controler.text.trim()),
                              int.parse(k22Controler.text.trim())
                            ]
                          ],
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
                listX: result!["listX"],
                listY: result!["listY"],
                listK: result!["listK"],
                banMa: result!["banMa"],
                banRo: result!["banRo"],
                stt: result!["stt"],
                listInverseOfK: result!["listInverseOfK"],
                isEncode: isEncode,
                inverseOfK: result!["inverseOfK"],
              ),
      );
    }
  }
}
