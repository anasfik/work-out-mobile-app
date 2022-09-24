// after migrating all with the mixin, this will be deleted
class DelayHelper {
  DelayHelper({
    this.initialDelay = 300,
    this.differenceBetweenDelays = 100,
  });
  int initialDelay, differenceBetweenDelays;
  int order = 0;
  Duration getDelayDuration() {
    return Duration(
      milliseconds: initialDelay + (differenceBetweenDelays * order++),
    );
  }
}

mixin DelayHelperMixin {
  final int initialDelay = 300, differenceBetweenDelays = 100;
  int order = 0;
  Duration getDelayDuration() {
    order++;
    return Duration(
      milliseconds: initialDelay + (differenceBetweenDelays * order),
    );
  }
}
