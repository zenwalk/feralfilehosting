<?php
if ($_SERVER['HTTP_X_HOST'] != $_SERVER['HTTP_HOST']){  // HTTP_HOST is always the same format username.server.feralhosting.com
$xproxy = "/" . getenv("USER");                         // If the HOSTs don't match then insert this variable
} else {                                                // If they do match then do this instead
$xproxy = '';                                           // insert nothing. Basically, do nothing
}                                                       // close
?>