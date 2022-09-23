
extension ElseMethodExtension<E> on Set<E> {

  void addIfRemoveElse(E item, dynamic condition, {bool removeElse = false}) {
    if (condition is bool && condition) {
      add(item);
    } else if (removeElse) {
      remove(item);
    }
  }
}
