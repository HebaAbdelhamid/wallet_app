class Bills {
  final String id;
  final String userId;
  final String categoryId;
  final String description;
  final int amount; // Renamed from cost
  final String createdAt;
  final String updatedAt;

  Bills({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.description,
    required this.amount, // Renamed from cost
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bills.fromJson(Map<String, dynamic> json) {
    return Bills(
      id: json['_id'],
      userId: json['userId'],
      categoryId: json['categoryId'],
      description: json['description'],
      amount: json['amount'], // Renamed from cost
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
