class Utility {
  static String parseName(String name, int maxLength) {
    var splited = name.split(' ');
    var base = '';

    var temp = stringListSanitize(splited);

    if (temp.isNotEmpty) {
      if (maxLength <= temp.length) {
        for (var i = 0; i < maxLength; i++) {
          base += temp[i][0];
        }
      } else {
        for (var i = 0; i < temp.length; i++) {
          base += temp[i][0];
        }
      }
    }
    return base;
  }
}

List<String> stringListSanitize(List<String> list) {
  List<String> temp = [];

  for (int x = 0; x < list.length; x++) {
    var value = list[x].trim();
    if (value.isNotEmpty) {
      temp.add(value);
    }
  }
  return temp;
}
