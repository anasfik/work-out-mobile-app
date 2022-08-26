class DelayHelper {
  DelayHelper({
    this.initialDelay = 300,
    this.differenceBetweenDelays = 100,
  });
  int initialDelay, differenceBetweenDelays;
  static int order = 0;
  Duration getDelayDuration() {
    return Duration(
      milliseconds: initialDelay + (differenceBetweenDelays * order++),
    );
  }
}
