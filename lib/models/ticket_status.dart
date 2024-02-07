class TicketStatus {
  final String? ticketid;
  final bool isRead;

  TicketStatus({this.ticketid, this.isRead = true});

  factory TicketStatus.fromJson(Map<String, dynamic> json) =>
      TicketStatus(isRead: json['read']);

  Map<String, dynamic> toJson() => {
        'read': isRead,
      };
}
