# Dmitry Zhdanov
#set-executionpolicy remotesigned

import-module activedirectory                               # Модуль AD

Add-Type -assembly System.Windows.Forms                     # Включение Windows Forms
Add-Type -AssemblyName System.Drawing                       # Включение Drawing

# Объявление форм

## Текстовые поля

$MessageTextBox              = New-Object System.Windows.Forms.TextBox
$MessageTextBox2             = New-Object System.Windows.Forms.TextBox
$MessageTextBox3             = New-Object System.Windows.Forms.TextBox
$MessageTextBox4             = New-Object System.Windows.Forms.TextBox
$MessageTextBox5             = New-Object System.Windows.Forms.TextBox
$User                        = New-Object System.Windows.Forms.TextBox
$User2                       = New-Object System.Windows.Forms.TextBox

## Надписи	

$MessageTextBoxLabel         = New-Object System.Windows.Forms.Label
$MessageTextBoxLabel2        = New-Object System.Windows.Forms.Label
$MessageTextBoxLabel3        = New-Object System.Windows.Forms.Label
$MessageTextBoxLabel4        = New-Object System.Windows.Forms.Label
$MessageTextBoxLabel5        = New-Object System.Windows.Forms.Label
$UserLabel                   = New-Object System.Windows.Forms.Label
$UserLabel2                  = New-Object System.Windows.Forms.Label

## Подсказки

$ToolTip = New-Object System.Windows.Forms.ToolTip
$ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$ToolTip.IsBalloon = $true


# Описание форм и их параметров

$Form = New-Object System.Windows.Forms.Form                # Основная форма
    $Form.Text = 'Информация о компьютере и пользователе'       # Заголовок формы
    $Form.Width = 640                                           # Ширина
    $Form.Height = 640                                          # Высота

$null = ""                                                  # Задаём пустое значение, пригодится для обновления пустого поля для ввода


# Поля для ввода
## 1
$TextBoxPC = New-Object System.Windows.Forms.Textbox        # Поле для ввода имени ПК
    $TextBoxPC.Location = New-Object System.Drawing.Point(35, 5) # Местоположение в основной форме
    $TextBoxPC.Size = New-Object System.Drawing.Size(100, 10)   # Размер
$Form.Controls.Add($TextBoxPC)                              # Основная форма может управлять этой формой

## 2
$TextBoxID = New-Object System.Windows.Forms.Textbox        # Поле для ввода ID 
    $TextBoxID.Location = New-Object System.Drawing.Point(320, 5) # Местоположение в основной форме
    $TextBoxID.Size = New-Object System.Drawing.Size(100, 10)   # Размер
$Form.Controls.Add($TextBoxID)                              # Основная форма может управлять этой формой


# Надписи
## Форма надписи "PC:"
$LabelPC = New-Object System.Windows.Forms.Label            # Форма надписи "PC:"
    $LabelPC.Text = "PC:"                                       # Надпись "PC:"
    $LabelPC.Location = New-Object System.Drawing.Point(10, 8)  # Местоположение в основной форме
    $LabelPC.Autosize = $true                                   # Автомататический размер (в зависимости от размера текста)
$Form.Controls.Add($LabelPC)                                # Основная форма может управлять этой формой

## Форма надписи "ID:"
$LabelID = New-Object System.Windows.Forms.Label            # Форма надписи "ID:"
    $LabelID.Text = "ID:"                                       # Надпись "ID:"
    $LabelID.Location = New-Object System.Drawing.Point(290, 8) # Местоположение в основной форме
    $LabelID.Autosize = $true                                   # Автомататический размер (в зависимости от размера текста)
$Form.Controls.Add($LabelID)                                # Основная форма может управлять этой формой

## Надпись "Информация о компьютере *Имя компьютера*"
$MessageTextBoxLabel.Location  = New-Object System.Drawing.Point(10,30)
    $MessageTextBoxLabel.Text      = "Информация о компьютере: $Computer_name"
    $MessageTextBoxLabel.Autosize  = 1
    $ToolTip.SetToolTip($MessageTextBoxLabel, "pc name")

