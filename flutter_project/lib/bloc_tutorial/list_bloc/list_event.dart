part of 'list_bloc.dart';

@immutable
abstract class ListEvent {}

class InitialEvent extends ListEvent {}

class ListAddEvent extends ListEvent {}
