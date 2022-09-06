
// 품목 검색 model
class ProductList {
  String? itmCd;
  String? itmNm;
  String? itmAbbNm;
  String? stnd;
  String? uzFg;
  String? ufFgNm;
  String? ut;
  String? utNm;

  ProductList(this.itmCd, this.itmNm, this.itmAbbNm, this.stnd, this.uzFg,
      this.ufFgNm, this.ut, this.utNm);

  ProductList.fromJson(Map data)
      : itmCd = data['ITM_CD'],
        itmNm = data['ITM_NM'],
        itmAbbNm = data['ITM_ABB_NM'],
        stnd = data['STND'],
        uzFg = data['UZ_FG'],
        ufFgNm = data['UZ_FG_NM'],
        ut = data['UT'],
        utNm = data['UT_NM'];

  Map<String, dynamic> toMap() {
    return {
      'itmCd': itmCd,
      'itmNm': itmNm,
      'itmAbbNm': itmAbbNm,
      'stnd': stnd,
      'uzFg': uzFg,
      'ufFgNm': ufFgNm,
      'ut': ut,
      'utNm': utNm
    };
  }
}
