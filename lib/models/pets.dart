class NotificationSettingsDetail {
  List<Data>? data;
  String? status;

  NotificationSettingsDetail({this.data, this.status});

  NotificationSettingsDetail.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? category;
  String? categoryDisplayName;
  String? categoryDisplayKey;
  List<Subcategories>? subcategories;
  String? subscribeFlag;

  Data(
      {this.category,
      this.categoryDisplayName,
      this.categoryDisplayKey,
      this.subcategories,
      this.subscribeFlag});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryDisplayName = json['categoryDisplayName'];
    categoryDisplayKey = json['categoryDisplayKey'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
    subscribeFlag = json['subscribeFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['categoryDisplayName'] = this.categoryDisplayName;
    data['categoryDisplayKey'] = this.categoryDisplayKey;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    data['subscribeFlag'] = this.subscribeFlag;
    return data;
  }
}

class Subcategories {
  String? category;
  String? categoryDisplayName;
  String? categoryDisplayKey;
  String? subscribeFlag;

  Subcategories(
      {this.category,
      this.categoryDisplayName,
      this.categoryDisplayKey,
      this.subscribeFlag});

  Subcategories.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryDisplayName = json['categoryDisplayName'];
    categoryDisplayKey = json['categoryDisplayKey'];
    subscribeFlag = json['subscribeFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['categoryDisplayName'] = this.categoryDisplayName;
    data['categoryDisplayKey'] = this.categoryDisplayKey;
    data['subscribeFlag'] = this.subscribeFlag;
    return data;
  }
}
