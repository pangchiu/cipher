import 'package:cipher/table_result2.dart';
import 'package:flutter/material.dart';

import 'global2.dart';

class RSACipherTab extends StatefulWidget {
  final bool tableMode;
  RSACipherTab({ this.tableMode = true});
  @override
  RSACipherTabState createState() => RSACipherTabState();
}

class RSACipherTabState extends State<RSACipherTab> {
  TextEditingController keyControlerP = TextEditingController();
  TextEditingController keyControlerQ = TextEditingController();
  TextEditingController keyControlerE = TextEditingController();
  TextEditingController keyControler = TextEditingController();
  Map? result = {};
  bool isEncode = true;

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
                          child: Text("P:",
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
                            controller: keyControlerP,
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
                          child: Text("Q:",
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
                            controller: keyControlerQ,
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
                          child: Text("E:",
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
                            controller: keyControlerE,
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
                      controller: keyControler,
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
          buildView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      try {
                        result = Global2.instance.encodeRSA(
                          int.parse(keyControlerP.text.trim()),
                          int.parse(keyControlerQ.text.trim()),
                          int.parse(keyControlerE.text.trim()),
                          int.parse(keyControler.text.trim()),
                        );
                      } catch (e) {
                        result = null;
                      }
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
                      try {
                        result = Global2.instance.decodeRSA(
                          int.parse(keyControlerP.text.trim()),
                          int.parse(keyControlerQ.text.trim()),
                          int.parse(keyControlerE.text.trim()),
                          int.parse(keyControler.text.trim()),
                        );
                      } catch (e) {
                        result = null;
                      }
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
      return Expanded(
          child: Text("không hợp lệ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)));
    } else {
      return Expanded(
          child: result!.isEmpty
              ? Text("mời nhập")
              : TableResult2(
                  phi: result!["phi"],
                  keyPublic: result!["keyPublic"],
                  keyPrivate: result!["keyPrivate"],
                  ds: result!["ds"],
                  as: result!["as"],
                  xs: result!["xs"],
                  n: result!["n"],
                  inverseOfE: result!["inverseOfE"],
                ));
    }
  }
}
