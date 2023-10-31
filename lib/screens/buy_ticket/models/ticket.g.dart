// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      aId: json['aId'] as String?,
      ticketName: json['ticketName'] as String?,
      aTicketItemResponses: (json['aTicketItemResponses'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      aTicketComboResponses: (json['aTicketComboResponses'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'aId': instance.aId,
      'ticketName': instance.ticketName,
      'aTicketItemResponses': instance.aTicketItemResponses,
      'aTicketComboResponses': instance.aTicketComboResponses,
    };
