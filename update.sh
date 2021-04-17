#!/bin/bash

#sudo cp -R /var/www/halim.website/* /var/TempBackupForHalimWebsite
#cd /var/www/
#sudo git clone https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/Halim.Website
#sudo cp -R /var/www/Halim.Website/* /var/www/halim.website/
#sudo rm -r Halim.Website/

do
curl -I https://halim.website > test.txt
curl -I https://halim.website/blog > btest.txt 

if grep '200' "test.txt"; then
    echo "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
elif grep '301' "test.txt"; then
    echo "Halim.Website is Working \e[92mSuccessfuly!\e[0m"
elif grep '200' "test.txt"; then
    echo "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
elif grep '301' "test.txt"; then
    echo "Halim.Website/blog is Working \e[92mSuccessfuly!\e[0m"
else
    sudo cp -R /var/TempBackupForHalimWebsite/* /var/www/halim.website/    
done

