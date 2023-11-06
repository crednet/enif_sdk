class SendChatModel {
  String? replyMode;
  List<Message>? message;
  String? ticketId;
  Message? reply;

  SendChatModel({this.replyMode, this.message, this.ticketId, this.reply});

  SendChatModel.fromJson(Map<String, dynamic> json) {
    replyMode = json['replyMode'];
    message = json['message'] != null
        ? List.of(json['message'])
            .map((json) => Message.fromJson(json))
            .toList()
        : [];
    ticketId = json['ticketId'];
    reply = json['reply'] != null ? Message.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['replyMode'] = replyMode;
    if (message != null) {
      data['message'] = message?.map((e) => e.toJson());
    }
    data['ticketId'] = ticketId;
    if (reply != null) {
      data['reply'] = reply!.toJson();
    }
    return data;
  }
}

class Message {
  final String? role;
  final String? content;
  final String? status;
  final DateTime? createdAt, updatedAt;
  final String? id;
  final String? ticketId;

  Message(
      {this.updatedAt,
      this.role,
      this.content,
      this.status,
      this.createdAt,
      this.id,
      this.ticketId});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      role: json['role'],
      content: json['content'],
      status: json['status'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      id: json['_id'] ?? json['id']);

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "ticketId": ticketId
      };

      @override
  String toString() => toJson().toString();
}
