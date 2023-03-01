class PackageModel {
  final List<ItemModelPackage> data;
  PackageModel({required this.data});

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        data: List<ItemModelPackage>.from((json['data'] as List)
            .map((e) => ItemModelPackage.fromJson(e))
            .where((data) => data.id != null)),
      );
}

class ItemModelPackage {
  final String? id;
  final String? name;
  final int? quantity;
  final String? createBy;
  final String createAt;
  ItemModelPackage({
    required this.id,
    required this.name,
    required this.quantity,
    required this.createBy,
    required this.createAt,
  });
  factory ItemModelPackage.fromJson(Map<String, dynamic> json) =>
      ItemModelPackage(
        id: json['_id'],
        name: json['name'],
        quantity: json['quantity'],
        createBy: json['user']['name'],
        createAt: json['createdAt'],
      );
}
