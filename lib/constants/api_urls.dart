/// API Url constants
class ApiUrls {
  static faq(String businessId) => "api/business/get-faqs/$businessId";

  static const String initChat = "api/chat/new-chat";
  static String chatHistory(String email) => "api/chat/user/$email";
  static String chatMessages(String chatId) => "api/chat/messages/$chatId";
  static const String sendChat = "api/chat/send";
  static const String socketURL = "wss://test.enif.ai/";
}
