# match phpp replace by php
exec { 'fix error':
        command  => 'sed -i s/phpp/php/g file',
        path     => ['/usr/bin', '/bin'],
}
