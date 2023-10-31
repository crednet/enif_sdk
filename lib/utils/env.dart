sealed class Env {
  const Env._();

  String get baseUrl;

  static const dev = _Dev();
  static const prod = _Prod();
}

class _Dev extends Env {
  const _Dev() : super._();

  @override
  String get baseUrl => 'https://test.enif.ai';
}

class _Prod extends Env {
  const _Prod() : super._();

  @override
  String get baseUrl => 'https://api.enif.ai';
}
