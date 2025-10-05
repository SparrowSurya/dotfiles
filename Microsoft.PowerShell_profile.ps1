#######################################################################
# Author: https://github.com/sparrowsurya
# Description: custom $PROFILE for  windows terminal
# Repository: https://github.com/sparrowsurya/dotfiles
# Last Updated: 7 oct, 2024
#######################################################################


# oh-my-posh (oh-my-posh.dev)
Import-Module -Name Terminal-Icons
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\sparrow.omp.json" | Invoke-Expression


# linux aliases
New-Alias touch New-Item
New-Alias python3 python


# MORE ...
# cursor: http://rrbrandt.dee.ufcg.edu.br/en/docs/ansi/cursor
# ps prompt anatomy: https://bradwilson.io/blog/prompt/powershell
# blog: https://duffney.io/usingansiescapesequencespowershell/


# variables
$NVIM = "$HOME\AppData\Local\nvim\init.vim"


# catpuccin theme (https://github.com/catppuccin/windows-terminal)
Import-Module Catppuccin


# Show today's calendar 
function Calendar {
	
	$day = (Get-Date).day
	$month = (Get-Date).month
	$year = (Get-Date).year

    # Get the first and last day of the month
    $firstDayOfMonth = Get-Date -Year $year -Month $month -Day 1
    $lastDayOfMonth = $firstDayOfMonth.AddMonths(1).AddDays(-1)

    # Get the day of the week for the first day of the month
    $startDayOfWeek = $firstDayOfMonth.DayOfWeek

    # Create an array for days of the week
    $daysOfWeek = @("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")

    # Header
    $monthName = (Get-Date).ToString("MMMM")
    Write-Host "        $monthName $year" -ForegroundColor Cyan
    Write-Host ($daysOfWeek -join " ") -ForegroundColor Yellow

    # Initialize the day counter
    $dayCounter = 1

    # Print leading spaces for the first week
    for ($i = 0; $i -lt [int]$startDayOfWeek; $i++) {
        Write-Host "    " -NoNewline
    }

    # write the days of the month
    while ($dayCounter -le $lastDayOfMonth.Day) {
        for ($i = [int]$startDayOfWeek; $i -lt 7; $i++) {
            if ($dayCounter -le $lastDayOfMonth.Day) {
                if ($dayCounter -eq $givenDay) {
                    Write-Host (" " + $dayCounter.ToString("00") + " ") -NoNewline -ForegroundColor Magenta
                } else {
                    Write-Host (" " + $dayCounter.ToString("00") + " ") -NoNewline
                }
                $dayCounter++
            } else {
                break
            }
        }
        Write-Host ""
        $startDayOfWeek = 0
    }
}

# set similar linux alias for calendar
New-Alias cal Calendar

