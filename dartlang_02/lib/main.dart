void something(Function(int i) f) {
  f(10);
}

void main() {
  something((value) {
    print(value);
  });
}
