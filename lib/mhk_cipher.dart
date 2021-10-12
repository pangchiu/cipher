import 'package:cipher/global2.dart';
import 'package:flutter/material.dart';

class MhkCipher extends StatefulWidget {
  @override
  _MhkCipherState createState() => _MhkCipherState();
}

class _MhkCipherState extends State<MhkCipher> {
  Map? result = {};
  bool isEncode = true;
  TextEditingController controllerS = new TextEditingController();
  TextEditingController controllerP = new TextEditingController();
  TextEditingController controllerA = new TextEditingController();
  TextEditingController controller = new TextEditingController();

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
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Dãy siêu tăng:",
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
                            controller: controllerS,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "phân cách giữa các số bằng dấu ',' nếu nhập dãy số",
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
                flex: 1,
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
                            controller: controllerP,
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
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("A:",
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
                            controller: controllerA,
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
                    child: Text(
                      "Bản mã hoặc Bản rõ:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
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
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "phân cách giữa các số bằng dấu ',' nếu nhập dãy số",
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
                        List<int> S = controllerS.text
                            .trim()
                            .split(',')
                            .map((e) => int.parse(e))
                            .toList();
                        int p = int.parse(controllerP.text.trim());
                        int a = int.parse(controllerA.text.trim());
                        List<int> listX = controller.text
                            .trim()
                            .split(',')
                            .map((e) => int.parse(e))
                            .toList();
                        result = Global2.instance.encodeMHK(S, p, a, listX);
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
                        List<int> S = controllerS.text
                            .trim()
                            .split(',')
                            .map((e) => int.parse(e))
                            .toList();
                        int p = int.parse(controllerP.text.trim());
                        int a = int.parse(controllerA.text.trim());
                        int y = int.parse(controller.text.trim());
                        result = Global2.instance.decodeMHK(S, p, a, y);
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
      //   return Expanded(
      //       child: result!.isEmpty
      //           ? Text("mời nhập")
      //           : TableResult2(
      //             tableMode : widget.tableMode,
      //               phi: result!["phi"],
      //               keyPublic: result!["keyPublic"],
      //               keyPrivate: result!["keyPrivate"],
      //               ds: result!["ds"],
      //               as: result!["as"],
      //               xs: result!["xs"],
      //               n: result!["n"],
      //               inverseOfE: result!["inverseOfE"],
      //             ));
      // }
      return Expanded(
          child: isEncode
              ? Text(result!["y"] != null ? result!["y"].toString() : "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              : Text(result!["listX"] != null ? result!["listX"].toString() : "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)));
    }
  }
}
