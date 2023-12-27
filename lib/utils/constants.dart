/*
  System
 */

const APP_NAME = 'MISX Ver2';
const COPY_RIGHT = 'Copyright 2023. BONACAMP All rights reserved.';
const POLICY_URL = 'http://www.dionysoserp.com/ex-privacy.html';
const APP_ID = 'MISX';

enum NAVIGATION_BAR_ITEM {
  MENU,
  HOME,
  CONFIG,
} // Navigation Item

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Route
 */

// System
const ROUTE_LOGIN = '/login';
const ROUTE_NATIGATION = '/navigation';
const ROUTE_POLICY = '/policy';
const ROUTE_CONFIG = '/config';
const ROUTE_NOTICE = '/notice';
const ROUTE_SYSTEM_CONFIG = '/systemConfig';
const ROUTE_MENU_CONFIG = '/menuConfig';
const ROUTE_EXAM_MENU = '/menuConfig';
const ROUTE_DIALOG_CUSTOMER = '/searchCustomer';
const ROUTE_DIALOG_PURCHASE = '/searchPurchase';
const ROUTE_DIALOG_ITEM = '/searchItem';
const ROUTE_DIALOG_LENDITM = '/searchLendItem';

// management (경영분석)
const ROUTE_MENU_OVERALL_STATUS = '/overallStatus'; // 종합현황
const ROUTE_MENU_SALES_DAILY = '/salesDaily'; // 영업일보
const ROUTE_MENU_OVERALL_DAILYSTATUS = '/daily-status'; // 영업일보
const ROUTE_MENU_SALESPERSON_CONTRIBUTE = '/contribution-status-employee'; // 영업사원별 기여현황
const ROUTE_MENU_CONTRIBUTION_STATUS_CUSTOMER = '/contribution-status-customer'; // 매출처별 기여현황
const ROUTE_MENU_CLASSSTATUS = '/sales-class-status'; // 판매분류별 현황
const ROUTE_MENU_RANKSTATUS = '/sales-rank-status'; // 매출순위현황
const ROUTE_MENU_GRAPH = '/analysis-graph'; // 분석 그래프
const ROUTE_MENU_DIVISIONSTATUS = '/daily-division-status'; // 영업일보(용도별)

// sales (영업분석)
const ROUTE_MENU_CUSTOMER_INFO = '/customer-info'; // 거래처 현황
const ROUTE_MENU_SALESPERSON_REPORT = '/sales-rep'; // 영업사원별 매출현황
const ROUTE_MENU_SALESPERSON_REPORT_MONTHLY = '/report-monthly'; // 영업사원별 월별 매출현황
const ROUTE_MENU_CUSTOMER_REPORT = '/customer'; // 매출현황
const ROUTE_MENU_CUSTOMER_REPORT_MONTHLY = '/customer-monthly'; // 월별 매출현황
const ROUTE_MENU_SALES_LEDGER = '/ledger'; // 매출원장
const ROUTE_MENU_ACHIEVEMENT = '/achievement'; // 목표대비 실적현황
const ROUTE_MENU_BALANCE_REPORT = '/debt'; // 채권현황
const ROUTE_MENU_BALANCE_RENTAL_REPORT = '/rent-debt'; // 채권 및 대여 현황
const ROUTE_MENU_SALES_RENTAL_LEDGER = '/rent-ledger'; // 매출 및 대여 원장
const ROUTE_MENU_ITEM_STATUS = '/item-status'; // 품목 현황

// purchase (매입분석)
const ROUTE_MENU_PURCHASE_REPORT = '/purchase-report'; // 매입현황
const ROUTE_MENU_PURCHASE_LEDGER = '/purchase-ledger'; // 매입원장

// support (지원현황)
const ROUTE_MENU_SUPPORT_RENTAL_REPORT = '/rental-report'; // 대여금 현황
const ROUTE_MENU_SUPPORT_RENT_ASSET = '/rent-asset'; // 대여자산 현황
const ROUTE_MENU_SUPPORT_RENT_ASSET_HISTORY = '/rent-asset-history'; // 대여자산 현황(이력)

// location (위치조회)
const ROUTE_MENU_VENDORLOCATION = '/vendor-location'; // 매출처 위치조회

// stock (재고분석)
const ROUTE_MENU_INVENTORY_REPORT = '/inventory-report'; // 재고현황
const ROUTE_MENU_INVENTORY_INOUT_REPORT = '/inventory-in-out-report'; // 재고수불현황
const ROUTE_MENU_LEND_REPORT_WAREHOUSE = '/lend-report-warehouse'; // 용공수불현황(창고)
const ROUTE_MENU_LEND_REPORT_CUSTOMER = '/lend-report-customer'; // 용공수불현황(거래처)
const ROUTE_MENU_LEND_REPORT_SALESPERSON = '/lend-report-salesperson'; // 용공수불현황(거래처)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Util
 */

