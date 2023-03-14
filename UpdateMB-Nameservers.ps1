<#	
	.NOTES
	===========================================================================
	 Created on:   	13/03/2023
	 Created by:   	David Morris
	 Organization: 	East Lothian Council
	 Filename:     	UpdateMB-Nameservers.ps1
	 Dependencies:  GetMBAuthToken module
	===========================================================================
	.DESCRIPTION
    Example script, this will connect to the Mythic-Beasts API and update nameservers for a specific domain
#>

#Requires -Modules GetMBAuthToken

$domain = "example.com"

$Url = "https://api.mythic-beasts.com/beta/domains/$domain/nameservers"

$BodyofJson = '{
    "nameservers": [
        {
            "name": "ns1.mythic-beasts.com"
        },
        {
            "name": "ns2.mythic-beasts.com"
        }		
    ]
}'

Write-Output $BodyofJson
 
$Params = @{
    Method = "Put"
    Uri = $Url
    Headers = @{'Authorization'="Bearer $token"}
    Body = $BodyofJson
    ContentType = "application/json"
 }
 
 Invoke-RestMethod @Params