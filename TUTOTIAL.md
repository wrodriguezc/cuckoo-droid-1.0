Mini tutorial en español
========================

Preparación de dependencias de Linux
------------------------------------

Ejecute los siguientes comandos:

    sudo apt update
    sudo apt upgrade
    sudo apt install git
    sudo apt install lib32stdc++6
    sudo apt install python python-pip python-dev libffi-dev libssl-dev
    sudo apt install libxml2-dev libxslt1-dev libjpeg8-dev
    sudo apt install python-virtualenv python-setuptools
    sudo apt install libjpeg-dev zlib1g-dev swig
    sudo apt install postgresql libpq-dev
    sudo apt install mongodb
    sudo apt install libvirt-bin libvirt-dev
    sudo apt install openjdk-8-jre-headless

Descargar la última versión estable de Android Studio
-----------------------------------------------------

Ejecute los siguientes comandos para descargar y corrar la última versión estable de Android Studio: 

    wget https://dl.google.com/dl/android/studio/ide-zips/3.1.3.0/android-studio-ide-173.4819257-linux.zip
    unzip android-studio-ide-173.4819257-linux.zip -d .
    cd ~/android-studio/bin/
    ./studio.sh

Descargue el SDK y cree un emulador de acuerdo con esta guía: 

http://cuckoo-droid.readthedocs.io/en/latest/installation/guest_android_avd/requirements/


Por favor notar lo siguiente:

* Necesita una imágen vacía de un SD card, más abajo encontrará instrucciones para hacerlo.
* En esta guía el emulador ha sido nombrado 'nexus_one_arm'. Debe reemplazar nexus_one_arm con el nombre que haya utilizado para su emulador.
* Esta guía sirvió solo con el emulador de Nexus One para ARM, Android 4.1.


Configurar las rutas del SDK de Android
---------------------------------------

    pico ~/.profile
    $HOME/Android/Sdk/emulator:$HOME/Android/Sdk/emulator:$HOME/Android/Sdk/platform-tools

Se debe tener cuidado con el orden de los directorios, ya que existen dos comandos llamados 'emulator'

Crear una SD vacía de 256MB para el emulador
-------------------------------------------

    ~/Android/Sdk/tools
    ./mksdcard -l SDCARD 256M ~/mysdcard


Lanzar el emulador con la partición de sistema en modo escritura y hacer root
-----------------------------------------------------------------------------

Ejecutar los siguientes comandos:

    emulator -avd nexus_one_arm -writable-system

Una vez lanzado el emulador ejecute:

    cd ~/cuckoo-droid-1.0/utils/android_emulator_creator
    ./create_guest_avd.sh

Finalmente siga la guía descrita acá para configurar el root y las aplicaciones de análisis:

http://cuckoo-droid.readthedocs.io/en/latest/installation/guest_android_avd/requirements/

¡Ojo, no cerrar el emulador todavía!

El emulador va a crear una copia temporal de la partición de sistema y la va a ubicar en una ruta similar a la descrita abajo:

    /tmp$ cd android-username/
    /tmp/android-username$ ls
    6f67aee3-0e86-48b7-b859-5dc13f124e9b  adbcommand3b7793d7-7dd1-4d8b-86c5-9fa776fa5ff1  adbcommandd2e8b337-2c77-41fd-ad64-001e3ec5041b  ccf407a4-a2bd-4f1b-a9a2-fc72b8c514ff  emulator-bQzxJp

Note que:

* En android-username, 'username' corresponde a su usuario de sistema
* emulator-bQzxJp es el archivo que nos interesa, el nombre es aleatorio pero siempre se va a presentar en una forma simililar a esta

Copie el archivo a la carpeta del emulador con los siguientes comandos:

    ~/.android/avd/nexus_one_arm.avd/
    cp /tmp/android-william/emulator-bQzxJp  ~/.android/avd/nexus_one_arm.avd/system.img

Incremente el numero de archivos que puede abrir al mismo tiempo
----------------------------------------------------------------

    sudo pico /etc/sysctl.conf
    fs.file-max = 2097152
    sudo sysctl -p

Obtenga una copia de Cuckoo localmente
--------------------------------------

    git clone https://github.com/wrodriguezc/cuckoo-droid-1.0.git
    cd cuckoo-droid-1.0
    pip install -r requirements.txt