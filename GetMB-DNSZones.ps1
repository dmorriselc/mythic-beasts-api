<#	
	.NOTES
	===========================================================================
	 Created on:   	13/03/2023
	 Created by:   	David Morris
	 Organization: 	East Lothian Council
	 Filename:     	GetMB-DNSZones.ps1
	 Dependencies:  GetMBAuthToken module
	===========================================================================
	.DESCRIPTION
    Example script, this will connect to the Mythic-Beasts API and retrieve a list of dns zones
#>

#Requires -Modules GetMBAuthToken

$Url = "https://api.mythic-beasts.com/dns/v2/zones"

$token = GetMBAPIToken

$ResponseParameters = @{
	Uri = $Url
	Method = 'GET'
	Headers = @{'Authorization'="Bearer $token"}
	ContentType = "application/json"
}

$APIResponse = Invoke-WebRequest @ResponseParameters

Write-Output $APIResponse.Content | ConvertFrom-Json | ConvertTo-Json