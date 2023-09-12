class ChatSession {
  String? chatId;
  String? email;
  String? businessId;
  String? customer;
  String? phoneNo;
  List<MessagesData>? messages;
  bool? escalated;
  String? sentiment;
  String? channel;
  String? category;
  String? type;
  String? department;
  String? escalationDepartment;
  List<MessagesData>? titles;
  bool? isCompleted;
  String? createdDate;
  String? updateDate;
  String? id;

  ChatSession(
      {this.chatId,
      this.email,
      this.businessId,
      this.customer,
      this.phoneNo,
      this.messages,
      this.escalated,
      this.sentiment,
      this.channel,
      this.category,
      this.type,
      this.department,
      this.escalationDepartment,
      this.titles,
      this.isCompleted,
      this.createdDate,
      this.updateDate,
      this.id});

  ChatSession.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    email = json['email'];
    businessId = json['businessId'];
    customer = json['customer'];
    phoneNo = json['phoneNo'];
    if (json['messages'] != null) {
      messages = <MessagesData>[];
      json['messages'].forEach((v) {
        messages!.add(MessagesData.fromJson(v));
      });
    }
    escalated = json['escalated'];
    sentiment = json['sentiment'];
    channel = json['channel'];
    category = json['category'];
    type = json['type'];
    department = json['department'];
    escalationDepartment = json['escalation_department'];
    if (json['titles'] != null) {
      titles = <MessagesData>[];
      json['titles'].forEach((v) {
        titles!.add(MessagesData.fromJson(v));
      });
    }
    isCompleted = json['isCompleted'];
    createdDate = json['created_date'];
    updateDate = json['update_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatId'] = chatId;
    data['email'] = email;
    data['businessId'] = businessId;
    data['customer'] = customer;
    data['phoneNo'] = phoneNo;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['escalated'] = escalated;
    data['sentiment'] = sentiment;
    data['channel'] = channel;
    data['category'] = category;
    data['type'] = type;
    data['department'] = department;
    data['escalation_department'] = escalationDepartment;
    if (titles != null) {
      data['titles'] = titles!.map((v) => v.toJson()).toList();
    }
    data['isCompleted'] = isCompleted;
    data['created_date'] = createdDate;
    data['update_date'] = updateDate;
    data['id'] = id;
    return data;
  }
}

class MessagesData {
  String? status;
  String? role;
  String? content;
  String? createdDate;
  String? sId;

  MessagesData(
      {this.status, this.role, this.content, this.createdDate, this.sId});

  MessagesData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    role = json['role'];
    content = json['content'];
    createdDate = json['created_date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['role'] = role;
    data['content'] = content;
    data['created_date'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}