## Надпись "Место на дисках"
    $MessageTextBoxLabel2.Location  = New-Object System.Drawing.Point(10,185)
    $MessageTextBoxLabel2.Text      = "Место на дисках:"
    $MessageTextBoxLabel2.Autosize  = 1
        $ToolTip.SetToolTip($MessageTextBoxLabel2, "Место на дисках")

## Надпись "Время работы компьютера:"
    $MessageTextBoxLabel3.Location  = New-Object System.Drawing.Point(120,185)
    $MessageTextBoxLabel3.Text      = "Время работы компьютера:"
    $MessageTextBoxLabel3.Autosize  = 1
        $ToolTip.SetToolTip($MessageTextBoxLabel3, "Время работы компьютера")

## Надпись "IP-адрес компьютера:"
    $MessageTextBoxLabel4.Location  = New-Object System.Drawing.Point(320,185)
    $MessageTextBoxLabel4.Text      = "IP-адрес компьютера:"
    $MessageTextBoxLabel4.Autosize  = 1
        $ToolTip.SetToolTip($MessageTextBoxLabel4, "Ай-пи")

## Надпись "залогинен:"
    $MessageTextBoxLabel5.Location  = New-Object System.Drawing.Point(460,185)
    $MessageTextBoxLabel5.Text      = "За компьютером залогинен:"
    $MessageTextBoxLabel5.Autosize  = 1
        $ToolTip.SetToolTip($MessageTextBoxLabel5, "Кто сейчас залогинен")

## Надпись Информация о пользователе
$UserLabel.Location  = New-Object System.Drawing.Point(10,260)
$UserLabel.Text      = "Информация о пользователе: $username"
$UserLabel.Autosize  = 1
        $ToolTip.SetToolTip($UserLabel, "GPID")

## Надпись Группы доступа AD пользователя
$UserLabel2.Location  = New-Object System.Drawing.Point(10,430)
$UserLabel2.Text      = "Группы доступа AD пользователя:"
$UserLabel2.Autosize  = 1
    $ToolTip.SetToolTip($UserLabel2, "Группы AD")

# Кнопки
# Кнопки найти вверху
## 1
$Button_Find = New-Object System.Windows.Forms.Button       # Кнопка "Найти" компьютер
    $Button_Find.Location = New-Object System.Drawing.Point(140, 5) # Местоположение в основной форме
    $Button_Find.Size = New-Object System.Drawing.Size(90, 20)  # Размер
    $Button_Find.Text = 'Найти'                                 # Текст в кнопке
$Form.Controls.Add($Button_Find)                            # Основная форма может управлять этой формой

## 2
$Button_Find2 = New-Object System.Windows.Forms.Button      # Кнопка "Найти" пользователя
    $Button_Find2.Location = New-Object System.Drawing.Point(425, 5) # Местоположение в основной форме
    $Button_Find2.Size = New-Object System.Drawing.Size(90, 20) # Размер
    $Button_Find2.Text = 'Найти'                                # Текст в кнопке
$Form.Controls.Add($Button_Find2)                           # Основная форма может управлять этой формой

     ## 3-11 Дополнительные кнопки создание, описание и параметры ниже
 
     $Proxy_lock_button     = New-Object System.Windows.Forms.Button
     $Proxy_unlock_button   = New-Object System.Windows.Forms.Button
     $Indexing_button       = New-Object System.Windows.Forms.Button
     $SpoolerButton         = New-Object System.Windows.Forms.Button
     $Installations_button  = New-Object System.Windows.Forms.Button
     $startup_button        = New-Object System.Windows.Forms.Button
     $printer_button        = New-Object System.Windows.Forms.Button
     $services_button       = New-Object System.Windows.Forms.Button
     $devices_button        = New-Object System.Windows.Forms.Button
     $diag_button           = New-Object System.Windows.Forms.Button
     $process_button        = New-Object System.Windows.Forms.Button
     $bit_button            = New-Object System.Windows.Forms.Button


# Кнопки горизонтально расположенные
## Кнопка перезапуска службы Печати
$SpoolerButton.Location          = New-Object System.Drawing.Point(120,230)
$SpoolerButton.Text              = "Spooler"
$SpoolerButton.Autosize          = 1
$SpoolerButton.TabIndex          = 7
    $ToolTip.SetToolTip($SpoolerButton, "Перезапустить службу Print Spooler")

