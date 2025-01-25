import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter()
      : router = GoRouter(
          routes: [
            GoRoute(
              path: AppRoutes.splash,
              name: 'splash',
              builder: (context, state) => const SplashScreen(),
            ),
            // shell route
            // ShellRoute(
            //   builder: (context, state, child) => MainScreen(child: child),
            //   pageBuilder: (context, state, child) =>
            //       _generatePageBuilder(MainScreen(child: child)),
            //   routes: [
            //     GoRoute(
            //       path: AppRoutes.home,
            //       name: RouteConstants.home,
            //       builder: (context, state) => const HomeScreen(),
            //       pageBuilder: (context, state) =>
            //           _generatePageBuilder(const HomeScreen()),
            //       routes: [
            //         GoRoute(
            //           path: AppRoutes.profile,
            //           name: RouteConstants.profile,
            //           builder: (context, state) => const ProfileScreen(),
            //         ),
            //       ],
            //     ),
            //     GoRoute(
            //       path: AppRoutes.patient,
            //       name: RouteConstants.patient,
            //       builder: (context, state) => const PatientScreen(),
            //       pageBuilder: (context, state) =>
            //           _generatePageBuilder(const PatientScreen()),
            //       routes: [
            //         GoRoute(
            //           path: AppRoutes.addPatient,
            //           name: RouteConstants.addPatient,
            //           builder: (context, state) => const AddPatientScreen(),
            //         ),
            //       ],
            //     ),
            //     GoRoute(
            //       path: AppRoutes.protocol,
            //       name: RouteConstants.protocol,
            //       builder: (context, state) => const ProtocolScreen(),
            //       pageBuilder: (context, state) =>
            //           _generatePageBuilder(const ProtocolScreen()),
            //     ),
            //   ],
            // ),
            // GoRoute(
            //   path: AppRoutes.login,
            //   name: RouteConstants.login,
            //   builder: (context, state) => const LoginScreen(),
            // ),
          ],
          errorBuilder: (context, state) => const ErrorScreen(),
        );

  static CustomTransitionPage<dynamic> _generatePageBuilder(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        final Animatable<double> tween = Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  final GoRouter router;
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    );
  }
}
