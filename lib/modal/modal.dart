import 'package:counter_app/header.dart';

class Counter {
  final String title;
  final String counter;

  Counter({required this.title, required this.counter});

  factory Counter.formMap({required Map data}) => Counter(
        title: data['title'],
        counter: data['counter'],
      );

  Map<String, dynamic> get toMap => {
        'title': title,
        'counter': counter,
      };
}
