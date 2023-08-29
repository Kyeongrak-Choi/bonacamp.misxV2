/*
  System
 */

const APP_NAME = 'MISX Ver2';
const COPY_RIGHT = 'Copyright 2022. BONACAMP All rights reserved.';
const POLICY_URL = 'http://www.dionysoserp.com/ex-privacy.html';

enum NAVIGATION_BAR_ITEM { HOME, MY, MENU, PREMIUM, CONFIG } // Navigation Item

// Route
const ROUTE_LOGIN = '/login';
const ROUTE_NATIGATION = '/navigation';
const ROUTE_POLICY = '/policy';
const ROUTE_CONFIG = '/config';
const ROUTE_NOTICE = '/notice';
const ROUTE_SYSTEM_CONFIG = '/systemConfig';
const ROUTE_MENU_CONFIG = '/menuConfig';
const ROUTE_DIALOG_CUSTOMER = '/searchCustomer';
const ROUTE_DIALOG_PRODUCT = '/searchProduct';

const ROUTE_MENU_EXAMPLE = '/menuExample';
const ROUTE_API_EXAMPLE = '/apiExample';

/*
  Util
 */

// Snack Bar Type
enum SNACK_TYPE { INFO, ERROR, ALARM }

// Dialog Type
enum DIALOG_TYPE { SELECT, MSG } // SELECT : yes & no select

// Search Dialog Type
const SEARCH_DIALOG_CUST = 'CUST';
const SEARCH_DIALOG_PROD = 'PROD';

/*
  Netwrok Config
*/
const CONNECT_TIMEOUT = 5000;
const RECEIVE_TIMEOUT = 3000;

/*
 Authorization
*/
const CERT_URL_PROD = 'http://146.56.38.8:9000';
const CERT_URL_DEV = 'http://172.27.235.104:9040';
const API_BASIC = '/api';
const CERT_AUTH = '/auth';
const CERT_TOKEN = '/token';

//  Authorization Account
const AUTH_ID = 'diony-xps';
const AUTH_PW = '!@!diony-xps1234';
const AUTH_CLIENT_ID = 'Ym9uYS02NVNVN0ppazY0dUk3SWFNN0lxa0xWaFFVMEJBUUVCQVFFQkEtaQ==';

/*
 APIs
*/
const API_HEALTH_CHECK = '/health';
const API_ACCOUNT_GET = '/accounts';

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
const KEY_BASE_URL = 'baseUrl'; // target api url Key
const KEY_CUSTOM_FILTER = 'isCustomFilter'; // '거래처필터링 사용' Key
const KEY_INCLUDE_SALCHRG = 'isIncludeSalChrgCd'; // '영업사원 선택시 관리담당 포함' Key
const KEY_COMPARE_FIRST = 'isCompareFirst'; // '초성검색시 첫글자부터 비교' Key

const KEY_USERINFO = 'USERINFO'; // USERINFO Object key - @HiveType(typeId: 1)
const KEY_SALCHRG = 'SALCHRG'; // SALCHRG Object key - @HiveType(typeId: 2)
const KEY_NODE = 'NODE'; // NODE Object key - @HiveType(typeId: 3)
const KEY_TEAM = 'TEAM'; // TEAM Object key - @HiveType(typeId: 4)
const KEY_WH = 'WAREHOUSE'; // WAREHOUSE Object key - @HiveType(typeId: 5)
const KEY_COMMON = 'COMMON'; // COMMON Object key - @HiveType(typeId: 6)
const KEY_MENU = 'MENU'; // MENU Object key

/*
  Dummy data
 */

const DUMMY_CUST = 'lib/assets/json_dummy/customerList';
const DUMMY_PROD = 'lib/assets/json_dummy/productList';
const DUMMY_USER = 'lib/assets/json_dummy/userinfo';
const DUMMY_SALCHRG = 'lib/assets/json_dummy/salchrg';
const DUMMY_NODE = 'lib/assets/json_dummy/node';
const DUMMY_TEAM = 'lib/assets/json_dummy/team';
const DUMMY_WH = 'lib/assets/json_dummy/wh';

/*
  # Project Plan #
 1. Admin Page
  - Menu Manage
  - Admob Manage

 2. Package Naming Rule
  - new Package
  - use as-is package

 */