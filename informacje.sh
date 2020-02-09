echo ========================================================
echo informacje o systemie
uname -a
echo ========================================================
echo informacje o uzytkownikach
users
echo ========================================================
echo informacje o procesach
ps
echo ========================================================
echo informacje o konfiguracji sieciowej
ifconfig
read v;
while [ $v != 0 ] ; do
read v;
done
