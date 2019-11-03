import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement, x2, reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.reset:
        yield state * 0;
        break;
      case CounterEvent.x2:
        yield state * 2;
        break;
    }
  }
}
