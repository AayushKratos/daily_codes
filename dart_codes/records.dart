void main() {
  var person = ('John', 30);
  print("Name: ${person.$1}, Age: ${person.$2}");

  var address = (city: 'New York', zip: 10001);
  print("City: ${address.city}, ZIP: ${address.zip}");

  var mixedRecord = ('Alice', age: 25, 'Engineer');
  print(
      "Name: ${mixedRecord.$1}, Age: ${mixedRecord.age}, Profession: ${mixedRecord.$2}");

  var (name, age) = ('Emily', 22);
  print("Destructured Name: $name, Age: $age");

  var (city: cityName, zip: postalCode) = (city: 'San Francisco', zip: 94105);
  print("Destructured City: $cityName, ZIP: $postalCode");

  var userInfo = getUserInfo();
  print(
      "User Info - Name: ${userInfo.name}, Age: ${userInfo.age}, Country: ${userInfo.country}");
}

({String name, int age, String country}) getUserInfo() {
  return (name: 'Michael', age: 35, country: 'USA');
}
