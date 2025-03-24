Stream<int> counterStream() async* {
  int i = 0;
  while (true) {
    await Future.delayed(Duration(seconds: 2));
    yield i++;
  }
}
