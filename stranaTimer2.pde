class Timer2 {
  int startTime;
  int interval;
  Timer2(int timeInterval) {
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
