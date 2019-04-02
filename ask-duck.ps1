# Handle ambivelant answer take first
param ($question='Eye')
 $TextRespons = "Found nothing about: $question"
 $response = $null
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json";no_html=1} -TimeoutSec 5
  if ($response) {if ($response.Heading){
        if ($response.AbstractText){
        [String] $TextRespons =  $response.AbstractText -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', '' } 
        else 
         { [String] $TextRespons=  $response.RelatedTopics[0].Text -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', '' }
        }        
} 

 $TextRespons
