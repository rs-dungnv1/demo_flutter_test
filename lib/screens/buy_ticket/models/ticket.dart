import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  factory Ticket({
    String? aId,
    String? ticketName,
    List<Map<String, dynamic>>? aTicketItemResponses,
    List<Map<String, dynamic>>? aTicketComboResponses,
  }) = _Ticket;
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

final listTicketDemo = [
  Ticket(
    aId: "01",
    ticketName: "vé 1 ",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 490000.0,
        "salePrice": 430000.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 650000.0,
        "salePrice": 500000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 490000.0,
        "salePrice": 430000.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "02",
    ticketName: "vé 2",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 490000.0,
        "salePrice": 431200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 650000.0,
        "salePrice": 572000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 490000.0,
        "salePrice": 431200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "03",
    ticketName: "vé 3",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 490000.0,
        "salePrice": 420000.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 650000.0,
        "salePrice": 510000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 490000.0,
        "salePrice": 400000.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "04",
    ticketName: "vé 4",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 490000.0,
        "salePrice": 331200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 650000.0,
        "salePrice": 472000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 490000.0,
        "salePrice": 331200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "05",
    ticketName: "vé 5",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 690000.0,
        "salePrice": 531200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 750000.0,
        "salePrice": 672000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 690000.0,
        "salePrice": 531200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé 6",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 190000.0,
        "salePrice": 131200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 250000.0,
        "salePrice": 272000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 190000.0,
        "salePrice": 131200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé 7",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 390000.0,
        "salePrice": 331200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 750000.0,
        "salePrice": 572000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 390000.0,
        "salePrice": 331200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé 8",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 690000.0,
        "salePrice": 631200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 650000.0,
        "salePrice": 572000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 790000.0,
        "salePrice": 731200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé 9",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 890000.0,
        "salePrice": 831200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 850000.0,
        "salePrice": 872000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 890000.0,
        "salePrice": 831200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé 10",
    aTicketItemResponses: [
      {
        "aId": "aed9158e-69f7-40d4-baf5-daf35f9bbeba",
        "originalPrice": 790000.0,
        "salePrice": 731200.0,
        "objectTypeCode": "TE",
        "objectTypeName": "Trẻ Em",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "ae5ee82d-2153-47a9-875b-5eee56714953",
        "originalPrice": 750000.0,
        "salePrice": 772000.0,
        "objectTypeCode": "NL",
        "objectTypeName": "Người lớn",
        "minQuantity": 1,
        "maxQuantity": 0,
      },
      {
        "aId": "86373ca7-4e95-4c72-8dab-ca41640eda4c",
        "originalPrice": 790000.0,
        "salePrice": 731200.0,
        "objectTypeCode": "NCT",
        "objectTypeName": "Người cao tuổi",
        "minQuantity": 1,
        "maxQuantity": 0,
      }
    ],
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 1 ",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 3810000.0,
        "salePrice": 3810000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 1,
        "adultQuantity": 2,
        "childQuantity": 1,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2110000.0,
        "salePrice": 2010000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 2,
        "adultQuantity": 2,
        "childQuantity": 2,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 2",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2810000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 3,
        "adultQuantity": 4,
        "childQuantity": 3,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 3",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2710000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 2,
        "adultQuantity": 4,
        "childQuantity": 6,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 4 ",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2510000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 4,
        "adultQuantity": 2,
        "childQuantity": 2,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 5",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2310000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 1,
        "adultQuantity": 2,
        "childQuantity": 1,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 6",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2910000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 3,
        "adultQuantity": 6,
        "childQuantity": 3,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 7",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2210000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 2,
        "adultQuantity": 4,
        "childQuantity": 0,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 8",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2710000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 4,
        "adultQuantity": 2,
        "childQuantity": 0,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "Vé Combo 9",
    aTicketItemResponses: null,
    aTicketComboResponses: [
      {
        "aId": "d2273296-141f-41a0-968f-7d2018ef29e4",
        "vinWonderComboName": "[FAMILY COMBO 1]",
        "originalPrice": 2810000.0,
        "salePrice": 2510000.0,
        "minQuantity": 1,
        "maxQuantity": 0,
        "comboQuantity": 1,
        "adultQuantity": 2,
        "childQuantity": 0,
        "seniorQuantity": 0
      }
    ],
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "vé vào cổng no3",
    aTicketItemResponses: null,
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "vé vào cổng ",
    aTicketItemResponses: null,
    aTicketComboResponses: null,
  ),
  Ticket(
    aId: "d2273296-141f-41a0-968f-7d2018ef29e4",
    ticketName: "vé vào cổng no2",
    aTicketItemResponses: null,
    aTicketComboResponses: null,
  )
];
