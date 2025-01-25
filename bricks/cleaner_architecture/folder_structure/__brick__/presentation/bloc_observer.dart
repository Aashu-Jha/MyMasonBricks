import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver with AppLogger {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.info('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.info('Bloc Changed: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log.info('Event Added: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.severe('Bloc Error: ${bloc.runtimeType}, Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.info('Bloc Closed: ${bloc.runtimeType}');
  }
}
