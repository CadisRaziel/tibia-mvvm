class MountInfoModel {
  final int position;
  final String? name;
  final String? iconImage;
  final String? description;
  final List<String>? images;

  MountInfoModel(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}