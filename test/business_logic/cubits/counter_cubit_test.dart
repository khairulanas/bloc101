import 'package:bloc101/logic/cubits/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test('initial state of countercubit is CounterState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        'bloc should emit a counterstate(countervalue:1,wasincremented:true) when cubit.increment() is called',
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: () => [CounterState(counterValue: 1, wasIncremented: true)]);

    blocTest(
        'bloc should emit a counterstate(countervalue:-1,wasincremented:false) when cubit.decrement() is called',
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: () => [CounterState(counterValue: -1, wasIncremented: false)]);
  });
}
