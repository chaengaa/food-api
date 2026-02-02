// ignore_for_file: must_be_immutable

part of 'bottomnav_bloc.dart';

@immutable
class BottomNavEvent {}

class SelectedNav extends BottomNavEvent {
  int index;
  SelectedNav({required this.index});
}
