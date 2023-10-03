enum AppRoutes {
  splash('/'),
  login('login'),
  register('register'),
  home('/home'),
  ;

  const AppRoutes(this.value);
  final String value;

  String get path => "/$value";
}
