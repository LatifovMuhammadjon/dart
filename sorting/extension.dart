extension on Map {
  V getOrDefault<K, V>(K key, V value) {
    if (!this.entries.contains(key)) {
      this[key] = value;
    }
    return this[key];
  }
}
