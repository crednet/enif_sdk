class SendChatModel {
  String? replyMode;
  Message? message;
  String? chatId;
  Message? reply;

  SendChatModel({this.replyMode, this.message, this.chatId, this.reply});

  SendChatModel.fromJson(Map<String, dynamic> json) {
    replyMode = json['replyMode'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    chatId = json['chatId'];
    reply = json['reply'] != null ? Message.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['replyMode'] = replyMode;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['chatId'] = chatId;
    if (reply != null) {
      data['reply'] = reply!.toJson();
    }
    return data;
  }
}

class Message {
  String? role;
  String? content;
  String? status;
  String? createdDate;
  String? sId;

  Message({this.role, this.content, this.status, this.createdDate, this.sId});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
    status = json['status'];
    createdDate = json['created_date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    data['status'] = status;
    data['created_date'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}
