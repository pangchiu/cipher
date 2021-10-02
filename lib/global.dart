import 'package:cipher/utf.dart';

enum TypeCharset { viet, normal }

class Global {
  static int Z = 26;
  static Global instance = Global._();

  Global._();

  // mã hóa dịch vòng
  Map? encodeShift(final String str, final int key,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banRo = List.generate(str.length, (index) => str[index]);
    late List<int> listX;
    late List<String> banMa;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listX = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listX = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    if (isInvalidList(listX) && key <= Z) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listY = List.generate(listX.length, (index) => (listX[index] + key) % Z);
      if (type == TypeCharset.normal) {
        banMa = List.generate(
            listY.length, (index) => String.fromCharCode((listY[index] + 65)));
      } else {
        banMa = List.generate(listY.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listY[index]]!);
      }
      String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // giải mã dịch vòng
  Map? decodeShift(final String str, final int key,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banMa = List.generate(str.length, (index) => str[index]);
    late List<int> listY;
    late List<String> banRo;
    late List<int> listX;

    if (type == TypeCharset.normal) {
      Z = 26;
      listY = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listY = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    if (isInvalidList(listY) && key <= Z) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listX = List.generate(listY.length, (index) => (listY[index] - key) % Z);
      if (type == TypeCharset.normal) {
        banRo = List.generate(
            listX.length, (index) => String.fromCharCode((listX[index] + 65)));
      } else {
        banRo = List.generate(listX.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listX[index]]!);
      }
      String result = "";
      banRo.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // mã hóa vingen
  Map? encodeVingen(final String str, final String k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;
    List<String> banRo = List.generate(str.length, (index) => str[index]);
    late List<int> listK;
    late List<int> listX;
    late List<String> banMa;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listX = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
      listK = List.generate(str.length,
          (index) => k[index % k.length].toUpperCase().codeUnitAt(0) - 65);
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listX = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });

