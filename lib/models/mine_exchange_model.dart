class MineExchangeModel {
  final int statusCode;
  final bool status;
  final String message;
  final List<ProjectModel> data;

  MineExchangeModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory MineExchangeModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<ProjectModel> projects =
        list.map((i) => ProjectModel.fromJson(i)).toList();

    return MineExchangeModel(
      statusCode: json['status_code'],
      status: json['status'],
      message: json['message'],
      data: projects,
    );
  }
}

class ProjectModel {
  final String name;
  final String intension;
  final String region;
  final List<dynamic> image;
  final List<dynamic> commodity_sector;
  final String price_range;
  final String commodity;

  ProjectModel({
    required this.name,
    required this.intension,
    required this.region,
    required this.image,
    required this.commodity_sector,
    required this.price_range,
    required this.commodity,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] ?? '',
      intension: json['intension'] ?? '',
      region: json['region'] ?? '',
      image: json['image'] ?? [""],
      commodity_sector: json['commodity_sector'] ?? [""],
      price_range: json['price_range'] ?? '',
      commodity: json['commodity'] ?? '',
    );
  }
}

class ImageData {
  final String url;
  final String name;

  ImageData({required this.name, required this.url});
}