## Кнопка удаления файла и перезапуска индексации
$Indexing_button.Location          = New-Object System.Drawing.Point(245,230)
$Indexing_button.Text              = "Indexing"
$Indexing_button.Autosize          = 1
$Indexing_button.TabIndex          = 7
    $ToolTip.SetToolTip($Indexing_button, "Перезапустить индексацию")

## Кнопка Блокировки настроек прокси
$Proxy_lock_button.Location          = New-Object System.Drawing.Point(370,230)
$Proxy_lock_button.Text              = "Lock Proxy"
$Proxy_lock_button.Autosize          = 1
$Proxy_lock_button.TabIndex          = 7
    $ToolTip.SetToolTip($Proxy_lock_button, "Заблокировать настройки прокси")

## Кнопка Разблокировки настроек прокси
$Proxy_unlock_button.Location          = New-Object System.Drawing.Point(500,230)
$Proxy_unlock_button.Text              = "Unlock Proxy"
$Proxy_unlock_button.Autosize          = 1
$Proxy_unlock_button.TabIndex          = 7
    $ToolTip.SetToolTip($Proxy_unlock_button, "Разблокировать настройки прокси")


# Кнопки вертикально расположенные
## Кнопка с установленными программами
$Installations_button.Location = New-Object System.Drawing.Point(505,285)
$Installations_button.Text  = "Installations"
$Installations_button.Autosize = 1
$Installations_button.TabIndex = 7
    $ToolTip.SetToolTip($Installations_button, "Установленные программы")

## Кнопка автозагрузок
$startup_button.Location          = New-Object System.Drawing.Point(505,320)
$startup_button.Text              = "Startup"
$startup_button.Autosize          = 1
$startup_button.TabIndex          = 7
    $ToolTip.SetToolTip($startup_button, "Автозагрузки")

## Кнопка принтеров
$printer_button.Location          = New-Object System.Drawing.Point(505,355)
$printer_button.Text              = "Принтеры"
$printer_button.Autosize          = 1
$printer_button.TabIndex          = 7
    $ToolTip.SetToolTip($printer_button, "Принтеры")
$Form.Controls.Add($printer_button)

## Кнопка Список служб
$services_button.Location          = New-Object System.Drawing.Point(505,390)
$services_button.Text              = "Службы"
$services_button.TabIndex          = 7
$services_button.Autosize          = 1
    $ToolTip.SetToolTip($services_button, "Список служб")
$Form.Controls.Add($services_button)

## Кнопка Список периферийных устройств 
$devices_button.Location          = New-Object System.Drawing.Point(505,455)
$devices_button.Text              = "Devices"
$devices_button.TabIndex          = 7
$devices_button.Autosize          = 1
    $ToolTip.SetToolTip($devices_button, "Список периферийных устройств")
$Form.Controls.Add($devices_button)

## Кнопка Диагностика
$diag_button.Location          = New-Object System.Drawing.Point(505,490)
$diag_button.Text              = "Diag"
$diag_button.TabIndex          = 7
$diag_button.Autosize          = 1
    $ToolTip.SetToolTip($diag_button, "Диагностика")
$Form.Controls.Add($diag_button)

## Кнопка процессы
$process_button.Location          = New-Object System.Drawing.Point(505,525)
$process_button.Text              = "Process"
$process_button.TabIndex          = 7
$process_button.Autosize          = 1
    $ToolTip.SetToolTip($process_button, "Запущенные процессы")
$Form.Controls.Add($process_button)

# Кнопка битлокер
$bit_button.Location          = New-Object System.Drawing.Point(505,560)
$bit_button.Text              = "Bitlocker"
$bit_button.TabIndex          = 7
$bit_button.Autosize          = 1
    $ToolTip.SetToolTip($bit_button, "Код восстановления Bitlocker")
$Form.Controls.Add($bit_button)


