class ExamModel {
  int? id;
  String date;
  String partNm;
  String type;
  int box;
  int ea;
  int amt1; // 매출액
  int amt2; // 공급가
  int amt3; // 부가세
  int amt4; // 보증금
  int amt5; // 입금액
  int amt6; // 채권잔액

  bool expanded = false;

  ExamModel(this.date, this.partNm, this.type, this.box, this.ea, this.amt1,
      this.amt2, this.amt3, this.amt4, this.amt5, this.amt6,
      {this.expanded = false, this.id});
}

List<ExamModel> generateData(int count) {
  return List.generate(
      count,
      (index) => ExamModel(
          dataList[index].date,
          dataList[index].partNm,
          dataList[index].type,
          dataList[index].box,
          dataList[index].ea,
          dataList[index].amt1,
          dataList[index].amt2,
          dataList[index].amt3,
          dataList[index].amt4,
          dataList[index].amt5,
          dataList[index].amt6,
          id: index));
}

List<ExamModel> dataList = [
  ExamModel('2022-09-01', '[15001]참이슬 360ml', '매출', 1, 2, 7000, 3000, 2000,
      12000, 80000, 2000),
  ExamModel('2022-09-02', '[00004]골든상하이', '매입', 9, 2, 4000, 7000, 7000, 13000,
      20000, 1000),
  ExamModel('2022-09-03', '[00904]골든블루', '매출', 5, 2, 7000, 3000, 2000, 12000,
      80000, 2000),
  ExamModel('2022-09-04', '[15001]참이슬 360ml', '매출', 6, 18, 7000, 3000, 2000,
      12000, 80000, 2000),
  ExamModel('2022-09-05', '[15001]참이슬 360ml', '매출', 8, 12, 7000, 3000, 2000,
      12000, 80000, 2000),
  ExamModel('2022-09-06', '[15001]참이슬 360ml', '매출', 24, 11, 7000, 3000, 2000,
      12000, 80000, 2000),
  ExamModel('2022-09-07', '[15001]참이슬 360ml', '매출', 10, 22, 7000, 3000, 2000,
      12000, 80000, 2000),
];
