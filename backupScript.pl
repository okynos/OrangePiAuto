#!/usr/bin/perl

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year += 1900;
$mon++;
$route = '/media/usb/backups';
$filename = "bak$mday$mon$year\_$sec.img";
$backup = `dd if=/dev/mmcblk0 bs=1M | gzip > $route/$filename.gzip`;

$to = 'pylott@gmail.com';
$from = 'OrangePi';
$subject = 'Script Backup';
$message0 = "Script ejecutado el $mday/$mon/$year a las $hour:$min:$sec\n";
$message1 = "Backup del sistema realizado y almacenado en: $route/$filename\n";

open(MAIL, "|/usr/sbin/sendmail -t");

# Email Header
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
# Email Body
print MAIL "$message0$message1";
print MAIL "Salida del comando: $backup\n";
print MAIL "\n\n OrangePi :)";
close(MAIL);

exit(0);
