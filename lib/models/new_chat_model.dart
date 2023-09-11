class NewChatModel {
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

  NewChatModel(
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

  NewChatModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    email = json['email'];
    businessId = json['businessId'];
    customer = json['customer'];
    phoneNo = json['phoneNo'];
    if (json['messages'] != null) {
      messages = <MessagesData>[];
      json['messages'].forEach((v) {
        messages!.add(new MessagesData.fromJson(v));
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
        titles!.add(new MessagesData.fromJson(v));
      });
    }
    isCompleted = json['isCompleted'];
    createdDate = json['created_date'];
    updateDate = json['update_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chatId'] = this.chatId;
    data['email'] = this.email;
    data['businessId'] = this.businessId;
    data['customer'] = this.customer;
    data['phoneNo'] = this.phoneNo;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['escalated'] = this.escalated;
    data['sentiment'] = this.sentiment;
    data['channel'] = this.channel;
    data['category'] = this.category;
    data['type'] = this.type;
    data['department'] = this.department;
    data['escalation_department'] = this.escalationDepartment;
    if (this.titles != null) {
      data['titles'] = this.titles!.map((v) => v.toJson()).toList();
    }
    data['isCompleted'] = this.isCompleted;
    data['created_date'] = this.createdDate;
    data['update_date'] = this.updateDate;
    data['id'] = this.id;
    return data;
  }
}

class MessagesData {
  String? status;
  String? role;
  String? content;
  String? createdDate;
  String? sId;

  MessagesData({this.status, this.role, this.content, this.createdDate, this.sId});

  MessagesData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    role = json['role'];
    content = json['content'];
    createdDate = json['created_date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['role'] = this.role;
    data['content'] = this.content;
    data['created_date'] = this.createdDate;
    data['_id'] = this.sId;
    return data;
  }
}