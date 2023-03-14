$clientID = "yourclientid"
$clientSecret = "yoursecret"
$encrypted_secret = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$($clientId):$clientSecret")))"

$TokenRequest = @{
  Uri     = 'https://auth.mythic-beasts.com/login'
  Method  = 'POST'
  Headers = @{'Authorization' = $encrypted_secret}
  Body    = @{grant_type = 'client_credentials'}
}
$TokenRestResponse = Invoke-RestMethod @TokenRequest
$token = $TokenRestResponse.access_token