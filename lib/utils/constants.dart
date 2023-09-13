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
const ROUTE_DIALOG_ITEM = '/searchItem';
const ROUTE_DIALOG_LENDITM = '/searchLendItem';

const ROUTE_MENU_EXAMPLE = '/menuExample';
const ROUTE_API_EXAMPLE = '/apiExample';

// Route 경영 분석
const ROUTE_MENU_OVERALL_STATUS = '/overallStatus';

/*
  Util
 */

// Snack Bar Type
enum SNACK_TYPE { INFO, ERROR, ALARM }

// Dialog Type
enum DIALOG_TYPE { SELECT, MSG } // SELECT : yes & no select

// Search Dialog Type
const SEARCH_DIALOG_CUST = 'CUST';
const SEARCH_DIALOG_ITEM = 'ITEM';
const SEARCH_DIALOG_LEND = 'LEND';

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

const API_SALES_OVERALL = '/v1/management/overall';

/*
  Json
 */

// common
const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag

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
