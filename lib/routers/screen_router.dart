import 'package:app_timekeeping/ui/features/bottom/bottom_custom.dart';
import 'package:app_timekeeping/ui/features/home/home_screen.dart';
import 'package:app_timekeeping/ui/features/login/login_screen.dart';
import 'package:app_timekeeping/ui/features/timekeeping/timekeeping_screen.dart';
import 'package:go_router/go_router.dart';

class ScreenRouter {
  static GoRouter router(String initialPath) {
    return GoRouter(
      initialLocation: initialPath,

      routes: [
        GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/bottom', builder: (context, state) => BottomCustom()),
        GoRoute(
          path: '/timekeeping',
          builder: (context, state) => TimekeepingScreen(),
        ),
      ],
    );
  }
}
