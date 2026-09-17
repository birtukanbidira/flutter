import 'package:equatable/equatable.dart';

abstract class MarketplaceEvent extends Equatable {
  const MarketplaceEvent();

  @override
  List<Object?> get props => [];
}

class MarketplaceRequested extends MarketplaceEvent {
  const MarketplaceRequested();
}

class MarketplaceCategorySelected extends MarketplaceEvent {
  const MarketplaceCategorySelected(this.category);

  final String category;

  @override
  List<Object?> get props => [category];
}

class MarketplaceSearchChanged extends MarketplaceEvent {
  const MarketplaceSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class MarketplaceCookieAccepted extends MarketplaceEvent {
  const MarketplaceCookieAccepted();
}

class MarketplaceCookieDismissed extends MarketplaceEvent {
  const MarketplaceCookieDismissed();
}
