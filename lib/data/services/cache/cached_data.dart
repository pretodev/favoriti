class CachedData<T extends Object> {
  CachedData({
    required this.value,
    required this.expireAt,
  });

  final T value;
  final DateTime expireAt;
}
