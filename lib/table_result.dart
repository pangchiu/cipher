import 'package:flutter/material.dart';

class TableResult extends StatelessWidget {
  final List<dynamic>? listX;
  final List<dynamic>? listY;
  final List<dynamic>? listK;
  final List<dynamic>? listInverseOfK;
  final List<int>? stt;
  final List<String> banRo;
  final List<String> banMa;
  final bool isEncode;
  final int? detK;
  final List<List<int>>? inverseOfK;
  final List<List<int>>? kStart;
  final String? result;
  final bool tableMode;

  TableResult(
      {this.listX,
      this.listY,
      required this.listK,
      required this.banMa,
      required this.banRo,
      this.isEncode = true,
      this.stt,
      this.detK,
      this.inverseOfK,
      this.kStart,
      this.result,
      this.listInverseOfK,
      this.tableMode = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: tableMode,
          child: Table(
            border: TableBorder.all(),
            children: buildView(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("$result",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }

  List<TableRow> buildView() {
    if (!isEncode) {
      return buildViewDecode();
    } else {
      return buildViewEncode();
    }
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

  TableRow buildBanMa() {
    var row = List.generate(banMa.length, (index) {
      return itemCell(banMa[index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildBanRo() {
    var row = List.generate(banRo.length, (index) {
      return itemCell(banRo[index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildK() {
    var row = List.generate(listK!.length, (index) {
      return itemCell(listK![index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildX() {
    var row = List.generate(listX!.length, (index) {
      return itemCell(listX![index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildY() {
    var row = List.generate(listY!.length, (index) {
      return itemCell(listY![index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildListInverseOfK() {
    var row = List.generate(listInverseOfK!.length, (index) {
      return itemCell(listInverseOfK![index].toString());
    });

    return TableRow(children: row);
  }

  TableRow buildStt() {
    var row = List.generate(stt!.length, (index) {
      return itemCell(stt![index].toString());
    });

    return TableRow(children: row);
  }

  List<TableRow> buildViewDecode() {
    List<TableRow> rows = [];
    rows.add(buildBanMa());
    if (listY != null) {
      rows.add(buildY());
    }
    if (stt != null) {
      rows.add(buildStt());
    }
    if (listK != null) {
      rows.add(buildK());
    }
    if (listInverseOfK != null) {
      rows.add(buildListInverseOfK());
    }

    if (listX != null) {
      rows.add(buildX());
    }
    rows.add(buildBanRo());
    return rows;
  }

  List<TableRow> buildViewEncode() {
    List<TableRow> rows = [];
    rows.add(buildBanRo());

    if (listX != null) {
      rows.add(buildX());
    }
    if (stt != null) {
      rows.add(buildStt());
    }
    if (listK != null) {
      rows.add(buildK());
    }
    if (listY != null) {
      rows.add(buildY());
    }

    rows.add(buildBanMa());
    return rows;
  }
}
