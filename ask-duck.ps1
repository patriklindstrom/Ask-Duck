# Handle null respons
param ($question)
 $response = Invoke-RestMethod -Method get -Uri 'https://api.duckduckgo.com' -Body   @{q = $question;format = "json"} -TimeoutSec 5
 if ($response) {$response.AbstractText}
 else
 {"Found nothing about $question"}