// Snack Bar Type
enum SNACK_TYPE { INFO, ERROR, ALARM }

// Dialog Type
enum DIALOG_TYPE { SELECT, MSG, NOTICE } // SELECT : yes & no select

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Netwrok Config
*/
const CONNECT_TIMEOUT = 120;
const RECEIVE_TIMEOUT = 120;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 Authorization
*/
const CERT_URL_PROD = 'http://auth.bona-camp.com/api';
const CERT_URL_DEV = 'http://130.162.137.207:9040/api';
const CERT_AUTH = '/auth';
const CERT_TOKEN = '/token';

//  Authorization Account
const AUTH_ID = 'diony-xps';
const AUTH_PW = '!@!diony-xps1234';
const AUTH_CLIENT_ID = 'Ym9uYS02NVNVN0ppazY0dUk3SWFNN0lxa0xWaFFVMEJBUUVCQVFFQkEtaQ==';

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 APIs
*/
const API_SERVER_CODE = 'DJWRLDPN0U'; // 디오니소스 ERP MOBILE 경영관리 데이터 서버 코드값
const API_REQ_GET = 'GET';
const API_REQ_POST = 'POST';

// System
const API_SYSTEM_LOGIN = '/v1/account/sign-in';
const API_SYSTEM_MASTER = '/v1/clients/';
const API_SYSTEM_EMPLOYEES = '/employees';
const API_SYSTEM_BRANCHES = '/branches';
const API_SYSTEM_TEAMS = '/teams';
const API_SYSTEM_WAREHOUSES = '/warehouses';
const API_SYSTEM_COMMON = '/v1/main/common';
const API_SYSTEM_COMMON_PARAM = 'AMC002,ABS010,ABS014,ABS018,ASS021,ABS013,ARI003'; // 시스템 코드
const API_SYSTEM_DASHBOARD = '/total-v2'; // 대시보드

// common
const API_COMMON = '/v1/common';
const API_COMMON_CUSTOMER = '/customers';
const API_COMMON_ITEM = '/items';
const API_COMMON_LENDITEM = '/lend-items';

// management (경영분석)
const API_MANAGEMENT = '/v1/views/management';
const API_MANAGEMENT_OVERALL = '/total'; // 종합현황
const API_MANAGEMENT_DAILYSTATUS = '/daily'; // 영업일보
const API_MANAGEMENT_SERVE = '/serve/sales-rep'; // 영원사원별 기여현황
const API_MANAGEMENT_CONTRIBUTIONCUSTOMER = '/serve/sales-distination'; // 매출처별 기여현황
const API_MANAGEMENT_CLASSSTATUS = '/serve/sales-class'; // 판매분류별 현황
const API_MANAGEMENT_RANKSTATUS = '/sales-rank-rep'; // 매출순위현황
const API_MANAGEMENT_GRAPH = '/analysis-graph'; // 분석 그래프
const API_MANAGEMENT_DIVISIONSTATUS = '/daily-division'; // 영업일보(용도별)

// sales (영업분석)
const API_SALES = '/v1/views/sales';
const API_SALES_CUSTOMERINFO = '/customer-info'; // 매출처 현황
const API_SALES_SALESPERSONREPORT = '/sales-rep'; // 영업사원별 매출현황
const API_SALES_SALESPERSONREPORT_MONTHLY = '/sales-rep-monthly'; // 영업사원별 매출현황
const API_SALES_CUSTOMERREPORT = '/customer'; // 영업사원별 매출현황
const API_SALES_CUSTOMERREPORT_MONTHLY = '/customer-monthly'; // 월별 매출현황
const API_SALES_SALESLEDGER = '/ledger'; // 매출원장
const API_SALES_ITEMSTATUS = '/item'; // 품목 현황

const API_SALES_ACHIEVEMENT = '/achievement'; // 목표대비 실적현황
const API_SALES_BALANCEREPORT = '/debt'; // 채권현황
const API_SALES_BALANCERENTALREPORT = '/rent-debt'; // 채권 및 대여 현황
const API_SALES_SALESRENTALLEDGER = '/rent-ledger'; // 매출 및 대여 원장

// purchase (매입분석)
const API_PURCHASE = '/v1/views/purchase';
const API_PURCHASE_REPORT = '/report'; // 매입현황
const API_PURCHASE_LEDGER = '/ledger'; // 매입원장

