<?php

$aa = stat('sec.key');

print_r($aa);

echo '<br>';
echo '<br>';

echo sha1($aa[8]);

echo '<br>';
echo '<br>';

echo sha1($aa[7]);

echo '<br>';
echo '<br>';

echo base64_encode("\$dados = stat(LIBS_DIR . '/sec.key'); if (sha1(\$dados['atime']) != \$this->system->getKeySite()) {die;}");


//echo base64_decode('JGRhZG9zID0gc3RhdChMSUJTX0RJUiAuICcvc2VjLmtleScpOyBpZiAoc2hhMSgkZGFkb3NbJ2N0aW1lJ10pICE9ICR0aGlzLT5nZXRLZXlTaXRlKCkpIHtkaWUgKCc0MDE6IEFjY2VzcyBEZW5pZWQhJyk7fQ==');