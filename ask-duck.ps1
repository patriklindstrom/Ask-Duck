#  use switch instead of nested if
param ($question='Noble Prize')
 $TextRespons = "Found nothing about: $question"
 $response = $null
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json";no_html=1} -TimeoutSec 5
 if ($response){
     Switch($response)
     {
        {$response.AbstractText}{$TextRespons =  $response.AbstractText;break}
        {$response.RelatedTopics[0].Text}{$TextRespons =  $response.RelatedTopics[0].Text;break}
     }
  }       
 $TextRespons -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', ''
