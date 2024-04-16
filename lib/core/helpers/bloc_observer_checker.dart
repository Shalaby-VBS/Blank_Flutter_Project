import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverChecker extends BlocObserver {
  const BlocObserverChecker();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('🟢BlocCreated: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
        '🔵BlocChanged: ${bloc.runtimeType}, $change'.replaceAll('\n', ''));
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('🔴BlocError: ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('🚫BlocClosed: ${bloc.runtimeType}');
  }
}