# Поля вывода
## 1 поле с информацией Основная информация о компьютере  
    $MessageTextBox =  New-Object System.Windows.Forms.TextBox
    $MessageTextBox.Location       = New-Object System.Drawing.Point(10,50)
    $MessageTextBox.MinimumSize = "600,130"
    $MessageTextBox.Multiline = $true
    $MessageTextBox.ScrollBars = 'Vertical'
        $ToolTip.SetToolTip($MessageTextBox, "Основная информация о компьютере")

## 2 поле с информацией Место на дисках
    $MessageTextBox2.Location = New-Object System.Drawing.Point(10,205)
    $MessageTextBox2.add_click({ $MessageTextBox2.SelectAll() })
    $MessageTextBox2.MinimumSize = "100,50"
    $MessageTextBox2.Multiline = $true
        $ToolTip.SetToolTip($MessageTextBox2, "Место на дисках")

## 3 поле с информацией Время работы компьютера
    $MessageTextBox3.Location = New-Object System.Drawing.Point(120,205)
    $MessageTextBox3.add_click({ $MessageTextBox3.SelectAll() })
    $MessageTextBox3.MinimumSize = "190,15"
    $MessageTextBox3.Multiline = $true
    $MessageTextBox3.add_click({ $MessageTextBox3.SelectAll() })
        $ToolTip.SetToolTip($MessageTextBox3, "Время работы компьютера")

## 4 поле с информацией IP-адрес компьютера
    $MessageTextBox4.Location = New-Object System.Drawing.Point(320,205)
    $MessageTextBox4.MinimumSize = "130,15"
    $MessageTextBox4.Multiline = $true
    $MessageTextBox4.add_click({ $MessageTextBox4.SelectAll() })
        $ToolTip.SetToolTip($MessageTextBox4, "IP-адрес компьютера")

## 5 поле с информацией За компьютером залогинен
    $MessageTextBox5.Location = New-Object System.Drawing.Point(460,205)
    $MessageTextBox5.add_click({ $MessageTextBox5.SelectAll() })
    $MessageTextBox5.MinimumSize = "150,15"
    $MessageTextBox5.Multiline = $true
        $ToolTip.SetToolTip($MessageTextBox5, "За компьютером залогинен")

# 6 Поле для вывода информации о залогиненном пользователе
    $User.Location       = New-Object System.Drawing.Point(10,280)
    $User.MinimumSize = "450,140"
    $User.Multiline = $true
    $User.ScrollBars = 'Vertical'
        $ToolTip.SetToolTip($User, "Итак, итак")

# 7 Поле для вывода информации о группах доступа AD пользователя
    $User2.Location = New-Object System.Drawing.Point(10,450)
    $User2.MinimumSize = "450,140"
    $User2.Multiline = $true
    $User2.ScrollBars = 'Vertical'
        $ToolTip.SetToolTip($User2, "Группы доступа")


# Действия

$Computer_name = [string] $null

