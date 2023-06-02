String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $age $name, you 're $country isn't it?";
}

void main() {
  sayHello(
    name: "tom",
    age: 15,
    country: "korean",
  );
}
