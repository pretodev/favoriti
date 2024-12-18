typedef JsonList = List<JsonData>;
typedef JsonData = Map<String, dynamic>;

abstract interface class Mapper<From, To> {
  To map(From from);

  static Iterable<To> it<From, To>(
    Iterable<From> entities,
    Mapper<From, To> converter,
  ) {
    return entities.map<To>(converter.map);
  }
}

extension EnumExtension<T extends Enum> on List<T> {
  T fromString(String v) {
    for (var value in this) {
      if (value.name == v) {
        return value;
      }
    }
    throw ArgumentError('Invalid value: $v');
  }

  T? fromStringOrNull(String v) {
    for (var value in this) {
      if (value.name == v) {
        return value;
      }
    }
    return null;
  }
}
