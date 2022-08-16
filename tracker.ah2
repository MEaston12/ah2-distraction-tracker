#SingleInstance Force

csvLocation := IniRead('./config.ini', 'Settings', 'csvLocation')

if (!FileExist(csvLocation)) {
  FileAppend("Time of Entry, Time Distracted`n", csvLocation)
}

!+F12::
{
  distTime := InputBox("How long were you distracted? (In minutes)", "Enter a value").value
  currentTime := formatTime(A_Now, 'd-M-y[h:mm:ss]')
  FileAppend(currentTime . "," . distTime . "`n", csvLocation)
}