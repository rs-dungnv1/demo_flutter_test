import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(child: MyApp()),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      routes: {
        BuyTicketScreen.routerName: (context) => const BuyTicketScreen(),
      },
      home: const BuyTicketScreen(),
    );
  }
}
