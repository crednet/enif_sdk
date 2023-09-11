class SendChatModel {
  String? replyMode;
  Message? message;
  String? chatId;
  Message? reply;

  SendChatModel({this.replyMode, this.message, this.chatId, this.reply});

  SendChatModel.fromJson(Map<String, dynamic> json) {
    replyMode = json['replyMode'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    chatId = json['chatId'];
    reply = json['reply'] != null ? new Message.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replyMode'] = this.replyMode;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['chatId'] = this.chatId;
    if (this.reply != null) {
      data['reply'] = this.reply!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['content'] = this.content;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['_id'] = this.sId;
    return data;
  }
}