# Нажатие кнопки "Найти" выполняет поиск информации о компьютере
$Button_Find.Add_Click({
    $error.clear()
  
$Computer_name = [string] $TextBoxPC.Text

$Computer_info = get-adcomputer $Computer_name -properties *

# Выбор необходимых нам параметров фильтров в верхнем поле информации о компьютере
    $p1 = $Computer_info |Select-Object CanonicalName
    $p2 = $Computer_info |Select-Object Created
    $p3 = $Computer_info |Select-Object IPv4Address
    $p4 = $Computer_info |Select-Object SID
    $p5 = $Computer_info |Select-Object PasswordLastSet
    $p6 = $Computer_info |Select-Object badPwdCount

# Описание фильтров
    $Container = 'Контейнер в AD: ' + $p1.CanonicalName
    $Creation_date = 'Когда создан: ' + $p2.Created
    $IP = $p3.IPv4Address
    $SID = 'SID: ' + $p4.SID
    $PassLastSet = 'Крайняя смена пароля: ' + $p5.PasswordLastSet
    $badPwdCount0 = 'badPwdCount:' + $p6.badPwdCount

# Отображение даты смены пароля
    $change_date = get-adcomputer $Computer_name -properties PasswordLastSet 
    $d1 = $change_date.PasswordLastSet
    $change_date = 'Дата изменения: ' + $d1.DateTime

# Информация о залогиненных пользователях
    $Users = Get-WmiObject win32_computersystem -Property UserName -ComputerName $Computer_name
    $users1 = @($users).username 
    $username = $users1.Split("\")[1]

# Информация о производителе и серийный номер компьютера
   $Serial_pc = Get-WmiObject -ComputerName $Computer_name -Class Win32_BIOS | Select-Object Manufacturer, SerialNumber
   $Manuf = "Производитель: " + $Serial_pc.Manufacturer
   $Serial = "Серийный номер: " + $Serial_pc.SerialNumber

# Размер файла индексации
    $indexing2 = ((Get-Item "\\$Computer_name\c$\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb").length/1GB)
    $indexing3 = "Размер файла индексации: " + $indexing2 + " Гб"


# all_pc - это полная запись информации для верхнего текстового поля MessageTextBox

$all_pc = @($Container +[System.Environment]::NewLine
$Creation_date +[System.Environment]::NewLine 
$SID +[System.Environment]::NewLine 
$change_date +[System.Environment]::NewLine
$badPwdCount0 +[System.Environment]::NewLine
$Manuf +[System.Environment]::NewLine
$Serial +[System.Environment]::NewLine
$indexing3)

# Место на диске C:\
$groups = (get-WmiObject win32_logicaldisk -Filter 'DeviceId = "C:"' -Computername $Computer_name)
    $gg = @(foreach ($di in $groups)
    {$di.FreeSpace / 1GB})

    $group_f = @(foreach ($gg2 in $gg)
    {($gg2 +[System.Environment]::NewLine)}
                )

    $group_f = [String] "Диск C: " + [math]::Round($gg2,2) + [String] " Гб"
    $groups2 = (get-WmiObject win32_logicaldisk -Filter 'DeviceId = "D:"' -Computername $Computer_name)

    $gg3 = @(foreach ($di2 in $groups2)
    {$di2.FreeSpace / 1GB}
            )

    $group_f2 = @(foreach ($gg4 in $gg3)
    {($gg4 +[System.Environment]::NewLine)}
                 )

    $group_f2 = [String] "Диск D: " + [math]::Round($gg4,2) + [String] " Гб"
    $drives = $group_f +[System.Environment]::NewLine + $group_f2

# Аптайм компьютера
$Lastreboottime = Get-WmiObject win32_operatingsystem -ComputerName $Computer_name | select csname, @{LABEL='LastBootUpTime';EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
    $Today = (Get-Date)
    $DiffDays = $Today.Date - $Lastreboottime.LastBootUpTime.Date
    $DiffTime = $Today.TimeOfDay - $Lastreboottime.LastBootUpTime.TimeOfDay
    $days = $DiffDays.Days
    $hours = $DiffTime.Hours
    $minutes = $DiffTime.Minutes
    $message = ("$days" + " день(-ей), " + "$hours" + " час(-ов), " + "$minutes" + " минут(-ы).")

# Информация о пользователе
$userinfo = get-aduser -Identity $username -properties *
    $p1 = $userinfo |Select-Object CN 
    $p2 = $userinfo |Select-Object Surname
    $p3 = $userinfo |Select-Object GivenName
    $p4 = $userinfo |Select-Object UserPrincipalName
    $p5 = $userinfo |Select-Object CanonicalName
    $p6 = $userinfo |Select-Object badPwdCount
    $ID = 'ID: ' + $p1.CN
    $SurName = 'Фамилия: ' + $p2.Surname
    $Name = 'Имя: ' + $p3.GivenName
    $email = 'E-mail: ' + $p4.UserPrincipalName
    $cont = 'Контейнер в AD: ' + $p5.CanonicalName
    $change_date = Get-ADUser -Identity $username -Properties PasswordLastSet 
        $d1 = $change_date.PasswordLastSet
        $change_date = 'Пароль был изменен: ' + $d1.DateTime
            $d2 = Get-Date
            $ts = New-TimeSpan -Start $d1 -End $d2
            $proshlo = 'Прошло дней с момента изменения пароля: ' + $ts.Days
            $nd = $d1.AddDays(90)
    $Istekaet = 'Пароль истечет: ' + $nd.DateTime
    $badPwdCount = 'badPwdCount: ' + $p6.badPwdCount

# группы доступа в AD
    $groups = @((Get-ADPrincipalGroupMembership $username | Select Name).Name)
        $gr =  @(foreach ($group in $groups)
        { $group}
                )

    $group_f = @(foreach ($group in $gr)
        {($group +[System.Environment]::NewLine)}
                )

# all_user0 - это полная запись информации для верхнего текстового поля MessageTextBox

$all_user0 = @($ID +[System.Environment]::NewLine 
$SurName +[System.Environment]::NewLine 
$Name +[System.Environment]::NewLine
$email +[System.Environment]::NewLine 
$cont +[System.Environment]::NewLine
$change_date +[System.Environment]::NewLine
$proshlo +[System.Environment]::NewLine
$Istekaet +[System.Environment]::NewLine
$badPwdCount)

    $User.Text  = $all_user0
    $User2.Text  = $group_f



    # Вывод в текстовые поля информации, полученной в результате поиска основных и дополнительных параметров
$MessageTextBox.Text = $all_pc
   $MessageTextBox2.Text  = $drives
   $MessageTextBox3.Text  = $message
   $MessageTextBox4.Text  = $IP
   $MessageTextBox5.Text  = $username

 })


# Действия дополнительных кнопок

## Действие кнопки Блокировки настроек прокси
$Proxy_lock_button.add_click({ 
    $error.clear()
    $Computer_name = $TextBoxPC.Text
psexec \\"$Computer_name" -d -s C:\WINDOWS\system32\cmd.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /v Proxy /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /v Autoconfig /t REG_DWORD /d 0x1 /f
 })

## Действие кнопки Разблокировки настроек прокси
$Proxy_unlock_button.add_click({ 
    $error.clear()
    $Computer_name = $TextBoxPC.Text
psexec \\"$Computer_name" -d -s C:\WINDOWS\system32\cmd.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /v Proxy /t REG_DWORD /d 0x0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /v Autoconfig /t REG_DWORD /d 0x0 /f
 })

## Действие кнопки удаления файла и перезапуска индексации
$Indexing_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text 
psexec \\"$Computer_name" -d -s C:\WINDOWS\system32\cmd.exe
taskkill /s \\"$Computer_name" /im searchindexer.exe -f
psexec \\"$Computer_name" cmd /c del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
psservice \\"$Computer_name" restart WSearch
 })

