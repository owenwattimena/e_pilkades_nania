
// ignore_for_file: constant_identifier_names

// const String BASE_URL = 'http://192.168.183.82/e-pilkades-nania/public';
const String BASE_URL = 'http://e-pilkades-nania.herokuapp.com';
const String BASE_API_URL = '$BASE_URL/api/v1';
const String LOGOUT_URL = '$BASE_API_URL/keluar';
const String LOGIN_URL = '$BASE_API_URL/masuk';
const String REGISTER_URL = '$BASE_API_URL/daftar';
const String USER_URL = '$BASE_API_URL/user';
const String CALKADES_URL = '$BASE_API_URL/calon-kepala-desa';
const String PERIODE_URL = '$BASE_API_URL/periode-aktif';
const String PEMILIHAN_URL = '$BASE_API_URL/pemilihan';
const String CHECK_PEMILIHAN_URL = '$BASE_API_URL/pemilihan-check'; 
const String HASIL_PEMILIHAN_URL = '$BASE_API_URL/hasil-pemilihan';
const String TOTAL_SUARA_URL = '$BASE_API_URL/hasil-pemilihan/total-suara';
// const String HOBBIES_URL = BASE_API_URL + '/references/hobi';
// const String TREATMENT_URL = BASE_API_URL + '/treatment';
// const String IDENTITIES_URL = BASE_API_URL + '/identies';
// const String EFIKASI_URL = BASE_API_URL + '/references/tes_efikasi';
const int REQUEST_SUCCESS = 200;
const int UNAUTHORIZED = 401;
const int INTERNET_ERROR = 503;
const int TIME_DURATION = 60;
const int BAD_REQUEST = 30;
const int REQUEST_TIME_OUT = 408;
