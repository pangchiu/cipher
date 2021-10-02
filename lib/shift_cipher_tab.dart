import 'package:cipher/global.dart';
import 'package:cipher/table_result.dart';
import 'package:flutter/material.dart';

class ShiftCipherTab extends StatefulWidget {
  final tableMode;
  ShiftCipherTab({this.tableMode});
  @override
  ShiftCipherTabState createState() => ShiftCipherTabState();
}

class ShiftCipherTabState extends State<ShiftCipherTab> {
  TextEditingController keyControler = TextEditingController();
  TextEditingController myStringController = TextEditingController();
  Map? result = {};
  bool vi = false;
  bool isEncode = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                    alignment: Alignment.center,
                    child: Text("khóa k:",
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
            height: 10,
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
                    if (myStringController.text.trim().isNotEmpty &&
                        keyControler.text.trim().isNotEmpty) {
                      setState(() {
                        result = Global.instance.encodeShift(
                            myStringController.text.trim(),
                            int.parse(keyControler.text.trim()),
                            type: vi ? TypeCharset.viet : TypeCharset.normal)!;
                        isEncode = true;
                      });
                    }
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
                    if (myStringController.text.trim().isNotEmpty &&
                        keyControler.text.trim().isNotEmpty) {
                      setState(() {
                        result = Global.instance.decodeShift(
                            myStringController.text.trim(),
                            int.parse(keyControler.text.trim()),
                            type: vi ? TypeCharset.viet : TypeCharset.normal)!;
                        isEncode = false;
                      });
                    }
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
