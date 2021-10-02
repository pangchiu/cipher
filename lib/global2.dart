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
      int phi = (p - 1) * (q - 1) ;
      int inverseOfE = Global.instance.inverseOf(e, n);
      int d = inverseOfE % phi;
      var map = sAM(x, e, n);
      map["phi"] = phi;
      map["n"] = n;
      map["keyPrivate"] = d;
      map["keyPublic"] = {"n" : n, "e" : e};
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
      int phi = (p - 1) * (q - 1) ;
      int inverseOfE = Global.instance.inverseOf(e, n);
      int d = inverseOfE % phi;
      var map = sAM(y, d, n);
      map["phi"] = phi;
      map["n"] = n;
      map["keyPrivate"] = d;
      map["keyPublic"] = {"n" : n, "e" : e};
      map["inverseOfE"] = inverseOfE;
      return map;
    }
    return null;
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
