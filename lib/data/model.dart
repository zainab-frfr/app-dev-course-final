class Model{
  final num amount;
  final DateTime date;
  final String icon;
  final bool incoming;
  final String title;

  Model({
    required this.amount,
    required this.date,
    required this.icon,
    required this.title,
    required this.incoming,
  });

  factory Model.fromJson(Map<String,dynamic> json){ 
    return  Model(
      amount: json['amount'], 
      date: json['date'].toDate(),
      icon: json['icon'], 
      title: json['title'], 
      incoming: json['incoming'], 
    );
  }

}