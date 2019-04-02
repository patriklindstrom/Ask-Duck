# Makes Rest-Api Call to search engine
param ($question)
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json"} -TimeoutSec 5
 $response.AbstractText
