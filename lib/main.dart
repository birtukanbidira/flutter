import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/theme/app_theme.dart';
import 'features/marketplace/presentation/bloc/marketplace_bloc.dart';
import 'features/marketplace/presentation/bloc/marketplace_event.dart';
import 'features/marketplace/presentation/pages/marketplace_page.dart';

void main() {
  final dependencies = DependencyInjection.create();
  runApp(MarketplaceApp(dependencies: dependencies));
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key, required this.dependencies});

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace Landing',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: BlocProvider(
        create: (_) => dependencies.createMarketplaceBloc()
          ..add(const MarketplaceRequested()),
        child: const MarketplacePage(),
      ),
    );
  }
}
