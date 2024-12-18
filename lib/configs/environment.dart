class Environment {
  final String apiBaseUrl;

  Environment._({
    required this.apiBaseUrl,
  });

  factory Environment.initialize() {
    return Environment._(
      apiBaseUrl: const String.fromEnvironment('API_BASE_URL'),
    );
  }
}
