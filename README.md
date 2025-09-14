# Instalacion sitios web con DDEV

## Instalacion del sitio Castro's Store.
*Estos sitios se han versionados con archivos de configuración de DDev por tanto debes tener instalado en tu sistema Docker y DDev. Para una más facil instalacion de los sitios es recomendable una terminal linux, si estas trabajando con Windows utiliza en WSL2 de Windows para tener tu maquina Windows en tu computadora.*

#### Configuracion WSL2 en Windows
https://learn.microsoft.com/es-es/windows/wsl/install

#### Instalacion de Docker usando los repositorios de APT.
https://docs.docker.com/engine/install/ubuntu/

#### Instalacion de DDev.
 https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/#ddev-installation-linux

## Instalación del sitio Drupal 10.
*Al llegar a este punto ya debes contar con **WSL2**, **Docker** y **DDev**
Descarga el repositorio e ingresa al folder **castro-s-store**, Sigue los siguientes pasos para instalar el sitio:*
1. Ingresa al folder **castro-s-store**, este folder contiene los archivos principales del sitio web. `cd castro-s-store`
2. Ejecuta el comando `ddev start` desde la terminal.
3. Descarga el backup de la base de datos y colocala en la carpeta **castro-s-store**
4. Ejecuta la instalación de las dependencias de Composer. `ddev composer install`
5. Importa la base de datos a tu sitio `ddev import-db --file=./{nombredelbackup}`

Despues de ejecutar **ddev start**, aparecerá un mensaje con las url del sitio web creado.

------------
