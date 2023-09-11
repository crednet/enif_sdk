class Faq {
  final String? question;
  final String? response;

  Faq({this.question, this.response});

  factory Faq.fromJson(Map<String, dynamic> json) =>
      Faq(question: json['question'], response: json['response']);

  Map<String, dynamic> toJson() => {
        'question': question,
        'response': response,
      };
}
