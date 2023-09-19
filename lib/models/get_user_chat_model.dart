// class GetUserChatModel {
//   // Null? escalationDepartment;
//   // List<Null>? titles;
//   bool? isCompleted;
//   String? chatId;
//   String? email;
//   String? businessId;
//   String? customer;
//   List<GetMessages>? messages;
//   bool? escalated;
//   String? sentiment;
//   String? channel;
//   String? createdDate;
//   String? updateDate;
//   String? category;
//   String? department;
//   String? type;
//   String? id;

//   GetUserChatModel(
//       {
//       // this.escalationDepartment,
//       // this.titles,
//       this.isCompleted,
//       this.chatId,
//       this.email,
//       this.businessId,
//       this.customer,
//       this.messages,
//       this.escalated,
//       this.sentiment,
//       this.channel,
//       this.createdDate,
//       this.updateDate,
//       this.category,
//       this.department,
//       this.type,
//       this.id});

//   GetUserChatModel.fromJson(Map<String, dynamic> json) {
//     // escalationDepartment = json['escalation_department'];
//     // if (json['titles'] != null) {
//     //   titles = <Null>[];
//     //   json['titles'].forEach((v) {
//     //     titles!.add(new Null.fromJson(v));
//     //   });
//     // }
//     isCompleted = json['isCompleted'];
//     chatId = json['chatId'];
//     email = json['email'];
//     businessId = json['businessId'];
//     customer = json['customer'];
//     if (json['messages'] != null) {
//       messages = <GetMessages>[];
//       json['messages'].forEach((v) {
//         messages!.add(GetMessages.fromJson(v));
//       });
//     }
//     escalated = json['escalated'];
//     sentiment = json['sentiment'];
//     channel = json['channel'];
//     createdDate = json['created_date'];
//     updateDate = json['update_date'];
//     category = json['category'];
//     department = json['department'];
//     type = json['type'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     // data['escalation_department'] = this.escalationDepartment;
//     // if (this.titles != null) {
//     //   data['titles'] = this.titles!.map((v) => v.toJson()).toList();
//     // }
//     data['isCompleted'] = isCompleted;
//     data['chatId'] = chatId;
//     data['email'] = email;
//     data['businessId'] = businessId;
//     data['customer'] = customer;
//     if (messages != null) {
//       data['messages'] = messages!.map((v) => v.toJson()).toList();
//     }
//     data['escalated'] = escalated;
//     data['sentiment'] = sentiment;
//     data['channel'] = channel;
//     data['created_date'] = createdDate;
//     data['update_date'] = updateDate;
//     data['category'] = category;
//     data['department'] = department;
//     data['type'] = type;
//     data['id'] = id;
//     return data;
//   }
// }

// class GetMessages {
//   String? status;
//   String? role;
//   String? content;
//   String? createdDate;
//   String? sId;

//   GetMessages(
//       {this.status, this.role, this.content, this.createdDate, this.sId});

//   GetMessages.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     role = json['role'];
//     content = json['content'];
//     createdDate = json['created_date'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['role'] = role;
//     data['content'] = content;
//     data['created_date'] = createdDate;
//     data['_id'] = sId;
//     return data;
//   }
// }
