function GetAnswer($q) {
$here = $PSScriptRoot
$sut = 'ask-duck.ps1'
$result = &"$here\$sut" +  -question $q
# $result = L:\GooferDocs\SAST-Git\TalkToMeBug\Ask-Duck\ask-duck.ps1 -question $q
$result
}