## Действие кнопки перезапуска службы Печати
$SpoolerButton.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    psservice \\"$Computer_name" restart spooler
 })

## Действие кнопки с установленными программами
$Installations_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    psexec \\"$Computer_name" -s cmd /c powershell get-package | Out-GridView
})

## Действие кнопки автозагрузок
$startup_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    wmic /node:"$Computer_name" startup get caption,command | Out-GridView})


## Действие кнопки принтеров
$printer_button.add_click({    
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    wmic /node:"$Computer_name" printer | Out-GridView
})

## Действие кнопки Список служб
$services_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
        wmic /node:"$Computer_name" service list brief | Out-GridView
})

## Действие кнопки Список периферийных устройств 
$devices_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    Get-WmiObject -Class Win32_PnPdevice -ComputerName $Computer_name | Out-GridView
})

## Действие кнопки Диагностика
$diag_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    psexec \\$Computer_name -s ipconfig /all | Out-GridView
    psexec \\$Computer_name -s netstat -rn | Out-GridView
    psexec \\$Computer_name -s ping  -w 1 -n 5 ssoiwa.mypepsico.com | Out-GridView
})

## Действие кнопки процессы
$process_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
    get-process -computername $Computer_name | select-object | Out-GridView
})

## Действие кнопки Битлокер 
$objComputer = Get-ADComputer $Computer_name
 $Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword'
 $jh = $Bitlocker_Object | select -First 1
 $jh = $jh | select-object msFVE-RecoveryPassword
 $jh | out-gridview

