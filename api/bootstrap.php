<?php

declare(strict_types=1);
require_once 'api/config/config.php';

// Custom autoloader
spl_autoload_register('mvcLoader');
function mvcLoader($className)
{
  // Check if file exists in lib directory
  if (file_exists('api/lib/' . $className . '.php')) {
    require_once 'api/lib/' . $className . '.php';
    return;
  };

  // If not, check mvc directories
  $mvc = ['model', 'controller', 'view'];
  do {
    $found = false;
    foreach ($mvc as $type) {
      $path = 'api/' . $type . 's/' . $className .  '.php';

      if (file_exists($path)) {
        require_once $path;
        $found = true;
        break;
      } else {
        continue;
      }
    }
  } while (!$found);
}