import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 1);
    });
  }

  //状态的变化
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  //记录变化前的状态、事件、变化后的状态
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }
}

class SimpleBlocObs extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('BlocObserver  ${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {}

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print('BlocObserver ${bloc.runtimeType} $transition');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    print('BlocObserver ${bloc.runtimeType} $event');
  }
}

// Future<void> main() async {

//    使用1
//   final bloc = CounterBloc();
//   print(bloc.state);
//   bloc.add(CounterIncrementPressed());
//   await Future.delayed(Duration.zero);
//   print(bloc.state);
//   await bloc.close();

//   使用2
// CounterBloc()
// ..add(CounterIncrementPressed())
// ..close();

//  使用3
//  Bloc.observer = SimpleBlocObs();
//   CounterBloc()
//     ..add(CounterIncrementPressed())
//     ..close();

// }
