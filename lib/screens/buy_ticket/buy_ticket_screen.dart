import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state.dart';
import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state_notifier.dart';
import 'package:demo_flutter_test/screens/buy_ticket/component/bottom_button.dart';
import 'package:demo_flutter_test/screens/buy_ticket/component/buy_ticket_pick_amount.dart';
import 'package:demo_flutter_test/screens/buy_ticket/component/entries_item.dart';
import 'package:demo_flutter_test/screens/list_ticket/list_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyTicketScreen extends ConsumerWidget {
  const BuyTicketScreen({super.key});
  static const routerName = '/buyTicketScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buyTicketProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup ticket Page'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const _Body(),
            ),
          ),
          state.showLoadingIndicator
              ? const CircularProgressIndicator()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(buyTicketProvider);
    final stateNotifier = ref.read(buyTicketProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          _buildLine(),
          BuyTicketPickAmount(
            title: 'Adult',
            description: 'from 13 to 60 years old',
            amount: state.adults,
            onTapIncrement: () =>
                stateNotifier.updateAmount(adults: state.adults + 1),
            onTapDecrement: () =>
                stateNotifier.updateAmount(adults: state.adults - 1),
          ),
          _buildLine(),
          BuyTicketPickAmount(
            title: 'Children',
            description: ' less 13 years old ',
            amount: state.childs,
            onTapIncrement: () =>
                stateNotifier.updateAmount(childs: state.childs + 1),
            onTapDecrement: () =>
                stateNotifier.updateAmount(childs: state.childs - 1),
          ),
          state.haveChild ? _buildLine() : const SizedBox(),
          state.haveSenior
              ? BuyTicketPickAmount(
                  title: 'Elders',
                  description: 'Over age 60',
                  amount: state.olders,
                  onTapIncrement: () =>
                      stateNotifier.updateAmount(olders: state.olders + 1),
                  onTapDecrement: () =>
                      stateNotifier.updateAmount(olders: state.olders - 1),
                )
              : const SizedBox(),
          state.haveSenior ? _buildLine() : const SizedBox(),
          const SizedBox(height: 16),
          buildButton(),
          BuyTicketButton(
            buttonKey: const Key('button1'),
            label: 'Get list entries',
            ontap: () {
              stateNotifier.setloading();
            },
          ),
          if (state.listEntriesModel.isNotEmpty)
            ItemEntries(
              entriesModel: state.listEntriesModel[0],
            ),
          if (state.setShowText) const Text('1'),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      color: Colors.grey,
      height: 1,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget buildButton() {
    final state = ref.watch(buyTicketProvider);
    final stateNotifier = ref.read(buyTicketProvider.notifier);

    return BuyTicketButton(
      label: "Get list Ticket",
      ontap: (state.totalAmount > 0)
          ? () {
              _buildTicket(state, stateNotifier);
            }
          : null,
    );
  }

  void _buildTicket(
    BuyTicketState state,
    BuyTicketStateNotifier stateNotifier,
  ) {
    stateNotifier.sortTicket();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListItemScreen()),
    );
  }
}
