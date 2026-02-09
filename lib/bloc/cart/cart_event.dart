// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
class CartEvent {}

class Addtocart extends CartEvent{
  int count;
  Foods items;
  Addtocart({required this.items, required this.count});
}
class Increments extends CartEvent {
  int index;
  Increments({required this.index});
}

class Decrements extends CartEvent {
  int index;
  Decrements({required this.index});
}

class RemoveItem extends CartEvent {
  int index;
  RemoveItem({required this.index});
}

