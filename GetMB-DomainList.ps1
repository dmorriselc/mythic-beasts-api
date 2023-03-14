<#	
	.NOTES
	===========================================================================
	 Created on:   	13/03/2023
	 Created by:   	David Morris
	 Organization: 	East Lothian Council
	 Filename:     	GetMB-DomainList.ps1
	 Dependencies:  GetMBAuthToken module
	===========================================================================
	.DESCRIPTION
    Example script, this will connect to the Mythic-Beasts API and retrieve a list of registered domains
#>

#Requires -Modules GetMBAuthToken

$Url = "https://api.mythic-beasts.com/beta/domains"

$Body = @{
     auto_renew = $true
}
$JsonBody = $Body | ConvertTo-Json

$ResponseParameters = @{
  Method = "Put"
  Uri = $Url
  Headers = @{'Authorization'="Bearer $token"}
  Body = $JsonBody
  ContentType = "application/json"
 }
 
Invoke-RestMethod @ResponseParameters