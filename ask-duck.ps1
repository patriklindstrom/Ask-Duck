# Handle null respons and html tags.
param ($question="git commit")
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json";no_html=1} -TimeoutSec 5
  if ($response) {
   [String] $TextRespons =  $response.AbstractText -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', '' }
 else
    {[String] $TextRespons = "Found nothing about $question"}

 $TextRespons
 