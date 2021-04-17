#!/bin/bash

sudo cp -R /var/www/halim.website/* /var/TempBackupForHalimWebsite
cd /var/www/
sudo git clone https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/Halim.Website
sudo cp -R /var/www/Halim.Website/* /var/www/halim.website/
sudo rm -r Halim.Website/
cd
cd WebsiteUpdateFromRepo/
sudo rm rollback.txt
sudo curl -I https://halim.website > test.txt

if grep 'HTTP/2 200' "test.txt"; then
    echo -e "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/2 301' "test.txt"; then
    echo -e "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/1.1 200' "test.txt"; then
    echo -e "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/1.1 301' "test.txt"; then
    echo -e "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
else
    echo "rollback" > rollback.txt
    echo -e "Halim.Website/blog is not Working \e[91mSuccessfuly!\e[0m"
    echo -e "Halim.Website/blog is being \e[91mrolled back!\e[0m"
fi
    

sudo curl -I https://halim.website/blog > btest.txt 

if grep 'HTTP/2 200' "test.txt"; then
    echo -e "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/2 301' "test.txt"; then
    echo -e "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/1.1 200' "test.txt"; then
    echo -e "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
elif grep 'HTTP/1.1 301' "test.txt"; then
    echo -e "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
else
    echo "rollback" > rollback.txt
    echo -e "Halim.Website/blog is not Working \e[91mSuccessfuly!\e[0m"
    echo -e "Halim.Website/blog is being \e[91mrolled back!\e[0m"
fi

if grep 'rollback' "rollback.txt"; then
####echo "rollback success"
    sudo cp -R /var/TempBackupForHalimWebsite/* /var/www/halim.website/
fi

