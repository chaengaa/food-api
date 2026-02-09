// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
class CartState {
  List<Foods> foodlist;
  CartState({required this.foodlist});
}
