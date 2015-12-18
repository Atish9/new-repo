name             'atishword'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures atishword'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'




depends 'database'
depends 'mysql'
depends 'apt'
depends 'smf'
depends 'rbac'
depends 'mysql2_chef_gem'
depends 'httpd'
depends 'selinux'
depends 'openssl'
depends 'php-fpm'
depends 'php'