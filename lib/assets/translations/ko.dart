// Korean String manage
const Map<String, String> koKR = {
  // Common
  'App_name': '경영관리',
  'confirm': '확인',
  'cancel': '취소',
  'all': '전체',
  'search': '검색',
  'config': '설정',
  'user_info': '사용자 정보',
  'user_name': '사용자',
  'user_id': '아이디',
  'business_name': '회사명',
  'business_no': '사업자등록번호',

  // Login
  'text_id': '아이디',
  'text_pw': '패스워드',
  'text_login': '로그인',
  'text_logout': '로그아웃',
  'hint_id_input': 'ID를 입력해 주세요.',
  'hint_pw_input': 'PW를 입력해 주세요.',
  'privacy_policy': '개인정보 처리방침',
  'admob_banner': '광고배너',
  'check_login_header': 'ID/PW 확인',
  'check_login_content': 'ID/PW를 확인해 주세요.',
  'login_expiration': '인증만료',
  'expiration_content': '인증이 만료되어 로그인페이지로 이동합니다.',

  // config
  'notice': '공지 사항',
  'system_setting': '시스템 설정',
  'menu_setting': '메뉴 설정',
  'exam_menu': '예제 메뉴',
  'dark_mode': '다크 모드',
  'show_admob': '광고 노출',
  'isCustomFilter': '거래처 필터링 사용',
  'isIncludeSalChrgCd': '영업사원 선택시 관리담당 포함',
  'isCompareFirst': '초성검색시 첫글자부터 비교',

  // Dialog search customer
  'title_search_customer': '거래처',
  'hint_search_customer': '거래처 코드/명을 입력해주세요.',

  // Dialog search purchase
  'title_search_purchase': '매입처',
  'hint_search_purchase': '매입처 코드/명을 입력해주세요.',

  // Dialog search item
  'title_search_item': '품목',
  'hint_search_item': '품목 코드/명을 입력해주세요.',

  // Dialog search lendItem
  'title_search_lenditem': '용공',
  'hint_search_lenditem': '용공 코드/명을 입력해주세요.',

  // Period Picker
  'period_error_header': '기간오류',
  'period_error_content': '기간을 확인해주세요.',
  'period_error_limit': '최대 6개월간 조회 가능합니다.',

  // DashBoard
  'title_sales': '당월 매출',
  'title_purchase': '당월 매입',
  'title_deposit': '당월 회수',
  'title_withdraw': '당월 출금',
  'title_return': '당월 반납',
  'title_rental': '당월 대여',
  'title_asset': '당월 자산',
  'title_status': '현황',
  'title_current': '당일 현황',
  'title_month': '당월 현황',

  // Navigation Label
  'nav_home': '홈',
  'nav_mymenu': '마이메뉴',
  'nav_menu': '메뉴',
  'nav_premium': '프리미엄',
  'nav_more': '더보기',

  // option
  'opt_period': '기간',
  'opt_date': '일자',
  'opt_month': '조회월',
  'opt_workspace': '사업장',
  'opt_customer': '거래처',
  'opt_sales': '영업담당',
  'opt_manage': '관리담당',
  'opt_customer_status': '거래처상태',
  'opt_graph_type': '종류',
  'opt_team': '팀',
  'opt_business': '업종',
  'opt_sales_type': '매출유형',
  'opt_search_division': '조회구분',
  'opt_customer_class': '등급',
  'opt_rental_division': '대여구분',
  'opt_asset_status': '자산상태',
  'opt_warehouse': '창고',
  'opt_sales_class': '판매분류',
  'opt_lend_division': '용기구분',

  // Drawer Menu Label
  'logout': '로그아웃',
  'logout_content': '로그아웃 하시겠습니까?',

  // Snack Bar
  'snack_alram': '알림',
  'snack_error': '에러',
  'snack_information': '정보',

  // Progress Bar
  'progress_loading': '로딩중입니다...',
  'progress_login': '로그인중입니다...',
  'progress_search': '서버 조회중 입니다...',

  // menu
  'menu_main_managemnent': '경영분석',
  'menu_sub_total': '종합현황',
  'menu_sub_salesdaily': '영업일보',
  'menu_sub_salesperson_contribute': '영업사원별 기여현황',
  'menu_sub_customer_contribute': '매출처별 기여현황',
  'menu_sub_sales_class_status': '판매분류별 현황',
  'menu_sub_sales_rank': '매출순위현황',
  'menu_sub_analysis_graph': '분석 그래프',
  'menu_sub_salesdaily_division': '영업일보(용도별)',

  'menu_main_sales': '영업분석',
  'menu_sub_customer_info': '거래처 현황',
  'menu_sub_salesperson_report': '영업사원별 매출현황',
  'menu_sub_report_monthly': '영업사원별 월별 매출현황',
  'menu_sub_sales_status': '매출현황',
  'menu_sub_customer_monthly': '월별 매출현황',
  'menu_sub_sales_ledger': '매출원장',
  'menu_sub_achievement': '목표대비 실적현황',
  'menu_sub_balance_report': '채권현황',
  'menu_sub_balance_rental_report': '채권 및 대여 현황',
  'menu_sub_sales_rental_ledger': '매출 및 대여 원장',
  'menu_sub_item_status': '품목 현황',

  'menu_main_purchase': '매입분석',
  'menu_sub_purchase_report': '매입현황',
  'menu_sub_purchase_ledger': '매입원장',

  'menu_main_support': '지원현황',
  'menu_sub_support_rental_report': '대여금 현황',
  'menu_sub_support_rent_asset': '대여자산 현황',
  'menu_sub_support_rent_asset_history': '대여자산 현황(이력)',

  'menu_main_location': '위치조회',
  'menu_sub_vendor_location': '매출처 위치조회',

  'menu_main_asset': '재고분석',
  'menu_sub_inventory_report': '재고현황',
  'menu_sub_inventory_in_out_report': '재고수불현황',
  'menu_sub_lend_report_warehouse': '용공수불현황(창고)',
  'menu_sub_lend_report_customer': '용공수불현황(거래처)',
  'menu_sub_lend_report_salesperson': '용공수불현황(영업담당)',

  // API Result Message
  'msg_api_success': '성공',
  'msg_api_400': '잘못된 요청입니다.',
  'msg_api_401': '유효한 인증 자격 증명이 없습니다.',
  'msg_api_500': '서버 에러입니다.',

  'msg_conn_api_server': '서버에 접속할 수 없습니다.',
  'msg_conn_auth_server': '인증서버에 접속할 수 없습니다.',

  // Common Item
  'amount': '금액',
  'balance': '잔액',
  'sales': '매출',
  'item': '품목',
  'sales_amount': '매출액',
  'purchase_amount': '매입액',
  'supplement_amount': '공급가',
  'vat_amount': '부가세',
  'guarantee_amount': '보증금',
  'collect_amount': '회수액',
  'deposit_amount': '입금액',
  'return_amount': '반납액',
  'rental_amount': '대여액',
  'total_amount': '합계',

  // 종합현황 Item
  'deposit_title_amt': '채권잔액',
  'withdraw_title_outTot': '출금액',
  'withdraw_title_amt': '채무잔액',
  'rental_title_inspayLendAmt': '회수예정금액',
  'rental_title_remAmt': '미회수잔액',
  'rental_title_totAmt': '대여금잔액',
  'asset_title_totQty': '신규대여수량',
  'asset_title_totAmt': '신규대여금액',

  // 영업일보 Item
  'employee_name': '담당자',
  'division_name': '구분',
  'purchase_cost': '매입원가',
  'profit_amount': '매출이익',
  'deposit_cash': '입금소계',
  'deposit_empty_case_bottle': '용공입금',
  'bond_balance': '채권잔액',

  // 경고성 문구
  'must_select_customer': '거래처를 선택해주세요.',
  'must_select_item': '품목을 선택해주세요.',
};

//const Map<String,String> enUs = {};