      listK = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[k[index % k.length]] !=
            null) {
          return Utf.instance.vietNameseCharsetByString[k[index % k.length]]!;
        } else {
          return -1;
        }
      });
    }

    if (isInvalidList(listX) && isInvalidList(listK)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listY = List.generate(
          listX.length, (index) => (listX[index] + listK[index]) % Z);
      if (type == TypeCharset.normal) {
        banMa = List.generate(
            listY.length, (index) => String.fromCharCode((listY[index] + 65)));
      } else {
        banMa = List.generate(listY.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listY[index]]!);
      }
      String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // giải mã vingen
  Map? decodeVingen(final String str, final String k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;
    List<String> banMa = List.generate(str.length, (index) => str[index]);
    late List<int> listK;
    late List<int> listX;
    late List<String> banRo;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listY = str.toUpperCase().codeUnits.map((e) => e - 65).toList();

      listK = List.generate(str.length,
          (index) => k[index % k.length].toUpperCase().codeUnitAt(0) - 65);
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listY = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });

      listK = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[k[index % k.length]] !=
            null) {
          return Utf.instance.vietNameseCharsetByString[k[index % k.length]]!;
        } else {
          return -1;
        }
      });
    }

    if (isInvalidList(listY) && isInvalidList(listK)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listX = List.generate(
          listY.length, (index) => (listY[index] - listK[index]) % Z);
      if (type == TypeCharset.normal) {
        banRo = List.generate(
            listX.length, (index) => String.fromCharCode((listX[index] + 65)));
      } else {
        banRo = List.generate(listX.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listX[index]]!);
      }
      String result = "";
      banRo.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // mã hóa affine
  Map? encodeAffine(final String str, final Map<String, int> k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banRo = List.generate(str.length, (index) => str[index]);
    late List<int> listX;
    late List<String> banMa;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listX = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listX = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    // kiểm tra k có null hay không
    if (k["a"] != null && k["b"] != null) {
      if (isInvalidList(listX) && ucln(Z, k["a"]!) == 1) {
        isInvalid = true;
      }
    }

    if (!isInvalid) {
      return null;
    } else {
      listY = List.generate(
          listX.length, (index) => (listX[index] * k["a"]! + k["b"]!) % Z);
      if (type == TypeCharset.normal) {
        banMa = List.generate(
            listY.length, (index) => String.fromCharCode(listY[index] + 65));
      } else {
        banMa = List.generate(listY.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listY[index]]!);
      }
      String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // giải mã affine
  Map? decodeAffine(final String str, final Map<String, int> k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banMa = List.generate(str.length, (index) => str[index]);
    late List<int> listY;
    late List<String> banRo;
    late List<int> listX;

    if (type == TypeCharset.normal) {
      Z = 26;
      listY = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listY = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    // kiểm tra k có null hay không
    if (k["a"] != null && k["b"] != null) {
      if (isInvalidList(listY) && ucln(Z, k["a"]!) == 1) {
        isInvalid = true;
      }
    }

    if (!isInvalid) {
      return null;
    } else {
      listX = List.generate(listY.length,
          (index) => ((listY[index] - k["b"]!) * inverseOf(k["a"]!, Z)) % Z);
      if (type == TypeCharset.normal) {
        banRo = List.generate(
            listX.length, (index) => String.fromCharCode(listX[index] + 65));
      } else {
        banRo = List.generate(listX.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listX[index]]!);
      }

      String result = "";
      banRo.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
      };
    }
  }

  // mã hóa hill
  Map? encodeHill(final String str, final List<List<int>> k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banRo = List.generate(str.length, (index) => str[index]);
    late List<int> listX;
    late List<String> banMa;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listX = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listX = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }

    // thêm kí tự ở vị trí 0 trong các bảng mã nếu chuỗi kí tự có độ dài lẻ
    if (listX.length % levelOfMatrix(k) != 0) {
      listX.add(0);
      banRo.add(type == TypeCharset.normal
          ? "A"
          : Utf.instance.vietNameseCharsetByInt[0]!);
    }

    int detK = detKOfMatrix(k);
    if (ucln(detK, Z) == 1 &&
        isInvalidList(listX) &&
        levelOfMatrix(k) == 2 &&
        inverseOf(detK, Z) != 0) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      int n = 0;
      listY = [];
      while (n * 2 <= listX.length - 1) {
        listY.add((listX[n * 2] * k[0][0] + listX[n * 2 + 1] * k[1][0]) % Z);
        listY.add((listX[n * 2] * k[0][1] + listX[n * 2 + 1] * k[1][1]) % Z);
        n++;
      }

      if (type == TypeCharset.normal) {
        banMa = List.generate(
            listY.length, (index) => String.fromCharCode(listY[index] + 65));
      } else {
        banMa = List.generate(listY.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listY[index]]!);
      }
      String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
        "detK": detK,
      };
    }
  }

  // giải mã hill
  Map? decodeHill(final String str, final List<List<int>> k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banMa = List.generate(str.length, (index) => str[index]);
    late List<int> listY;
    late List<String> banRo;
    late List<int> listX;

    if (type == TypeCharset.normal) {
      Z = 26;
      listY = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listY = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    // thêm kí tự nếu chuỗi kí tự có độ dài lẻ
    if (listY.length % levelOfMatrix(k) != 0) {
      listY.add(0);
      banMa.add(type == TypeCharset.normal
          ? "A"
          : Utf.instance.vietNameseCharsetByInt[0]!);
    }

    int detK = detKOfMatrix(k);
    if (ucln(detK, Z) == 1 &&
        isInvalidList(listY) &&
        levelOfMatrix(k) == 2 &&
        inverseOf(detK, Z) != 0) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      List<List<int>> kStar = [
        [k[1][1], -k[0][1]],
        [-k[1][0], k[0][0]]
      ];

      List<List<int>> inverseOfK = kStar
          .map<List<int>>(
              (row) => row.map((e) => e * inverseOf(detK, Z) % Z).toList())
          .toList();

      int n = 0;
      listX = [];
      while (n * 2 <= listY.length - 1) {
        listX.add((listY[n * 2] * inverseOfK[0][0] +
                listY[n * 2 + 1] * inverseOfK[1][0]) %
            Z);
        listX.add((listY[n * 2] * inverseOfK[0][1] +
                listY[n * 2 + 1] * inverseOfK[1][1]) %
            Z);
        n++;
      }

      if (type == TypeCharset.normal) {
        banRo = List.generate(
            listX.length, (index) => String.fromCharCode(listX[index] + 65));
      } else {
        banRo = List.generate(listX.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listX[index]]!);
      }

      String result = "";
      banRo.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": null,
        "listY": listY,
        "result": result,
        "detK": detK,
        "kStar": kStar,
        "inverseOf": inverseOfK,
      };
    }
  }

  // mã hóa autogenesis
  Map? encodeAutogenesis(final String str, final int k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banRo = List.generate(str.length, (index) => str[index]);
    late List<int> listX;
    late List<int> listK;
    late List<String> banMa;
    late List<int> listY;

    if (type == TypeCharset.normal) {
      Z = 26;
      listX = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listX = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }
    if (isInvalidList(listX)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listK = [k, ...listX.sublist(0, listX.length - 1)];

      listY = List.generate(
          listX.length, (index) => (listX[index] + listK[index]) % Z);

      if (type == TypeCharset.normal) {
        banMa = List.generate(
            listY.length, (index) => String.fromCharCode((listY[index] + 65)));
      } else {
        banMa = List.generate(listY.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listY[index]]!);
      }
      String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": listK,
        "listY": listY,
        "result": result,
      };
    }
  }

  //giải mã autogenesis
  Map? decodeAutogenesis(final String str, final int k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;

    List<String> banMa = List.generate(str.length, (index) => str[index]);
    late List<int> listY;
    late List<int> listK;
    late List<String> banRo;
    late List<int> listX;

    if (type == TypeCharset.normal) {
      Z = 26;
      listY = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    } else {
      Z = Utf.instance.vietNameseCharsetByString.length;
      listY = List.generate(str.length, (index) {
        if (Utf.instance.vietNameseCharsetByString[str[index]] != null) {
          return Utf.instance.vietNameseCharsetByString[str[index]]!;
        } else {
          return -1;
        }
      });
    }

    if (isInvalidList(listY)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      listK = [k];

      listX = List.generate(listY.length, (index) {
        var value = (listY[index] - listK[listK.length - 1]) % Z;
        if(index != listY.length - 1) {
          listK.add(value);
        }
        return value;
      }).toList();

      if (type == TypeCharset.normal) {
        banRo = List.generate(
            listX.length, (index) => String.fromCharCode((listX[index] + 65)));
      } else {
        banRo = List.generate(listX.length,
            (index) => Utf.instance.vietNameseCharsetByInt[listX[index]]!);
      }
      String result = "";
      banRo.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "banMa": banMa,
        "listX": listX,
        "listK": listK,
        "listY": listY,
        "result": result,
      };
    }
  }

  // mã hóa permutation
  Map? encodeTransposition(final String str, final String k,
      {TypeCharset type = TypeCharset.viet}) {
        bool isInvalid = false;
        String tempString = k.replaceAll(RegExp(r"\s+\b|\b\s"), "");// loại bỏ mọi khoảng trắng của k
     List<String> banRo = List.generate(str.length, (index) => str[index]);

    late List<int> listK;
    late List<String> banMa;

      listK = List.generate(tempString.length, (index) {
        try {
         return int.parse(tempString[index]);
        } catch (e) {
        return -1;
        }
      });
    

    //Chỉnh chiều dài của ban mã sao cho phù hợp với ban key
    if (listK.length < banRo.length) {
      int count = banRo.length - listK.length;
      for(int i = 1; i <= count; i ++) {
        banRo.removeLast();
      }
    }else if(listK.length > banRo.length){
      int count = listK.length - banRo.length;
      for(int i = 1; i <= count; i ++) {
        banRo.add(type == TypeCharset.normal ? "A" : Utf.instance.vietNameseCharsetByInt[0]!);
      }

    }

    if (isInvalidList(listK)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return null;
    } else {
      Map mapBanRo = banRo.asMap();
      banMa = List.generate(listK.length, (index) => mapBanRo[listK[index] - 1]);
    }
    String result = "";
      banMa.forEach((e) {
        result += e;
      });

      return {
        "banRo": banRo,
        "stt" : List.generate(banRo.length, (index) => index + 1),
        "banMa": banMa,
        "listX": null,
        "listK": listK,
        "listY": null,
        "result": result,
      };
  }

  //giải mã permutation
  Map? decodeTransposition(final String str, final String k,
      {TypeCharset type = TypeCharset.viet}) {
    bool isInvalid = false;
        String tempString = k.replaceAll(RegExp(r"\s+\b|\b\s"), "");// loại bỏ mọi khoảng trắng của k
     List<String> banMa = List.generate(str.length, (index) => str[index]);
     late List<int> stt;
    late List<int> listK;
    late List<int> listInverseOfK;
    late List<String> banRo;


  


      listK = List.generate(tempString.length, (index) {
        try {
         return int.parse(tempString[index]);
        } catch (e) {
        return -1;
        }
      });
    

    //Chỉnh chiều dài của ban mã sao cho phù hợp với ban key
    if (listK.length < banMa.length) {
      int count = banMa.length - listK.length;
      for(int i = 1; i <= count; i ++) {
        banMa.removeLast();
      }
    }else if(listK.length > banMa.length){
      int count = listK.length - banMa.length;
      for(int i = 1; i <= count; i ++) {
        banMa.add(type == TypeCharset.normal ? "A" : Utf.instance.vietNameseCharsetByInt[0]!);
      }

    }

    if (isInvalidList(listK)) {
      isInvalid = true;
    }


    if (!isInvalid) {
      return null;
    } else {
      stt = List.generate(banMa.length, (index) => index + 1);
      var map = Map.fromIterables(listK, stt);
      listInverseOfK = List.generate(stt.length, (index) => map[index + 1]!);
      var mapBanMa = banMa.asMap();
      banRo = List.generate(banMa.length, (index) => mapBanMa[listInverseOfK[index] - 1]!);

    }
    String result = "";
      banRo.forEach((e) {
        result += e;
      });
    return {
        "banRo": banRo,
        "stt" : stt,
        "banMa": banMa,
        "listX": null,
        "listK": listK,
        "listInverseOfK" : listInverseOfK,
        "listY": null,
        "result": result,
      };
  }

  // tính nghịch đảo của một số
  int inverseOf(int a, int n) {
    if (ucln(a, n) == 1) {
      var x = [n, a];
      var b = [0, 1];
      List<int> y = [];
      while (x[x.length - 2] % x[x.length - 1] != 0) {
        y.add(x[x.length - 2] ~/ x[x.length - 1]);
        x.add(x[x.length - 2] % x[x.length - 1]);
        b.add(b[b.length - 2] - (b[b.length - 1] * y[y.length - 1]));
      }
      return b[b.length - 1] < 0 ? b[b.length - 1] + n : b[b.length - 1];
    }
    return 0;
  }

  //ƯỚC TRUNG LỚN NHẤT
  int ucln(int a, int b) {
    while (a * b != 0) {
      int r = a % b;
      a = b;
      b = r;
    }
    return a + b;
  }

  // kiểm tra xem danh sách có hợp lệ hay không
  bool isInvalidList(final List<int> root) {
    return root.every((e) {
          if (e < 0 || e > Z - 1)
            return false;
          else {
            return true;
          }
        }) ==
        true;
  }

  int detKOfMatrix(final List<List<int>> matrix) {
    // sử dụng ma trận 2 * 2
    return matrix[0][0] * matrix[1][1] - matrix[1][0] * matrix[0][1];
  }

  int levelOfMatrix(final List<List<int>> k) {
    var number = k[0].length;
    return k.every((element) => element.length == number) == true ? number : -1;
  }
}
