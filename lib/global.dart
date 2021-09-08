class Global {
  static const int Z = 26;
  static Global instance = Global._();

  Global._();

  // mã hóa dịch vòng
  String encodeShift(final String myString, final int key) {
    bool isInvalid = false;
    String result = "";
    var root = myString.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot =
          List.generate(root.length, (index) => (root[index] + key) % Z + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // giải mã dịch vòng
  String decodeShift(final String myString, final int key) {
    bool isInvalid = false;
    String result = "";
    var root = myString.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot =
          List.generate(root.length, (index) => (root[index] - key) % Z + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // mã hóa vingen
  String encodeVingen(final String str, final String k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    var key = k.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root) && isInvalidList(key)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot = List.generate(root.length, (index) {
        if (index > k.length - 1) {
          if ((key.length - 1) % index == 0) {
            return (root[index] + key[key.length - 1]) % Z + 65;
          } else {
            return (root[index] + key[(key.length - 1) % index - 1]) % Z + 65;
          }
        } else {
          return (root[index] + key[index]) % Z + 65;
        }
      });
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // giải mã vingen
  String decodeVingen(final String str, final String k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    var key = k.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root) && isInvalidList(key)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot = List.generate(root.length, (index) {
        if (index > k.length - 1) {
          if ((key.length - 1) % index == 0) {
            return (root[index] - key[key.length - 1]) % Z + 65;
          } else {
            return (root[index] - key[(key.length - 1) % index - 1]) % Z + 65;
          }
        } else {
          return (root[index] - key[index]) % Z + 65;
        }
      });
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // mã hóa affine
  String encodeAffine(final String str, final Map<String, int> k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();

    // kiểm tra k có null hay không
    if (k["a"] != null && k["b"] != null) {
      if (isInvalidList(root) && ucln(Z, k["a"]!) == 1) {
        isInvalid = true;
      }
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot = List.generate(
          root.length, (index) => (root[index] * k["a"]! + k["b"]!) % Z + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // giải mã affine
  String decodeAffine(final String str, final Map<String, int> k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();

    // kiểm tra k có null hay không
    if (k["a"] != null && k["b"] != null) {
      if (isInvalidList(root) && ucln(Z, k["a"]!) == 1) {
        isInvalid = true;
      }
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newRoot = List.generate(
          root.length,
          (index) =>
              ((root[index] - k["b"]!) * inverseOf(k["a"]!, Z)) % Z + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // mã hóa hill
  String encodeHill(final String str, final List<List<int>> k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();

    int detK = detKOfMatrix(k);
    if (ucln(detK, Z) == 1 &&
        isInvalidList(root) &&
        levelOfMatrix(k) == 2 &&
        root.length % levelOfMatrix(k) == 0 &&
        inverseOf(detK, Z) != 0) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      int n = 0;
      List<int> newRoot = [];
      while (n * 2 <= root.length - 1) {
        newRoot
            .add((root[n * 2] * k[0][0] + root[n * 2 + 1] * k[1][0]) % Z + 65);
        newRoot
            .add((root[n * 2] * k[0][1] + root[n * 2 + 1] * k[1][1]) % Z + 65);
        n++;
      }
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // giải mã hill
  String decodeHill(final String str, final List<List<int>> k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();

    int detK = detKOfMatrix(k);
    if (ucln(detK, Z) == 1 &&
        isInvalidList(root) &&
        levelOfMatrix(k) == 2 &&
        root.length % levelOfMatrix(k) == 0 &&
        inverseOf(detK, Z) != 0) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
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
      List<int> newRoot = [];
      while (n * 2 <= root.length - 1) {
        newRoot.add((root[n * 2] * inverseOfK[0][0] +
                    root[n * 2 + 1] * inverseOfK[1][0]) %
                Z +
            65);
        newRoot.add((root[n * 2] * inverseOfK[0][1] +
                    root[n * 2 + 1] * inverseOfK[1][1]) %
                Z +
            65);
        n++;
      }
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // mã hóa autogenesis
  String encodeAutogenesis(final String myString, final int key) {
    bool isInvalid = false;
    String result = "";
    var root = myString.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var z = [key, ...root.sublist(0, root.length)];

      var newRoot = List.generate(
          root.length, (index) => (root[index] + z[index]) % Z + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  //giải mã autogenesis
  String decodeAutogenesis(final String myString, final int key) {
    bool isInvalid = false;
    String result = "";
    var root = myString.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var z = [key];

      var newRoot = List.generate(root.length, (index) {
        var d = (root[index] - z[z.length - 1]) % Z;
        z.add(d);
        return d;
      }).map((e) => e + 65).toList();
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  // mã hóa permutation
  String encodePermutation(final String str, final String k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    var key = k.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root) && isInvalidList(key)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ";
    } else {
      var newkey = key
          .asMap()
          .entries
          .map((e) => {"key": e.key, "value": e.value})
          .toList();
      newkey.sort((a, b) => a["value"]!.compareTo(b["value"]!));
      var newRoot =
          List.generate(root.length, (index) => root[newkey[index]["key"]!] + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
  }

  //giải mã permutation
  String decodePermutation(final String str, final String k) {
    bool isInvalid = false;
    String result = "";
    var root = str.toUpperCase().codeUnits.map((e) => e - 65).toList();
    var key = k.toUpperCase().codeUnits.map((e) => e - 65).toList();

    if (isInvalidList(root) && isInvalidList(key)) {
      isInvalid = true;
    }

    if (!isInvalid) {
      return "không hợp lệ"; 
    } else {
      // so sánh đoạn mã 
      var newkey = [...key]..sort((a,b) => a.compareTo(b));
   
      var h = List.generate(key.length, (index) {
        int pos = newkey.indexOf(key[index]);
        newkey[pos] = -1;
        return pos;
      });
    
      var newRoot =
          List.generate(root.length, (index) => root[h[index]] + 65);
      result = String.fromCharCodes(newRoot);
      return result;
    }
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
          if (e < 0 || e > 25)
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
