/*
  System
 */

const APP_NAME = 'MISX Ver2';
const COPY_RIGHT = 'Copyright 2022. BONACAMP All rights reserved.';
const POLICY_URL = 'http://www.dionysoserp.com/ex-privacy.html';
const APP_ID = 'MISX';

//enum NAVIGATION_BAR_ITEM { HOME, MY, MENU, PREMIUM, CONFIG } // Navigation Item
enum NAVIGATION_BAR_ITEM { HOME, MENU, CONFIG } // Navigation Item

// Route
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

const ROUTE_MENU_EXAMPLE = '/menuExample';
const ROUTE_API_EXAMPLE = '/apiExample';

// Route
// 경영 분석
const ROUTE_MENU_OVERALL_STATUS = '/overallStatus'; // 종합현황
const ROUTE_MENU_SALES_DAILY = '/salesDaily'; // 영업일보
const ROUTE_MENU_SALESPERSON_CONTRIBUTE = '/salesPersonContribute'; // 영업사원별 기여현황

/*
  Util
 */

// Snack Bar Type
enum SNACK_TYPE { INFO, ERROR, ALARM }

// Dialog Type
enum DIALOG_TYPE { SELECT, MSG } // SELECT : yes & no select

// Search Dialog Type
const SEARCH_DIALOG_CUST = 'CUST'; // 거래처(매출처) 검색
const SEARCH_DIALOG_PRCH = 'PRCH'; // 거래처(매입처) 검색
const SEARCH_DIALOG_ITEM = 'ITEM'; // 품목 검색
const SEARCH_DIALOG_LEND = 'LEND'; // 품목(용기공병) 검색

/*
  Netwrok Config
*/
const CONNECT_TIMEOUT = 15;
const RECEIVE_TIMEOUT = 10;

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
const API_SYSTEM_COMMON_PARAM = 'ABS014,OBA003, ABS013, ABS022, AMC002, ABS018,ARI003,ABS010,ASS021'; // 시스템 코드

// common
const API_COMMON = '/v1/common';
const API_COMMON_CUSTOMER = '/customer';
const API_COMMON_PURCHASE = '/purchase';
const API_COMMON_ITEM = '/item';
const API_COMMON_LENDITEM = '/lend-item';

// management
const API_MANAGEMENT = '/v1/management'; // 경영관리
const API_MANAGEMENT_OVERALL = '/overall'; // 종합현황
const API_MANAGEMENT_SALESDAILY = '/sales-daily'; // 영업일보
const API_MANAGEMENT_SALESPERSONCONTRIBUTE = '/sales-person-contribute'; // 영원사원별 기여현황

/*
  Json
 */

// common
const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag
const TAG_ERROR = 'errors'; // response error tag
const TAG_RETURN_OBJECT = 'data'; // response data object tag

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

const TAG_COMMON_CUSTOMER = 'customerList';
const TAG_COMMON_PURCHASE = 'purchaseList';
const TAG_COMMON_ITEM = 'itemList';
const TAG_COMMON_LENDITEM = 'lendItemList';

// sales
const TAG_SALES = 'sales';
const TAG_PURCHASE = 'purchase';
const TAG_DEPOSIT = 'deposit';
const TAG_WITHDRAW = 'withdraw';
const TAG_RETURN = 'return';
const TAG_RENTAL = 'rental';
const TAG_ASSET = 'asset';

const TAG_SALESDAILY_LIST = 'data-list';

/*
  HIVE DB
 */

const LOCAL_DB = 'LOCAL_DB'; // Box name
const KEY_THEME_MODE = 'isDark'; // ThemeMode Key
const KEY_SAVED_ID = 'savedId'; // save id Key
const KEY_SAVED_TOKEN = 'token'; // save token Key
const KEY_AUTH_URL = 'baseUr;'; // auth api url
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

/*
  # Project Plan #
 1. Admin Page
  - Menu Manage
  - Admob Manage

 2. Package Naming Rule
  - new Package
  - use as-is package

 */
