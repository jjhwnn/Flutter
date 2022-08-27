class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

main(List<String> args) {
  String result = '';

  AB ab = AB();
  result += ab.getMessage();

  BA ba = BA();
  result += ba.getMessage();

  print(result);
}
