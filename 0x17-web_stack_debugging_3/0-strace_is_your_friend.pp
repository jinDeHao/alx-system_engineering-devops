# match phpp replace by php
exec { 'fix error':
        command  => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
        path     => ['/usr/bin', '/bin'],
}
