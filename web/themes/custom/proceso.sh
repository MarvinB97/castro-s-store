ddev drush cr
ddev drush theme:enable $CUSTOM_BARRIO -y
ddev drush config-set system.theme default $CUSTOM_BARRIO -y
grep -R "Bootstrap Barrio" .
