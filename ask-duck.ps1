# Remove html tags
param ($question="git commit")
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json";no_html=1} -TimeoutSec 5
[String] $TextRespons =  $response -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', ''
 $TextRespons
 