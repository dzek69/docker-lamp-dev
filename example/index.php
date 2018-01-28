<?php

$name = time().".txt";
$value = rand(1, 100);

file_put_contents($name, $value);

die(sprintf("See %s for %s", $name, $value));