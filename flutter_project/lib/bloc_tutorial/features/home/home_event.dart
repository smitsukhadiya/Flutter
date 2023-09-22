part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedItem;

  HomeProductWishlistButtonClickedEvent({required this.clickedItem});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedItem;

  HomeProductCartButtonClickedEvent({required this.clickedItem});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
