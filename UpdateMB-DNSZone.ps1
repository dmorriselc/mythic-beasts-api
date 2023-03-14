<#	
	.NOTES
	===========================================================================
	 Created on:   	13/03/2023
	 Created by:   	David Morris
	 Organization: 	East Lothian Council
	 Filename:     	UpdateMB-DNSZone.ps1
	 Dependencies:  GetMBAuthToken module
	===========================================================================
	.DESCRIPTION
    Example script, this will connect to the Mythic-Beasts API and update dns zone for a domain
#>

#Requires -Modules GetMBAuthToken

$domain = "example.com"

$Url = "https://api.mythic-beasts.com/dns/v2/zones/$domain/records?exclude-template&exclude-generated"

# These example DNS records create a domain that does not send email, to protect against spoofing.

$BodyofJson = '{
    "records":  [
                    {
                        "data":  "v=DKIM1; p=",
                        "host":  "*._domainkey",
                        "ttl":  300,
                        "type":  "TXT"
                    },
                    {
                        "data":  "v=spf1 -all",
                        "host":  "@",
                        "ttl":  300,
                        "type":  "TXT"
                    },
                    {
                        "data":  "v=DMARC1;p=reject;",
                        "host":  "_dmarc",
                        "ttl":  300,
                        "type":  "TXT"
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