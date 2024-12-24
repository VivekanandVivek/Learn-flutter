class UserModal {
  int? code;
  String? message;
  List<Result>? result;
  int? count;

  UserModal({this.code, this.message, this.result, this.count});

  UserModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Result {
  TargetAge? targetAge;
  String? sId;
  String? postType;
  UserId? userId;
  String? firstImage;
  String? secondImage;
  String? firstLabel;
  String? secondLabel;
  int? firstCount;
  int? secondCount;
  int? views;
  String? text;
  List<String>? labels;
  List<String>? targetCountries;
  String? targetGender;
  bool? underReview;
  int? sharedCount;
  int? commentsCount;
  int? reactedCount;
  bool? active;
  bool? delete;
  bool? isImageDeleted;
  bool? labelAdded;
  bool? isUserPremium;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? mergedImageUrl;

  Result(
      {this.targetAge,
        this.sId,
        this.postType,
        this.userId,
        this.firstImage,
        this.secondImage,
        this.firstLabel,
        this.secondLabel,
        this.firstCount,
        this.secondCount,
        this.views,
        this.text,
        this.labels,
        this.targetCountries,
        this.targetGender,
        this.underReview,
        this.sharedCount,
        this.commentsCount,
        this.reactedCount,
        this.active,
        this.delete,
        this.isImageDeleted,
        this.labelAdded,
        this.isUserPremium,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.mergedImageUrl});

  Result.fromJson(Map<String, dynamic> json) {
    targetAge = json['targetAge'] != null
        ? new TargetAge.fromJson(json['targetAge'])
        : null;
    sId = json['_id'];
    postType = json['postType'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    firstImage = json['firstImage'];
    secondImage = json['secondImage'];
    firstLabel = json['firstLabel'];
    secondLabel = json['secondLabel'];
    firstCount = json['firstCount'];
    secondCount = json['secondCount'];
    views = json['views'];
    text = json['text'];
    labels = json['labels'].cast<String>();
    targetCountries = json['targetCountries'].cast<String>();
    targetGender = json['targetGender'];
    underReview = json['underReview'];
    sharedCount = json['sharedCount'];
    commentsCount = json['commentsCount'];
    reactedCount = json['reactedCount'];
    active = json['active'];
    delete = json['delete'];
    isImageDeleted = json['isImageDeleted'];
    labelAdded = json['labelAdded'];
    isUserPremium = json['isUserPremium'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    mergedImageUrl = json['mergedImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.targetAge != null) {
      data['targetAge'] = this.targetAge!.toJson();
    }
    data['_id'] = this.sId;
    data['postType'] = this.postType;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['firstImage'] = this.firstImage;
    data['secondImage'] = this.secondImage;
    data['firstLabel'] = this.firstLabel;
    data['secondLabel'] = this.secondLabel;
    data['firstCount'] = this.firstCount;
    data['secondCount'] = this.secondCount;
    data['views'] = this.views;
    data['text'] = this.text;
    data['labels'] = this.labels;
    data['targetCountries'] = this.targetCountries;
    data['targetGender'] = this.targetGender;
    data['underReview'] = this.underReview;
    data['sharedCount'] = this.sharedCount;
    data['commentsCount'] = this.commentsCount;
    data['reactedCount'] = this.reactedCount;
    data['active'] = this.active;
    data['delete'] = this.delete;
    data['isImageDeleted'] = this.isImageDeleted;
    data['labelAdded'] = this.labelAdded;
    data['isUserPremium'] = this.isUserPremium;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['mergedImageUrl'] = this.mergedImageUrl;
    return data;
  }
}

class TargetAge {
  int? startRange;
  int? endRange;

  TargetAge({this.startRange, this.endRange});

  TargetAge.fromJson(Map<String, dynamic> json) {
    startRange = json['startRange'];
    endRange = json['endRange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startRange'] = this.startRange;
    data['endRange'] = this.endRange;
    return data;
  }
}

class UserId {
  String? sId;
  String? email;
  String? fullName;
  bool? isSubscription;

  UserId({this.sId, this.email, this.fullName, this.isSubscription});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    isSubscription = json['isSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['isSubscription'] = this.isSubscription;
    return data;
  }
}
