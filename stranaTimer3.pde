class Timer3 {
  int startTime;
  int interval;
  Timer3(int timeInterval) {
    interval = timeInterval;
  }
  void start() {
    startTime = millis();
  }
  boolean complete() {
    int elapsedTime = millis() - startTime;
    if (elapsedTime > interval) {
      return true;
    } else {
      return false;
    }
  }
}
