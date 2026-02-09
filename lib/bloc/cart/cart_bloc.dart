// ignore_for_file: depend_on_referenced_packages, avoid_types_as_parameter_names

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:foods_app/models/foods.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(foodlist: [])) {
    on<Addtocart>((event, emit) {
      // emit(CartState(foodlist: state.foodlist.add(event.items)));
      //{...} call spread operator
      emit(CartState(foodlist: [...state.foodlist, event.items]));
    });
    on<Increments>((event, emit) {
      state.foodlist[event.index].qty=
          state.foodlist[event.index].qty! + 1;
      emit(CartState(foodlist: state.foodlist));
    });
    on<Decrements>((event, emit) {
      state.foodlist[event.index].qty =
          state.foodlist[event.index].qty! - 1;
      emit(CartState(foodlist: state.foodlist));
    });
    on<RemoveItem>((event, emit) {
      final updateitem = List<Foods>.from(state.foodlist);
      updateitem.removeAt(event.index);
      emit(CartState(foodlist: updateitem));
    });
  }
}
