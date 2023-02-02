// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Review {
  final String userId;
  String text = "";
  final double rate;
  final DateTime time;

  Review({
    required this.userId,
    this.text = "",
    required this.rate,
    required this.time,
  });

  Review copyWith({
    String? text,
    double? rate,
    DateTime? time,
  }) {
    return Review(
      userId: userId,
      text: text ?? this.text,
      rate: rate ?? this.rate,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'text': text,
      'rate': rate,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      userId: map['userId'] as String,
      text: map['text'] as String,
      rate: map['rate'] as double,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(userId: $userId, text: $text, rate: $rate, time: $time)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.text == text &&
        other.rate == rate &&
        other.time == time;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ text.hashCode ^ rate.hashCode ^ time.hashCode;
  }
}
