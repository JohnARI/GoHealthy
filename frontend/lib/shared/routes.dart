class Route {
  final String name;
  final String path;

  const Route({
    required this.name,
    required this.path,
  });
}

class AppRoute {
  static const Route HOME = Route(
    name: 'home',
    path: '/home',
  );

  static const Route LOGIN = Route(
    name: 'login',
    path: '/login',
  );

  static const Route REGISTER = Route(
    name: 'register',
    path: '/register',
  );
}
