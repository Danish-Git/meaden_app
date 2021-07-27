//import 'package:bloc/bloc.dart';
enum PageChange {increment, decrement}

//class Bloc_main extends Bloc<PageChange, int> {
//  Bloc_main(int initialState) : super(initialState);
//
//  int get initakState => 1;
//
//  @override
//  Stream<int> mapEventToState(PageChange event) async* {
//    // TODO: implement mapEventToState
//    switch (event) {
//      case PageChange.increment:
//        yield state + 1;
//        break;
//      case PageChange.decrement:
//        yield state -1;
//        break;
//    }
//
//    throw UnimplementedError();
//  }
//
//}