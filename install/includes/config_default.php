<?php
	$settings = array(


        ###### ADMIN ######
        'admin' => array(
            'max_upload_size' => '5242880',
            'upload_blacklist' => '/\\.(?:php[34567s]?|phtml)$/i',
        ),
        ########


        ###### SYMPHONY ######
        'symphony' => array(
            'admin-path' => 'symphony',
            'pagination_maximum_rows' => '20',
            'association_maximum_rows' => '5',
            'lang' => 'en',
            'pages_table_nest_children' => 'no',
            'version' => '2.7.10',
            'cookie_prefix' => 'sym-',
            'session_gc_divisor' => '10',
            'cell_truncation_length' => '75',
            'enable_xsrf' => 'yes',
            'error_reporting_all' => 'no',
        ),
        ########


        ###### LOG ######
        'log' => array(
            'archive' => '1',
            'maxsize' => '102400',
            'filter' => 24575,
        ),
        ########


        ###### DATABASE ######
        'database' => array(
            'host' => 'localhost',
            'port' => '3306',
            'user' => null,
            'password' => null,
            'db' => null,
            'tbl_prefix' => 'sym_',
            'query_caching' => 'on',
            'query_logging' => 'on',
        ),
        ########


        ###### PUBLIC ######
        'public' => array(
            'display_event_xml_in_source' => 'no',
        ),
        ########


        ###### GENERAL ######
        'general' => array(
            'sitename' => 'Marcin Kwietowicz',
            'useragent' => 'Symphony/2.7.10',
        ),
        ########


        ###### FILE ######
        'file' => array(
            'write_mode' => '0644',
        ),
        ########


        ###### DIRECTORY ######
        'directory' => array(
            'write_mode' => '0755',
        ),
        ########


        ###### REGION ######
        'region' => array(
            'time_format' => 'H:i:s',
            'date_format' => 'm/d/Y',
            'datetime_separator' => ' ',
            'timezone' => 'Europe/Warsaw',
        ),
        ########


        ###### CACHE_DRIVER ######
        'cache_driver' => array(
            'default' => 'database',
        ),
        ########


        ###### IMAGE ######
        'image' => array(
            'cache' => '1',
            'quality' => '90',
            'allow_origin' => null,
            'disable_regular_rules' => 'no',
            'disable_upscaling' => 'no',
            'disable_proxy_transform' => 'no',
        ),
        ########


        ###### MAINTENANCE_MODE ######
        'maintenance_mode' => array(
            'enabled' => 'no',
            'ip_whitelist' => null,
            'useragent_whitelist' => null,
        ),
        ########


        ###### ANTI-BRUTE-FORCE ######
        'anti-brute-force' => array(
            'restrict-access' => 'off',
            'remote-addr-key' => 'REMOTE_ADDR',
            'length' => '60',
            'failed-count' => '5',
            'gl-duration' => '30',
            'gl-threshold' => '5',
            'auto-unban' => 'off',
        ),
        ########


        ###### MEDIA_LIBRARY ######
        'media_library' => array(
            'min_width' => '200',
            'max_width' => '1920',
            'min_height' => '100',
            'max_height' => '1080',
            'min_file_size' => '0KB',
            'max_file_size' => '1MB',
            'min_image_size' => '0KB',
            'max_image_size' => '500KB',
            'output_quality' => '70',
        ),
        ########


        ###### FRONTEND_LOCALISATION ######
        'frontend_localisation' => array(
            'langs' => 'en,pl',
            'main_lang' => 'pl',
            'main_reg' => null,
        ),
        ########


        ###### HTML5_DOCTYPE ######
        'html5_doctype' => array(
            'exclude_pagetypes' => 'JSON',
        ),
        ########


        ###### SORTING ######
        'sorting' => array(
            'section_posts-category_sortby' => '17',
            'section_posts-category_order' => 'asc',
            'section_projects_sortby' => '18',
            'section_projects_order' => 'asc',
        ),
        ########


        ###### PAGE_LHANDLES ######
        'page_lhandles' => array(
            'op_mode' => 'strict',
        ),
        ########
    );
