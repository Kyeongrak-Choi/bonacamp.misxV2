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
const SNACK_TYPE_INFO = 'I'; // info view snack bar type
const SNACK_TYPE_ERROR = 'E'; // error view snack bar type
const SNACK_TYPE_ALARM = 'A'; // alarm view snack bar type

// Dialog Type
const DIALOG_TYPE_SELECT = 'S'; // yes/no select dialog type
const DIALOG_TYPE_MSG = 'M'; // msg view dialog type

// Search Dialog Type
const SEARCH_DIALOG_CUST = 'C'; // customer search type
const SEARCH_DIALOG_PROD = 'P'; // product search type

/*
 APIs
*/

const API_URL = 'http://172.27.235.104:9000/api/v1/'; // test
const API_TEST1 = API_URL + 'health'; // test

const CONNECT_TIMEOUT = 5000;
const RECEIVE_TIMEOUT = 3000;

/*
  Json
 */

const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag

/*
  HIVE DB
 */

const LOCAL_DB = 'LOCAL_DB'; // Box name
const KEY_THEME_MODE = 'isDark'; // ThemeMode Key
const KEY_SAVED_ID = 'savedId'; // save id Key
const KEY_CUSTOM_FILTER = 'sCustomFilter'; // '거래처필터링 사용' Key
const KEY_INCLUDE_SALCHRG = 'isIncludeSalChrg'; // '영업사원 선택시 관리담당 포함' Key
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
