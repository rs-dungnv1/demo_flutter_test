class PriceTicketModel {
  PriceTicketModel({
    this.soldQuantity,
    this.aTicketItemResponses,
    this.aTicketComboResponses,
  });
  int? soldQuantity;
  List<Map<String, dynamic>>? aTicketItemResponses;
  List<Map<String, dynamic>>? aTicketComboResponses;

  PriceTicketModel.fromJson(Map<String, dynamic> json) {
    soldQuantity = json['soldQuantity'];
    aTicketItemResponses =
        (json['vinWonderTicketItemResponses'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList();
    aTicketComboResponses =
        (json['vinWonderTicketComboResponses'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList();
  }
}
