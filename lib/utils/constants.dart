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
const ROUTE_MENU_CUSTOMER_REPORT = '/customer'; // 거래처별 매출현황
const ROUTE_MENU_CUSTOMER_REPORT_MONTHLY = '/customer-monthly'; // 월별 매출현황

// purchase (매입분석)

// support (지원현황)

// location (위치조회)
const ROUTE_MENU_VENDORLOCATION = '/vendor-location'; // 매출처 위치조회

// stock (재고분석)

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
const CONNECT_TIMEOUT = 15;
const RECEIVE_TIMEOUT = 10;

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
const API_SYSTEM_COMMON_PARAM = 'AMC002,ABS010'; // 시스템 코드

// common
const API_COMMON = '/v1/common';
const API_COMMON_CUSTOMER = '/customers';
const API_COMMON_ITEM = '/items';
const API_COMMON_LENDITEM = '/lend-items';

// management (경영분석)
const API_MANAGEMENT = '/v1/views/management';
const API_MANAGEMENT_OVERALL = '/total'; // 종합현황
const API_MANAGEMENT_DAILYSTATUS = '/daily'; // 영업일보
const API_MANAGEMENT_CONTRIBUTIONEMPLOYEE = '/contribution-status-employee'; // 영원사원별 기여현황
const API_MANAGEMENT_CONTRIBUTIONCUSTOMER = '/contribution-status-customer'; // 매출처별 기여현황
const API_MANAGEMENT_CLASSSTATUS = '/sales-class-status'; // 판매분류별 현황
const API_MANAGEMENT_RANKSTATUS = '/sales-rank-status'; // 매출순위현황
const API_MANAGEMENT_GRAPH = '/analysis-graph'; // 분석 그래프
const API_MANAGEMENT_DIVISIONSTATUS = '/daily-division-status'; // 영업일보(용도별)

// sales (영업분석)
const API_SALES = '/v1/views/sales';
const API_SALES_CUSTOMERINFO = '/customer-info'; // 매출처 현황
const API_SALES_SALESPERSONREPORT = '/sales-rep'; // 영업사원별 매출현황
const API_SALES_SALESPERSONREPORT_MONTHLY = '/sales-rep-monthly'; // 영업사원별 매출현황
const API_SALES_CUSTOMERREPORT = '/customer'; // 영업사원별 매출현황
const API_SALES_CUSTOMERREPORT_MONTHLY = '/customer-monthly'; // 월별 매출현황

// purchase (매입분석)

// support (지원현황)

// location (위치조회)

// stock (재고분석)

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
