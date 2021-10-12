import 'package:flutter/material.dart';

class TableResult2 extends StatelessWidget {
  final bool isEncode;
  final int n;
  final int phi;
  final int inverseOfE;
  final Map keyPublic;
  final int keyPrivate;
  final List<int> ds;
  final List<int> as;
  final List<int> xs;
  final bool tableMode;

  TableResult2({
    this.isEncode = true,
    required this.phi,
    required this.keyPublic,
    required this.keyPrivate,
    required this.ds,
    required this.as,
    required this.xs,
    required this.n,
    required this.inverseOfE,
    required this.tableMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "n = $n",
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            ),
            // Text(
            //   "Inverse of e = $inverseOfE",
            //   style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            // ),
            Text(
              "Phi n = $phi",
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            ),
            Text(
              "d = $keyPrivate",
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            ),
          ],
        ),
        Visibility(visible: tableMode, child: buildTable()),
        SizedBox(height: 30),
        isEncode
            ? Text(
                "y = ${ds.last}",
                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              )
            : Text(
                "x = ${ds.last}",
                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              )
      ],
    );
  }

  Widget buildViewForEncode() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("N : $n")],
        )
      ],
    );
  }

  Widget buildTable() {
    List<TableRow> rows = List.generate(xs.length, (index) {
      TableRow tbRow = TableRow(children: [
        itemCell(xs[index].toString()),
        itemCell(as[index].toString()),
        itemCell(ds[index].toString())
      ]);
      return tbRow;
    });

    return Table(
      border: TableBorder.all(),
      children: rows,
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    );
  }

  Widget itemCell(String str) {
    return Container(
      alignment: FractionalOffset.center,
      child: Text(
        str,
        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
      ),
    );
  }
}
