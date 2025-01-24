void main() {
  String name = "John";
  print(name);

  // Nullable variable (can hold null)
  String? nickname;
  print(nickname);

  // Assigning a value to nullable variable
  nickname = "Johnny";
  print(nickname);

  // Null check using `if`
  if (nickname != null) {
    print("Nickname length: ${nickname.length}");
  }

  // Using null-aware operator `?.`
  print("Nickname length (null-aware): ${nickname?.length}");

  // Using null-coalescing operator `??`
  String displayName = nickname ?? "Default Name";
  print("Display Name: $displayName");

  // Null assertion operator `!`
  print("Nickname length: ${nickname!.length}");

  // Function with nullable parameter
  greetUser(null);
}

void greetUser(String? name) {
  String greeting = "Hello, ${name ?? "Guest"}!";
  print(greeting);
}
