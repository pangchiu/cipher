class Utf {
  Map<String, int>? _vietNameseCharsetByString;
  Map<int, String>? _vietNameseCharsetByInt;

  Utf._();
  static Utf instance = Utf._();
  Map<String, int> get vietNameseCharsetByString {
    if (_vietNameseCharsetByInt != null) {
      return _vietNameseCharsetByString!;
    } else {
      inItVietNamese();
      return _vietNameseCharsetByString!;
    }
  }
// tao vừa thêm mà không được
  Map<int, String> get vietNameseCharsetByInt {
    if (_vietNameseCharsetByString != null) {
      return _vietNameseCharsetByInt!;
    } else {
      inItVietNamese();
      return _vietNameseCharsetByInt!;
    }
  }

  void inItVietNamese() {
    List<String> list = [" "];
    for (int i = 65; i <= 90; i++) {
      list.add(String.fromCharCode(i));
    }

    int listLenght = list.length;
    for (int i = 0; i < listLenght; i++) {
      list.add(list[i].toLowerCase());
    }

    String sub = "ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝ";
    for (int i = 0; i < sub.length; i++) {
      list.add(sub[i]);
    }

    for (int i = 0; i < sub.length; i++) {
      list.add(sub[i].toLowerCase());
    }

    list.add("Đ");
    list.add("đ");

    for (int i = 7840; i <= 7929; i++) {
      list.add(String.fromCharCode(i));
    }
    _vietNameseCharsetByString =
        list.asMap().map((key, value) => MapEntry(value, key));
    _vietNameseCharsetByInt = list.asMap();
  }
}
