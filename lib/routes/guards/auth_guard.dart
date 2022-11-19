import 'package:auto_route/auto_route.dart';
import 'package:bond/features/app/data/auth_local_data_source.dart';
import 'package:bond/routes/app_router.dart';
import 'package:one_studio_core/core.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (sl<AuthLocalDataSource>().hasToken) {
      resolver.next(true);
    } else {
      final result = await router.push(const LoginRoute()) as bool;
      resolver.next(result);
    }
  }
}
