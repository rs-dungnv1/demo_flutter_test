import 'package:demo_flutter_test/screens/buy_ticket/models/entries_model.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/persion_quatity_model.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_ticket_state.freezed.dart';

@freezed
class BuyTicketState with _$BuyTicketState {
  factory BuyTicketState({
    @Default(false) bool enableButton,
    @Default(0) int cartItemCount,
    @Default(2) int adults,
    @Default(0) int childs,
    @Default(0) int olders,
    @Default(true) bool haveAdult,
    @Default(true) bool haveChild,
    @Default(true) bool haveSenior,
    @Default(false) bool setShowText,
    @Default(<Ticket>[]) List<Ticket> listTicket,
    @Default(PersonQuatityModel(adults: 2, childs: 0, olders: 0))
        PersonQuatityModel personQuatity,
    @Default(2) int totalAmount,
    @Default(<EntriesModel>[]) List<EntriesModel> listEntriesModel,
    @Default(false) bool showShimmer,
    @Default(false) bool showLoadingIndicator,
  }) = _BuyTicketState;
}
