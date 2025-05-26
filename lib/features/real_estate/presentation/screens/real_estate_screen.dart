// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:app_ui/app_ui.dart'; // Assure-toi que ce package est bien dans tes dépendances

class AdaptiveRealEstateScreen extends StatelessWidget {
  const AdaptiveRealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePlatformUI.scaffold(
      // Tu peux ajouter un AppBar ici si tu veux qu'il soit géré par AdaptivePlatformUI
      // appBar: AdaptivePlatformUI.appBar(context: context, title: 'RealEstate Screen'),
      body: const _RealEstateScreenBody(),
    );
  }
}

class _RealEstateScreenBody extends ConsumerWidget {
  const _RealEstateScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ici, tu peux surveiller tes providers Riverpod.
    // Exemple : final someData = ref.watch(someProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenue sur l\'écran RealEstate!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          // Tu peux ajouter des éléments interactifs ici qui utilisent `ref`
          // Par exemple, un bouton qui interagit avec un provider :
          // ElevatedButton(
          //   onPressed: () {
          //     ref.read(someProvider.notifier).doSomething();
          //   },
          //   child: const Text('Faire quelque chose'),
          // ),
        ],
      ),
    );
  }
}