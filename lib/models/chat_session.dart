import 'send_chat_model.dart';

class ChatSession {
  String? agentName;
  String? email;
  String? businessId;
  String? customer;
  String? phoneNo;
  Message? message;
  bool? escalated;
  String? sentiment;
  String? channel;
  String? category;
  String? type;
  String? department;
  String? escalationDepartment;
  String? title;
  // List<MessagesData>? titles;
  bool? isCompleted;
  String? createdDate;
  DateTime? createdAt, updatedAt;
  String? updateDate;
  String? id;

  ChatSession(
      {this.createdAt,
      this.updatedAt,
      this.email,
      this.businessId,
      this.customer,
      this.phoneNo,
      this.message,
      this.escalated,
      this.sentiment,
      this.channel,
      this.category,
      this.type,
      this.department,
      this.escalationDepartment,
      this.title,
      // this.titles,
      this.isCompleted,
      this.createdDate,
      this.updateDate,
      this.id});

  ChatSession.fromJson(Map<String, dynamic> json) {
    agentName = json['agentName'];
    email = json['email'];
    businessId = json['businessId'];
    customer = json['customer'];
    phoneNo = json['phoneNo'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;

    escalated = json['escalated'];
    sentiment = json['sentiment'];
    channel = json['channel'];
    category = json['category'];
    type = json['type'];
    department = json['department'];
    escalationDepartment = json['escalation_department'];
    title = json['title'];
    // if (json['titles'] != null) {
    //   titles = <MessagesData>[];
    //   json['titles'].forEach((v) {
    //     titles!.add(MessagesData.fromJson(v));
    //   });
    // }
    isCompleted = json['isCompleted'];
    createdDate = json['created_date'];
    updateDate = json['update_date'];
    createdAt = DateTime.tryParse(json['createdAt'] ?? '');
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '');
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agentName'] = agentName;
    data['email'] = email;
    data['businessId'] = businessId;
    data['customer'] = customer;
    data['phoneNo'] = phoneNo;
    if (message != null) {
      data['message'] = message?.toJson();
    }
    data['escalated'] = escalated;
    data['sentiment'] = sentiment;
    data['channel'] = channel;
    data['category'] = category;
    data['type'] = type;
    data['department'] = department;
    data['escalation_department'] = escalationDepartment;
    // if (titles != null) {
    //   data['titles'] = titles!.map((v) => v.toJson()).toList();
    // }
    data['isCompleted'] = isCompleted;
    data['created_date'] = createdDate;
    data['createdAt'] = createdAt?.toIso8601String();
    data['updatedAt'] = updatedAt?.toIso8601String();
    data['update_date'] = updateDate;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
