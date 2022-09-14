// ignore_for_file: non_constant_identifier_names

//Domain
String domain =
    'https://tccposbackendgateway.azurewebsites.net'; //https://posmcmc-dev.thaibevapp.com,/https://tccposbackendgateway.azurewebsites.net
String domain_apk =
    'https://pos-s3uat.thaibevapp.com'; //https://pos-s3uat.thaibevapp.com //https://pos-s3.thaibevapp.com

//Version
String version_path = 'v1';

//Namespace
String security_namespace = '$domain/security/api/$version_path';
String sale_namespace = '$domain/sale/api/$version_path';
String report_namespace = '$domain/report/api/$version_path';
String application_namespace = "$domain_apk/application";

// Security API
String check_version_path = '$security_namespace/CheckVersion';
String general_info_path = '$security_namespace/GeneralInfo';
String login_path = '$security_namespace/Login';
String logout_path = '$security_namespace/Logout';
String pos_config_path = '$security_namespace/POSConfig';

//Sale API
String branch_path = '$sale_namespace/Branch';
String brand_path = '$sale_namespace/Brand';
String pos_client_running_path = '$sale_namespace/POSClient/POSRunning';
String prod_cate_path = '$sale_namespace/ProductCat';
String prod_group_path = '$sale_namespace/ProductGroup';
String product_size_path = '$sale_namespace/ProductSize';
String product_unit_path = '$sale_namespace/ProductUnit';
String sale_order_path = '$sale_namespace/SaleOrder';
String sale_order_by_date_path = '$sale_namespace/ByDate';
String shift_path = '$sale_namespace/Shift';
String coupon_status_path = '$sale_namespace/Coupon/Status';

// Sale/SKU -> API
String sku_path = '$sale_namespace/SKU';
String sku_post_service = "$sku_path/BranchPrice";
String sku_branch_price_path = '$sku_path/BranchPrice';
String sku_lookup_barcode_pos_path = '$sku_path/Lookup/BarcodePOS';

// Report API
String dashboard_path = '$report_namespace/Dashboard';
String maximizing_report_path = '$report_namespace/MaximizingReport';
String report_chart_path = '$report_namespace/ReportChart';
String sale_history_path = '$report_namespace/SaleHistory';
String payment_report_path = '$report_namespace/PaymentReport';

//File APK Update
String update_file_apk = '$domain_apk/app-release-';