$bit_button.add_click({
    $error.clear()
    $Computer_name = $TextBoxPC.Text
	$objComputer = Get-ADComputer $Computer_name
 	$Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword'
 	$jh = $Bitlocker_Object | select -First 1
	 $jh = $jh | select-object msFVE-RecoveryPassword
		$jh | out-gridview 
  		$ds = Manage-bde -status -cn $Computer_name C: | out-gridview 
})

# Действия скрипта поиска информации о пользователе (введённом в поле для поиска)
$Button_Find2.Add_Click({
    $error.clear()
    $username = $null
    $username = $TextBoxID.Text

    $userinfo = get-aduser -Identity $username -properties *

$p1 = $userinfo |Select-Object CN 
$p2 = $userinfo |Select-Object Surname
$p3 = $userinfo |Select-Object GivenName
$p4 = $userinfo |Select-Object UserPrincipalName
$p5 = $userinfo |Select-Object CanonicalName
$p6 = $userinfo |Select-Object badPwdCount

# Логин, Фамилия, Имя, адрес почты, CN в AD
$ID = 'ID: ' + $p1.CN
$SurName = 'Фамилия: ' + $p2.Surname
$Name = 'Имя: ' + $p3.GivenName
$email = 'E-mail: ' + $p4.UserPrincipalName
$cont = 'Контейнер в AD: ' + $p5.CanonicalName

# Дата изменения пароля и сколько прошло с момента истечения 
$change_date = Get-ADUser -Identity $username -Properties PasswordLastSet 
    $d1 = $change_date.PasswordLastSet
        $change_date = 'Пароль был изменен: ' + $d1.DateTime
    $d2 = Get-Date
        $ts = New-TimeSpan -Start $d1 -End $d2
        $proshlo = 'Прошло дней с момента изменения пароля: ' + $ts.Days
        $nd = $d1.AddDays(90)                          # Указано 90 - имеется в виду, что нужно менять пароль каждые 90 дней
$Istekaet = 'Пароль истечет: ' + $nd.DateTime 

$badPwdCount = 'badPwdCount: ' + $p6.badPwdCount

# Поиск групп доступа в AD
$groups = @((Get-ADPrincipalGroupMembership $username | Select Name).Name)
$gr =  @(foreach ($group in $groups)
{ $group}
)

$group_f = @(foreach ($group in $gr)
{($group +[System.Environment]::NewLine)}
)

# all_user обобщает информацию о пользователе для вывода в текстовом поле $User.Text
$all_user = @($ID +[System.Environment]::NewLine 
$SurName +[System.Environment]::NewLine 
$Name +[System.Environment]::NewLine
$email +[System.Environment]::NewLine 
$cont +[System.Environment]::NewLine
$change_date +[System.Environment]::NewLine
$proshlo +[System.Environment]::NewLine
$Istekaet +[System.Environment]::NewLine
$badPwdCount)

$User.Text  = $all_user # Информация в текстовом поле информации о пользователе
$User2.Text  = $group_f # Информация в текстовом поле информации о группах доступа

    })


# взаимозависимости элементов
## Текстовые поля
$Form.Controls.Add($MessageTextBox)
$Form.Controls.Add($MessageTextBox2)
$Form.Controls.Add($MessageTextBox3)
$Form.Controls.Add($MessageTextBox4)
$Form.Controls.Add($MessageTextBox5)

## Заголовки полей

$Form.Controls.Add($MessageTextBoxLabel)
$Form.Controls.Add($MessageTextBoxLabel2)
$Form.Controls.Add($MessageTextBoxLabel3)
$Form.Controls.Add($MessageTextBoxLabel4)
$Form.Controls.Add($MessageTextBoxLabel5)

## Кнопки
$Form.Controls.Add($Proxy_lock_button)
$Form.Controls.Add($Proxy_unlock_button)
$Form.Controls.Add($Indexing_button)
$Form.Controls.Add($SpoolerButton)
$Form.Controls.Add($Installations_button)
$Form.Controls.Add($startup_button)
$Form.Controls.Add($process_button)

## информация о пользователе
$Form.Controls.Add($User)
$Form.Controls.Add($User2)
$Form.Controls.Add($UserLabel)
$Form.Controls.Add($UserLabel2)

# Отображение формы
$Form.ShowDialog()
