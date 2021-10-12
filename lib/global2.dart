import 'package:cipher/global.dart';

class Global2 {
  static Global2 instance = Global2._();

  Global2._();

  Map? encodeRSA(final int p, final int q, final int e, final int x) {
    bool isInvalid = false;

    if (isPrime(p) && isPrime(q) && isPrime(e)) {
      if ((p - 1) * (q - 1) > e) {
        isInvalid = true;
      }
    }

    if (isInvalid) {
      int n = p * q;
      int phi = (p - 1) * (q - 1);
      int inverseOfE = Global.instance.inverseOf(e, phi);
      int d = inverseOfE % phi;
      var map = sAM(x, e, n);
      map["phi"] = phi;
      map["n"] = n;
      map["keyPrivate"] = d;
      map["keyPublic"] = {"n": n, "e": e};
      map["inverseOfE"] = inverseOfE;
      return map;
    }
    return null;
  }

  Map? decodeRSA(final int p, final int q, final int e, final int y) {
    bool isInvalid = false;

    if (isPrime(p) && isPrime(q) && isPrime(e)) {
      if ((p - 1) * (q - 1) > e) {
        isInvalid = true;
      }
    }

    if (isInvalid) {
      int n = p * q;
      int phi = (p - 1) * (q - 1);
      int inverseOfE = Global.instance.inverseOf(e, phi);
      int d = inverseOfE % phi;
      var map = sAM(y, d, n);
      map["phi"] = phi;
      map["n"] = n;
      map["keyPrivate"] = d;
      map["keyPublic"] = {"n": n, "e": e};
      map["inverseOfE"] = inverseOfE;
      return map;
    }
    return null;
  }

  Map? encodeMHK(
      final List<int> S, final int p, final int a, final List<int> listX) {
    bool isInvalid = false;

    int y = 0;
    late List<int> listT;

    if (isInputInvaild(S, p, a)) {
      isInvalid = true;
    }
    if (!isInvalid) {
      return null;
    } else {
      // điều chỉnh độ dài bản rõ
      if (listX.length > S.length) {
        int count = listX.length - S.length;
        while (count != 0) {
          listX.removeLast();
          count--;
        }
      } else if (listX.length < S.length) {
        listX.insert(0, 0);
      }

      listT = List.generate(S.length, (index) => (S[index] * a) % p);

      for (int i = 0; i < S.length; i++) {
        y += listT[i] * listX[i];
      }
      return {
        "y": y,
        "listT": listT,
        "listX": listX,
        "C" : null,
      };
    }
  }

  Map? decodeMHK(
      final List<int> S, final int p, final int a, final int y) {
    bool isInvalid = false;

    late List<int> listX;
    late int C;


    if (isInputInvaild(S, p, a)) {
      isInvalid = true;
    }
    if (!isInvalid) {
      return null;
    } else {
      C = Global.instance.inverseOf(a, p) * y % p;
      int cloneC = C;
     

     listX = List.generate(S.length, (index) {
       if(S[S.length - 1 - index] > cloneC) return 0;
       else {
         int r = cloneC ~/ S[S.length - 1 - index];
         cloneC %= S[S.length - 1 - index];
         return r;
       }
     });

     return {
        "y": y,
        "listT": null,
        "listX": listX,
        "C" : C,
      };
    }
  }

  bool isInputInvaild(List<int> arr, int p, int a) {
    int sum = 0;
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] < sum)
        return false;
      else {
        sum += arr[i];
      }
    }
    if (sum >= p) return false;

    if (Global.instance.ucln(p, a) != 1) return false;

    return true;
  }

  bool isPrime(int n) {
    if (n <= 3) {
      return n > 1;
    } else if (n % 2 == 0 || n % 3 == 0) {
      return false;
    }

    int i = 5;
    while (i * i <= n) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
      i = i + 6;
    }

    return true;
  }

  Map<String, dynamic> sAM(final int a, final int x, final int n) {
    List<int> ds = [1];
    List<int> xs = [x];
    List<int> as = [a];
    while (xs.last != 0) {
      if (xs.last % 2 != 0) {
        ds.add((ds.last * as.last) % n);
      } else {
        ds.add(ds.last);
      }
      xs.add(xs.last ~/ 2);
      as.add((as.last * as.last) % n);
    }
    // xóa phần tử cuối lúc xs.last = 0
    xs.removeLast();
    as.removeLast();
    // xóa phần tử đầu cúa ds vì lúc đầu  mặc định ds.fist = 1
    ds.removeAt(0);

    return {
      "ds": ds,
      "xs": xs,
      "as": as,
    };
  }
}
