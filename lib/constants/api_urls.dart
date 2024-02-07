/// API Url constants
class ApiUrls {
  static faq(String businessId) => "api/business/get-faqs/$businessId";

  static const String initChat = "api/chat/new-chat";
  static String chatHistory(String email) => "api/chat/user/$email";
  static String ticketStatus(String ticketId) =>
      "api/ticket/$ticketId/read-status";
  static String updateTicketStatus(String ticketId) =>
      "api/ticket/$ticketId/update-read-status";
  static String chatMessages(String chatId) => "api/chat/messages/$chatId";
  static const String sendChat = "api/chat/send";
  static String sendImage(String businessId) => "api/chat/image/$businessId";
  static const String socketURL = "wss://test.enif.ai/";
  static String sendDeviceToken(ticketId) =>
      "api/user/register-sdk-customer/ticket/$ticketId";
}
