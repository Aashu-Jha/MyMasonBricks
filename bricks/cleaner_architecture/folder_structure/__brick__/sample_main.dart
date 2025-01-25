// This is the main file for the app
// You can either delete the main.dart file or replace it with this file and remove this file

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const EaseApp());
}

class EaseApp extends StatefulWidget {
  const EaseApp({super.key});

  @override
  State<EaseApp> createState() => _EaseAppState();
}

class _EaseAppState extends State<EaseApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      builder: (context, child) {
        return _ContentBuilder(child: child);
      },
      routerDelegate: _appRouter.router.routerDelegate,
      routeInformationParser: _appRouter.router.routeInformationParser,
      routeInformationProvider: _appRouter.router.routeInformationProvider,
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  const _ContentBuilder({
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehaviorModified(),
      child: child!,
    );
  }
}
