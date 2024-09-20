@echo off
color 0a
title 			@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Metco Ping Tool v1.6 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@echo 	!-------------------- Ping tool for troubleshooting --------------------!
echo "   _____           _       _           _                                             ";
echo "  / ____|         (_)     | |         | |                                            ";
echo " | (___   ___ _ __ _ _ __ | |_ ___  __| |                                            ";
echo "  \___ \ / __| '__| | '_ \| __/ _ \/ _\` |                                            ";
echo "  ____) | (__| |  | | |_) | ||  __/ (_| |                                            ";
echo " |_____/ \___|_|  |_| .__/ \__\___|\__,_|                                            ";
echo "                    | |                                                              ";
echo "                    |_|                                                              ";
echo "   ____                                                                              ";
echo "  |  _ \                                                                             ";
echo "  | |_) |_   _                                                                       ";
echo "  |  _ <| | | |                                                                      ";
echo "  | |_) | |_| |                                                                      ";
echo "  |____/ \__, |                                                                      ";
echo "          __/ |                                                                      ";
echo "         |___/                                                                       ";
echo "   _   _     ____        _     ____        ___     __        _     _             __  ";
echo "  | | | |   |___ \      | |   |___ \      / _ \   / /  /\   | |   | |            \ \ ";
echo "  | |_| |__   __) |_____| |__   __) |_ __| | | | | |  /  \  | |__ | |__   __ _ ___| |";
echo "  | __| '_ \ |__ <______| '_ \ |__ <| '__| | | | | | / /\ \ | '_ \| '_ \ / _\` / __| |";
echo "  | |_| | | |___) |     | | | |___) | |  | |_| | | |/ ____ \| |_) | |_) | (_| \__ \ |";
echo "   \__|_| |_|____/      |_| |_|____/|_|   \___/  | /_/    \_\_.__/|_.__/ \__,_|___/ |";
echo "                                                  \_\                            /_/ ";
echo "                                                                                     ";
echo. && echo.
set /p User_Input_IP=Type IP Address: 
set /p User_Packet_Size=Enter Packet Size(bytes): 
set /p User_Packet_timeout=Enter Timeout(ms): 
set /p User_Input_FileLoc=Enter LogFile Name: 
echo pinging %User_Input_IP% and storing into %User_Input_FileLoc%.log on %date% %time%
echo pinging %User_Input_IP% and storing into %User_Input_FileLoc%.log on %date% %time% > %User_Input_FileLoc%.log
pause
echo. && echo.
echo		---- Ping Started ----
echo. && echo.
:ping
echo ***** %date% %time% ***** >> temp.log
ping %User_Input_IP% -n 1 -l %User_Packet_Size% -w %User_Packet_timeout% | find "Reply" >> temp.log
ping %User_Input_IP% -n 1 -l %User_Packet_Size% -w %User_Packet_timeout% | find "timed out" >> temp.log
ping %User_Input_IP% -n 1 -l %User_Packet_Size% -w %User_Packet_timeout% | find "expired" >> temp.log
ping %User_Input_IP% -n 1 -l %User_Packet_Size% -w %User_Packet_timeout% | find "check" >> temp.log
type temp.log
type temp.log >> %User_Input_FileLoc%.log
break>temp.log
goto ping
pause