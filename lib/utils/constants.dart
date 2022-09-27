
/*
  System
 */
const APP_NAME = 'MISX Ver2';
const DARK_COLOR = 0xFF262D34; // common dark color value
const COMMON_COLOR = 0xFFCDECFA; // common color value
const COPY_RIGHT = 'Copyright 2022. BONACAMP All rights reserved.';
const POLICY_URL = 'http://www.dionysoserp.com/ex-privacy.html'; // Privacy Policy

enum NAVIGATION_BAR_ITEM { HOME, MY, MENU, PREMIUM, CONFIG } // Navigation Item


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


/*
  Json
 */
const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag


/*
  DB BOX
 */
const NM_USERINFO_BOX = 'USER_INFO'; // USER_INFO box name
const KEY_USERINFO_BOX = 'user';  // USER_INFO box key value
const NM_SALCHRG_BOX = 'SAL_CHRG'; // USER_INFO box name
const KEY_SALCHRG_BOX = 'salchrg';  // USER_INFO box key value
const NM_NODE_BOX = 'NODE'; // NODE box name
const KEY_NODE_BOX = 'node';  // NODE box key value


/*
  Dummy data
 */
const DUMMY_CUST = 'lib/assets/json_dummy/customerList';
const DUMMY_PROD = 'lib/assets/json_dummy/productList';
const DUMMY_USER = 'lib/assets/json_dummy/userinfo';
const DUMMY_SALCHRG = 'lib/assets/json_dummy/salchrg';
const DUMMY_NODE = 'lib/assets/json_dummy/node';
