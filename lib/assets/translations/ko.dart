// Korean String manage
const Map<String, String> koKR = {
  // Common
  'App_name': '경영관리',
  'confirm': '확인',
  'cancel': '취소',
  'all': '전체',
  'search': '검색',
  'config': '설정',

  // Login
  'text_id': 'ID',
  'text_pw': 'PW',
  'text_login': 'LOGIN',
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
  'isCustomFilter': '거래처 필터링 사용',
  'isIncludeSalChrgCd': '영업사원 선택시 관리담당 포함',
  'isCompareFirst': '초성검색시 첫글자부터 비교',

  // Dialog search customer
  'title_search_customer': '거래처 검색',
  'hint_search_customer': '거래처 코드/명을 입력해주세요.',

  // Dialog search purchase
  'title_search_purchase': '매입처 검색',
  'hint_search_purchase': '매입처 코드/명을 입력해주세요.',

  // Dialog search item
  'title_search_item': '품목 검색',
  'hint_search_item': '품목 코드/명을 입력해주세요.',

  // Dialog search lendItem
  'title_search_lenditem': '용공 검색',
  'hint_search_lenditem': '용공 코드/명을 입력해주세요.',

  // Period Picker
  'period_error_header': '기간오류',
  'period_error_content': '기간을 확인해주세요.',

  // DashBoard
  'title_sales': '당월 매출',
  'title_purchase': '당월 매입',
  'title_deposit': '당월 회수',
  'title_withdraw': '당월 출금',
  'title_return': '당월 반납',
  'title_rental': '당월 대여',
  'title_asset': '당월 자산',
  'title_status': '현황',

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
  'opt_customer_status': '거래처 상태',
  'opt_team': '팀',

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
  'menu_sub_overall': '종합현황',
  'menu_sub_salesdaily': '영업일보',
  'menu_sub_salesperson_contribute': '영업사원별 기여현황',
  'menu_sub_customer_contribute': '매출처별 기여현황',
  'menu_sub_sales_class_status': '판매분류별 현황',
  'menu_sub_sales_rank': '매출순위현황',
  'title_7': '분석 그래프',
  'title_8': '영업일보(용도별)',

  'menu_main_sales': '영업분석',
  'title_9': '거래처 현황',
  'title_10': '영업사원별 매출현황',
  'title_11': '영업사원별 월별 매출현황',
  'title_12': '매출현황',
  'title_13': '월별 매출현황',
  'title_14': '매출원장',
  'title_15': '목표대비 실적현황',
  'title_16': '채권현황',
  'title_17': '채권 및 대여 현황',
  'title_18': '매출 및 대여 원장',

  'menu_main_purchase': '매입분석',
  'title_19': '매입현황',
  'title_20': '매입원장',

  'menu_main_rental': '지원현황',
  'title_21': '대여금 현황',
  'title_22': '대여자산 현황',
  'title_23': '대여자산 현황(이력)',

  'menu_main_location': '위치조회',
  'title_24': '매출처 위치조회',

  'menu_main_asset': '재고분석',
  'title_25': '재고현황',
  'title_26': '재고수불현황',
  'title_27': '용공수불(창고)',
  'title_28': '용공수불현황(거래처)',
  'title_29': '용공수불현황(영업담당)',

  // API Result Message
  'msg_api_success': '성공',
  'msg_api_400': '잘못된 요청입니다.',
  'msg_api_401': '유효한 인증 자격 증명이 없습니다.',
  'msg_api_500': '서버 에러입니다.',

  'msg_conn_api_server': '서버에 접속할 수 없습니다.',
  'msg_conn_auth_server': '인증서버에 접속할 수 없습니다.',

  // OverAll Item Title
  'appbar_title_overall_status': '종합 현황',
  'sales_title_totAmt': '매출액',
  'sales_title_suppAmt': '공급가',
  'sales_title_vatAmt': '부가세',
  'sales_title_grntAmt': '보증금',
  'deposit_title_retrvAmt': '회수액',
  'deposit_title_ipTot': '입금액',
  'deposit_title_amt': '채권잔액',

  'purchase_title_boTotAmt': '매입액',
  'purchase_title_suppAmt': '공급가',
  'purchase_title_vatAmt': '부가세',
  'purchase_title_grntAmt': '보증금',
  'return_title_oTot': '반납액',
  'withdraw_title_outTot': '출금액',
  'withdraw_title_amt': '채무잔액',

  'rental_title_lendAmt': '대여금액',
  'rental_title_inspayLendAmt': '회수예정금액',
  'rental_title_retrvAmt': '회수금액',
  'rental_title_remAmt': '미회수잔액',
  'rental_title_totAmt': '대여금잔액',

  'asset_title_totQty': '신규대여수량',
  'asset_title_totAmt': '신규대여금액',


  //Sales Daily
  'employee_name': '담당자',
  'division_name': '구분',
  'supplement_amount': '공급가',
  'vat_amount': '부가세',
  'guarantee_amount': '보증금합계',
  'purchase_cost': '매입원가',
  'profit_amount': '매출이익',
  'deposit_cash': '입금소계',
  'deposit_empty_case_bottle': '용공입금',
  'deposit_amount': '입금합계',
  'bond_balance': '채권잔액',




};

//const Map<String,String> enUs = {};
