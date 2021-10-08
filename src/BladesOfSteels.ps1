function Write-LDVP {
    Write-Host "`n`n                           *@@@@@@@@@@@@@@@@@@@.                             "
    Write-Host "                      @@@@@@@@@@@@@@&&&@@@@@@@@@@@@@@                        "
    Write-Host "                ( @@@@@@@@/%@@@@ . @.@@ @ .@@@@(/@@@@@@@@                    "
    Write-Host "             % @@@@@@@/@@@ @@@ @(@..@,@ @&@@@@@  @@@/@@@@@@                  "
    Write-Host "             @@@@@@&@ ..@@@.@@@ ///////////%@@.%@ @ @@@(@@@@@@               "
    Write-Host "           @@@@@/@@@@@ @@@///////@@@@@@@@@///////@ @ @@@@@ @@@@@             "
    Write-Host "        / @@@@ @@@@& @@//////////@@@@@@@@@//////////@@@@@@@@@@@@@            "
    Write-Host "        (@@@@/@@@@@@@////////////@@@@@@@@@////////////@@@@@@@/@@@@ /         "
    Write-Host "      ,*@@@@%@@@@@@//////////////@@@@@@@@@//////////////@@@@@@/@@@@          "
    Write-Host "       @@@@(@@@@@@//////////////@@@@@@@@@@@//////////////@@@@@@/@@@@         "
    Write-Host "      @@@@%@@@@@@//////////////@@@@@@@@@@@@@//////////////@@@@@@@@@@%        "
    Write-Host "      @@@@/@@@@@@////////////@@@@@@@@@@@@@@@@@////////////@@@@@@/@@@@        "
    Write-Host "      @@@@(@@@@@@//////////%@@@      @@     @@@&//////////@@@@@@/@@@@        "
    Write-Host "      @@@@/@@@@@@/////////@@@      @@*@@*      @@/////////@@@@@@/@@@@        "
    Write-Host "      @@@@&@@@@@@////////@@@      @@    @@     %@@///////(@@@@@@@@@@(.       "
    Write-Host "       @@@@/@@@@@@///////@@@@        @@        @@@///////@@@@@@/@@@@         "
    Write-Host "      / @@@@(@@@@@@///////@@@@@   @@@  @@@  @@@@@//////(@@@@@@/@@@@          "
    Write-Host "       ,,@@@@/@@@@@@@///////@@@@@@@@@@@@@@@@@@@///////@@@@@@@/@@@@           "
    Write-Host "          @@@@@@@@@@@@@/////(@@&///////////%@@@/////@@@@@@@@@@@@@            "
    Write-Host "           @@@@@ @@@ @  @@(//(////////////////(/%@@.& @,@@@@@@@              "
    Write-Host "             @@@@@@(@@ @ @@ @@@@(///////// @@@/.@ @@(@@/@@@@@@               "
    Write-Host "               /@@@@@@/@@ @ @@ @ @ @@ (@  @@@@ @/,@@/@@@@@@                  "
    Write-Host "                  %@@@@@@@%/@@@/@@*@@*@@@@@%@@@/@@@@@@@@,                    "
    Write-Host "                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  ,                      "
    Write-Host "                            &@@@@@@@@@@@@@@@@@%  .                           "
    Write-Host "`t`t`t  LA LIGUE DU VIEUX POELE"
}

function ConvertTo-RandomizedList
{
    Param(
        [array]$InputList
    )

    return $InputList | Get-Random -Count $InputList.Count;
}


#############################
##  Script Main entry point
#############################
Write-LDVP

$players = @("Decapent", "Zig", "Maxgt", "Personator", "Sensato", "Mickrowatts", "Tinoeud", "Lutoru", "Kalr", "savagesaskatch", "kevenh", "DomDoughty")
$matchConfig = @((0,1), (2,11), (0,3), (1,8), (0,9), 
                (1,4), (2,6), (2,5), (3,4), (4,11), 
                (6,7), (10,7), (11,9), (7,8), (8,9),
                (10, 3), (10, 6))

$randomizedPlayers = ConvertTo-RandomizedList -InputList $players

$matches = @()
$matchConfig | ForEach-Object {
    $player1 = $randomizedPlayers[$_[0]]
    $player2 = $randomizedPlayers[$_[1]]

    $matches += "$player1 VS $player2"
}

Write-Host "`n`n-> RESULTATS DE LA DISTRIBUTION DES MATCHES <-"
ConvertTo-RandomizedList -InputList $matches `
| ForEach-Object {
    Write-Host $_
}