extension ListUtils<E> on List<E> {
  List<E> copyWith(E element) => List.from(this)..add(element);

  void replace(E element, E replacement) {
    var found = false;
    final len = length;
    for (var i = 0; i < len; i++) {
      if (element == this[i]) {
        this[i] = replacement;
        found = true;
      }
    }
    if (!found)
      throw 'Replace is not success. Because can not find element in list';
  }

  void addIfNotNull(E? value) {
    if (value != null) {
      add(value);
    }
  }

  E? getFirstElement() {
    if (this != null) {
      if (length > 0)
        return this[0];
      else
        return null;
    } else
      return null;
  }

  E? getLastElement() {
    if (this != null) {
      if (length > 0)
        return this[length];
      else
        return null;
    } else
      return null;
  }
}
