Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2)); // simulate network delay
  return 'John Doe';
}
