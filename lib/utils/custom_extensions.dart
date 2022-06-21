extension NumberExtensions on int {
  String toPriceString([String separator = ",", int divide = 1000]) {
    int num = this;
    List<int> parts = [];
    do {
      // if (value.isNotEmpty) value += ",";
      parts.add(num % divide);
      num = num ~/ divide;
      print(num.toString() + " - " + parts.toString());
    } while ((num / divide) > 0);

    return parts.reversed.join(separator);
  }
}
