# Arrange
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"
$searchTerm = "fizz buzz"
# Act
$testReturn = GetAnswer -q $searchTerm
Write-Host $testReturn
# Assert
Describe "Test_DuckDuckGo_Rest_API" {
    It "Should return answer  about $searchTerm" {
        $testReturn | Should Match  "$searchTerm"
    }
}
