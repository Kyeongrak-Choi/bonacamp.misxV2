
// 거래처 검색 Model
class CustomerList {

  String? custCd;
  String? custNm;
  String? custAbbNm;
  String? custStat;
  String? salChrgCd;
  String? salChrgNm;
  String? custStatNm;
  String? bizItm;
  String? bizItmNm;
  String? bizRegNo;
  String? reprNm;
  String? telNo;
  String? addr;

  CustomerList(
      this.custCd,
      this.custNm,
      this.custAbbNm,
      this.custStat,
      this.salChrgCd,
      this.salChrgNm,
      this.custStatNm,
      this.bizItm,
      this.bizItmNm,
      this.bizRegNo,
      this.reprNm,
      this.telNo,
      this.addr);

  CustomerList.fromJson(Map data)
  : custCd = data['CUST_CD'],
    custNm = data['CUST_NM'],
    custAbbNm = data['CUST_ABB_NM'],
    custStat = data['CUST_STAT'],
    salChrgCd = data['SAL_CHRG_CD'],
    salChrgNm = data['SAL_CHRG_NM'],
    custStatNm = data['CUST_STAT_NM'],
    bizItm = data['BIZ_ITM'],
    bizItmNm = data['BIZ_ITM_NM'],
    bizRegNo = data['BIZ_REG_NO'],
    reprNm = data['REPR_NM'],
    telNo = data['TEL_NO'],
    addr = data['ADDR'];

  Map<String, dynamic> toMap(){
    return {
      'custCd' : custCd,
      'custNm' : custNm,
      'custAbbNm' : custAbbNm,
      'custStat' : custStat,
      'salChrgCd' : salChrgCd,
      'salChrgNm' : salChrgNm,
      'custStatNm' : custStatNm,
      'bizItm' : bizItm,
      'bizItmNm' : bizItmNm,
      'bizRegNo' : bizRegNo,
      'reprNm' : reprNm,
      'telNo' : telNo,
      'addr' : addr
    };
  }
}