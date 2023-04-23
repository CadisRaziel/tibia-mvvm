class PlayerInfoModel {
  final String? name;
  final String? sex;
  final String? title;
  final int? unlockedTitles;
  final String? vocation;
  final int? level;
  final int? achievementPoints;
  final String? world;
  final String? residence;

  final String? lastLogin;
  final String? accountStatus;
  final String? comment;

  PlayerInfoModel({
    required this.name,
    required this.sex,
    required this.title,
    required this.unlockedTitles,
    required this.vocation,
    required this.level,
    required this.achievementPoints,
    required this.world,
    required this.residence,

    required this.lastLogin,
    required this.accountStatus,
    required this.comment,
  });

  factory PlayerInfoModel.fromJson(Map<String, dynamic> json) {
    return PlayerInfoModel(
      name: json['name'],
      sex: json['sex'],
      title: json['title'],
      unlockedTitles: json['unlocked_titles'],
      vocation: json['vocation'],
      level: json['level'],
      achievementPoints: json['achievement_points'],
      world: json['world'],
      residence: json['residence'],    
      lastLogin: json['last_login'],
      accountStatus: json['account_status'],
      comment: json['comment'],
    );
  }
}
