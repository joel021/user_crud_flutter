class MainState {
  int count = 0;
  String message = "Start message";

  void counter() {
    count += 1;

    if (count > 10) {
      message = "You reached 10 counts!";
    }
  }
}
