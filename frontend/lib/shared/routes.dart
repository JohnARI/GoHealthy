class Route {
  final String name;
  final String path;

  const Route({
    required this.name,
    required this.path,
  });
}

class AppRoute {
  static const Route REGISTER = Route(
    name: 'register',
    path: '/register',
  );

  static const Route LOGIN = Route(
    name: 'login',
    path: '/login',
  );

  static const Route HOME = Route(
    name: 'home',
    path: '/home',
  );

  static const Route STATS = Route(
    name: 'settings',
    path: '/settings',
  );

  static const Route PROFILE = Route(
    name: 'profile',
    path: '/profile',
  );

  static const Route ADD_MEAL = Route(
    name: 'breakfast',
    path: '/followup/:mealType',
  );
}