// support (지원현황)
const API_SUPPORT = '/v1/views/support';
const API_SUPPORT_RENTALREPORT = '/rental'; // 대여금 현황
const API_SUPPORT_RENT_ASSET = '/rent-asset'; // 대여자산 현황
const API_SUPPORT_RENT_ASSET_HISTORY = '/rent-asset-history'; // 대여자산 현황(이력)

// location (위치조회)
const API_LOCATION = '/v1/views/location';
const API_LOCATION_CUSTOMER = '/customer'; // 매출처 위치조회

// stock (재고분석)
const API_INVENTORY = '/v1/views/inventory';
const API_INVENTORY_REPORT = '/report'; // 재고현황
const API_INVENTORY_INOUT_REPORT = '/in-out-report'; // 재고수불현황
const API_LEND_REPORT_WAREHOUSE = '/warehouse-report'; // 용공수불현황(창고)
const API_LEND_REPORT_CUSTOMER = '/package-in-out-report'; // 용공수불현황(거래처)
const API_LEND_REPORT_SALESPERSON = '/sales-rep-report'; // 용공수불현황(영업사원)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Json
 */

// common
const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag
const TAG_ERROR = 'errors'; // response error tag
const TAG_RETURN_OBJECT = 'data'; // response data object tag
const TAG_RETURN_LIST_OBJECT = 'data-list'; // response data-list object tag

// Authorization
const TAG_TOKEN = 'token'; // response token tag
const TAG_GRANT_TYPE = 'grant-type'; // response token - grant type tag
const TAG_ACCESS_TOKEN = 'access-token'; // response token - access token tag
const TAG_TOKEN_EXPIRE_TIME = 'access-token-expiration-time'; // response token - expire time tag
const TAG_ISSUE_DATE = 'issue_date'; // response token - issue-date tag

const TAG_SERVER = 'server'; // response server tag
const TAG_SERVER_CODE = 'server-code'; // response server - server code tag
const TAG_SERVER_NAME = 'server-name'; // response server - server name tag
const TAG_RESOURCE_URL = 'resource-url'; // response server - resource url tag
const TAG_MEMO = 'memo'; // response server - server memo tag
const TAG_STATUS = 'status'; // response server - status tag
const TAG_ROLE_IDS = 'role-ids'; // response server - role-ids tag

// Dashboard
const TAG_CURRENT = 'current';
const TAG_MONTH = 'month';

// sales
const TAG_SALES = 'sales';
const TAG_PURCHASE = 'purchase';
const TAG_DEPOSIT = 'deposit';
const TAG_WITHDRAW = 'withdraw';
const TAG_RETURN = 'return';
const TAG_RENTAL = 'rental';
const TAG_ASSET = 'asset';
const TAG_REPRESENTATIVE = 'representative';
const TAG_EMPLOYEE = 'employee';
const TAG_SALESSUMMARIES = 'sales-summaries';

const TAG_DATA_LIST = 'data-list';
const TAG_GRAPH_BOND = 'bond';
const TAG_GRAPH_DEBT = 'debt';

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  HIVE DB
 */

const LOCAL_DB = 'LOCAL_DB'; // Box name
const KEY_THEME_MODE = 'isDark'; // ThemeMode Key
const KEY_SAVED_ID = 'savedId'; // save id Key
const KEY_SAVED_TOKEN = 'token'; // save token Key
const KEY_AUTH_URL = 'baseUrl'; // auth api url
const KEY_BASE_URL = 'baseUrl'; // target api url Key
const KEY_SHOW_ADMOB = 'isShowAdmob'; // 광고 보기 Key
const KEY_CUSTOM_FILTER = 'isCustomFilter'; // '거래처필터링 사용' Key
const KEY_INCLUDE_SALCHRG = 'isIncludeSalChrgCd'; // '영업사원 선택시 관리담당 포함' Key
const KEY_COMPARE_FIRST = 'isCompareFirst'; // '초성검색시 첫글자부터 비교' Key

const KEY_USERINFO = 'USERINFO'; // USERINFO Object key - @HiveType(typeId: 1)
const KEY_EMPLOYEE = 'EMPLOYEE'; // SALCHRG Object key - @HiveType(typeId: 2)
const KEY_BRANCH = 'BRANCH'; // BRANCH Object key - @HiveType(typeId: 3)
const KEY_TEAM = 'TEAM'; // TEAM Object key - @HiveType(typeId: 4)
const KEY_WH = 'WAREHOUSE'; // WAREHOUSE Object key - @HiveType(typeId: 5)
const KEY_COMMON = 'COMMON'; // COMMON Object key - @HiveType(typeId: 6)
const KEY_MENU = 'MENU'; // MENU Object key
