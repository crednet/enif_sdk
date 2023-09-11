class GetUserChatModel {
  // Null? escalationDepartment;
  // List<Null>? titles;
  bool? isCompleted;
  String? chatId;
  String? email;
  String? businessId;
  String? customer;
  List<GetMessages>? messages;
  bool? escalated;
  String? sentiment;
  String? channel;
  String? createdDate;
  String? updateDate;
  String? category;
  String? department;
  String? type;
  String? id;

  GetUserChatModel(
      {
        // this.escalationDepartment,
        // this.titles,
        this.isCompleted,
        this.chatId,
        this.email,
        this.businessId,
        this.customer,
        this.messages,
        this.escalated,
        this.sentiment,
        this.channel,
        this.createdDate,
        this.updateDate,
        this.category,
        this.department,
        this.type,
        this.id});

  GetUserChatModel.fromJson(Map<String, dynamic> json) {
    // escalationDepartment = json['escalation_department'];
    // if (json['titles'] != null) {
    //   titles = <Null>[];
    //   json['titles'].forEach((v) {
    //     titles!.add(new Null.fromJson(v));
    //   });
    // }
    isCompleted = json['isCompleted'];
    chatId = json['chatId'];
    email = json['email'];
    businessId = json['businessId'];
    customer = json['customer'];
    if (json['messages'] != null) {
      messages = <GetMessages>[];
      json['messages'].forEach((v) {
        messages!.add(new GetMessages.fromJson(v));
      });
    }
    escalated = json['escalated'];
    sentiment = json['sentiment'];
    channel = json['channel'];
    createdDate = json['created_date'];
    updateDate = json['update_date'];
    category = json['category'];
    department = json['department'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['escalation_department'] = this.escalationDepartment;
    // if (this.titles != null) {
    //   data['titles'] = this.titles!.map((v) => v.toJson()).toList();
    // }
    data['isCompleted'] = this.isCompleted;
    data['chatId'] = this.chatId;
    data['email'] = this.email;
    data['businessId'] = this.businessId;
    data['customer'] = this.customer;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['escalated'] = this.escalated;
    data['sentiment'] = this.sentiment;
    data['channel'] = this.channel;
    data['created_date'] = this.createdDate;
    data['update_date'] = this.updateDate;
    data['category'] = this.category;
    data['department'] = this.department;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}

class GetMessages {
  String? status;
  String? role;
  String? content;
  String? createdDate;
  String? sId;

  GetMessages({this.status, this.role, this.content, this.createdDate, this.sId});

  GetMessages.fromJson(Map<String, dynamic> json) {
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