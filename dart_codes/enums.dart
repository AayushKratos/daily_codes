enum TrafficLight {
  red,
  yellow,
  green,
}

void main() {
  var currentLight = TrafficLight.green;

  switch (currentLight) {
    case TrafficLight.red:
      print("Stop!");
      break;
    case TrafficLight.yellow:
      print("Get ready!");
      break;
    case TrafficLight.green:
      print("Go!");
      break;
  }
}
