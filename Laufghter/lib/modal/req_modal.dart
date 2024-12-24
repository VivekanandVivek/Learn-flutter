class ReqModal {
  int? pageNumber;

  ReqModal({this.pageNumber});

  ReqModal.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    return data;
  }
}
