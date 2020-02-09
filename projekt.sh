flaga=0
m=1
while [ $flaga -eq 0 ]
do
echo ===========================================================
echo Menu
echo Wybierz opcje konfiguracyjna wpisz cyfre
echo 1.po uruchomieniu systemu wlaczy sie program firefox
echo 2.po uruchomieniu systemu wlaczy sie wybrana prezentacja
echo 3.po uruchomieniu systemu wlaczy sie wybrany film
echo 4.po uruchomieniu systemu wlaczy sie wybrany wygaszacz ekranu
echo 5.po uruchomieniu systemu pokaza sie informacje o systemie
echo 6.podaj czas po ktorym na sie system zresetowac [s]
echo 7.resetuj ustawienia
echo 8.zakoncz prace i zresetuj komputer
read opcja
echo ===========================================================
echo wybrano $opcja
echo ===========================================================
case $opcja in
  1)echo ===========================================================
  echo po uruchomieniu systemu wlaczy sie program firefox
  rm /home/stokrotka/.config/autostart/*.*
  cp '/usr/share/applications/firefox.desktop' '/home/stokrotka/.config/autostart'
  #cp '/home/stokrotka/Desktop/projekt/projekt.desktop' '/home/stokrotka/.config/autostart'
  ;;
  2)echo ===========================================================
  echo 2.po uruchomieniu systemu wlaczy sie wybrana prezentacja
  echo czy chcesz uruchomic domyslna prezentacje?[t/n]
  read prez
  if [ $prez == 't' ]; then
    echo '#!/bin/bash' > '/home/stokrotka/Desktop/projekt/run_prez.sh'
    echo libreoffice --impress --show /home/stokrotka/Desktop/projekt/prezentacje/prezentacja1.odp >> '/home/stokrotka/Desktop/projekt/run_prez.sh'
    echo 'bash /home/stokrotka/Desktop/projekt/projekt.sh' >> '/home/stokrotka/Desktop/projekt/run_prez.sh'
  else
    echo podaj sciezke
    read path
    echo '#!/bin/bash' > '/home/stokrotka/Desktop/projekt/run_prez.sh'
    echo libreoffice --impress --show  $path >> '/home/stokrotka/Desktop/projekt/run_prez.sh'
    echo 'bash /home/stokrotka/Desktop/projekt/projekt.sh' >> '/home/stokrotka/Desktop/projekt/run_prez.sh'
  fi
  rm /home/stokrotka/.config/autostart/*.*
  cp '/home/stokrotka/Desktop/projekt/prez.desktop' '/home/stokrotka/.config/autostart'
  ;;
  3)echo ===========================================================
  echo 3.po uruchomieniu systemu wlaczy sie wybrany film
  echo czy chcesz uruchomic domyslny film?[t/n]
  read film
  if [ $film == 't' ]; then
    echo 'sleep 5s' > '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo xdg-open /home/stokrotka/Desktop/projekt/filmy/gumisie.mp4  >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo sleep 10s  >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo bash /home/stokrotka/Desktop/projekt/projekt.sh  >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
  else
    echo podaj sciezke
    read path
    echo '#!/bin/bash' > '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo xdg-open  $path >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo 'sleep 10s'  >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
    echo 'bash /home/stokrotka/Desktop/projekt/projekt.sh' >> '/home/stokrotka/Desktop/projekt/run_movie.sh'
  fi
  rm /home/stokrotka/.config/autostart/*.*
  cp '/home/stokrotka/Desktop/projekt/film.desktop' '/home/stokrotka/.config/autostart'
  ;;
  4)echo ===========================================================
  echo po uruchomieniu systemu wlaczy sie wybrany wygaszacz ekranu
  xscreensaver-demo
  ;;
  5)echo ===========================================================
  echo 5.po uruchomieniu systemu pokaza sie informacje o systemie
  rm /home/stokrotka/.config/autostart/*.*
  cp '/home/stokrotka/Desktop/projekt/informacje.desktop' '/home/stokrotka/.config/autostart'
  ;;
  6)echo ===========================================================
  echo 6.podaj czas po ktorym na sie system zresetowac [m]
  read m
  ;;
  7)echo ===========================================================
  echo 7.resetuj ustawienia
  #usuniecie plikow z autostartu
  rm /home/stokrotka/.config/autostart/*.*
  #wylaczenie wygaszacza
  killall xscreensaver; xset dpms force on
  ;;
  8)echo ===========================================================
  flaga=1
  echo 8.zakoncz prace i zresetuj komputer
  shutdown -r +$m
  ;;
esac
done
