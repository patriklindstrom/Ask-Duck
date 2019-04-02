#  Make it into a class to better control output and return
class oracle {
[string] get_answer($question){
 $TextRespons = "Found nothing about: $question"
 $response = $null
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json";no_html=1} -TimeoutSec 5
 if ($response){
     Switch($response)
     {
        {$response.AbstractText}{$TextRespons =  $response.AbstractText -ireplace '</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->', '';break}
        {$response.RelatedTopics[0].Text}{$TextRespons =  $response.RelatedTopics[0].Text , '';break}
     }
     Write-Host $response.Heading -ForegroundColor DarkRed; Write-Host "$TextRespons" -ForegroundColor DarkGreen;
  }   
       
    return  $TextRespons 
 }
 }
  $o = new-object -TypeName oracle
  $o.get_answer('DuckDuckGo')