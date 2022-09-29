Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE14C04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Sep 2022 05:43:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4cca73b0;
	Thu, 29 Sep 2022 05:43:49 +0000 (UTC)
Received: from c1872.mx.srv.dfn.de (c1872.mx.srv.dfn.de [194.95.238.134])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2eeee0c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2022 05:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 hochschule-stralsund.de; h=content-type:content-type:in-reply-to
 :from:from:references:content-language:subject:subject
 :user-agent:mime-version:date:date:message-id:received; s=s1; t=
 1664430226; x=1666244627; bh=fmDFiyZvvZRLDKGxen4ns3hISgGUTfGNzQ3
 Qi0l7zko=; b=cPudqUXvMJzDZtBAEwlx3OiLZ2EI5IcBaUY2BtcLxqXIIWIvqAu
 CQqq6yb1MuSYbRlY5ItfupG+8VLTUDSAbMfaqrcppOBE8oeofPvy3DzlF3F5ymfc
 XcUkfLGgXEx3UCaoY2d4UXfGh6Xi/+sNNfcqjSkrabT5EEuVLgu6M3zs=
Received: from mail.hochschule-stralsund.de (mail.hochschule-stralsund.de
 [IPv6:2001:638:805::38:163])
 by c1872.mx.srv.dfn.de (Postfix) with ESMTPS id CB40980066;
 Thu, 29 Sep 2022 07:43:45 +0200 (CEST)
Received: by smtp.hochschule-stralsund.de
Message-ID: <3a27c871-f150-44fe-6d29-d5191be6cf79@hochschule-stralsund.de>
Date: Thu, 29 Sep 2022 07:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: wireguard-windows: Wireguard does not start a previously
 activated tunnel from time to time
Content-Language: en-US
To: Simon Rozman <simon@rozman.si>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <4e093a02-723d-22ff-fd33-f220ac24e19e@hochschule-stralsund.de>
 <03b8866a0f8249c8883d9a0244ddea1b@rozman.si>
From: Jan Petrischkeit <jan.petrischkeit@hochschule-stralsund.de>
In-Reply-To: <03b8866a0f8249c8883d9a0244ddea1b@rozman.si>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms000302020708000305030300"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a cryptographically signed message in MIME format.

--------------ms000302020708000305030300
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thank you for this information, I will take a look at that. Now I know 
where to look.

However, I am using the "endpoint-by-dns" for a specific reason:
In my area there is an internet provider which uses carrier grade nat in 
a strange way, so that no rdp session can be created over a wireguard 
tunnel if the ipv4 address of the server is used as endpoint. I created 
a dns entry for the wireguard server, so that in these cases the ipv6 
address is used and the tunnel is established without the weird nat of 
the internet provider in between.
Since not all people here have activated ipv6 in their home routers or 
have always an ipv6 connection while traveling, I cannot simply use the 
ipv6 adress in the config.

Regards,
Jan


Am 28.09.22 um 19:23 schrieb Simon Rozman:
> Hi,
> 
>> Event 7023, ServiceControlManager: The service "WireGuardTunnel$HOST-
>> WG2" was terminated with the following error: The requested name is valid,
>> but no data of the requested type was found.
> 
> The error message you are mentioning is WSANO_DATA 11004 which is related to DNS resolution problems. Which is kind of expected early in the boot process when the Dnscache service is starting and/or Dhcp service might not yet configured the DNS.
> 
> I presume changing the Endpoint= lines of peers to contain IPs rather than hostnames could solve your problem.
> 
> See if it helps.
> 
> If you can confirm it, maybe we can add some retry on WSANO_DATA in the wireguard-windows. (Personally, I would avoid adding hard dependency on Dnscache and Dhcp services. As there are situations where they can be disabled, preventing the WireGuard tunnel service startup then.)
> 
> Regards,
> Simon

--------------ms000302020708000305030300
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EL0wggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIF8zCCBNugAwIBAgIMIreq7LAfZ6mrmf3lMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTIwMDQxNjEwMDMwOVoXDTIzMDQx
NjEwMDMwOVowfDELMAkGA1UEBhMCREUxHzAdBgNVBAgMFk1lY2tsZW5idXJnLVZvcnBvbW1l
cm4xEjAQBgNVBAcMCVN0cmFsc3VuZDEdMBsGA1UECgwUSG9jaHNjaHVsZSBTdHJhbHN1bmQx
GTAXBgNVBAMMEEphbiBQZXRyaXNjaGtlaXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQDPBpn7AZ4Tu9cNqnkpAbAbpMzPi2X0dvk/WrRhxpDnJ3nTOWt/RJX6abpvfV3HXBvn
0vwYMM/J7InagjwULg1XzHNmoSVQPzPqPoXjgdw3JYLGsQujUA5X6idRw4rb2//M8zN5p47E
767SEp+62xkhgxffIwbNlUqo3mlOAnMvvvT1+i/aJYRb+PIw4Nx9QVeiQDtCuZ/sbSox6S2k
VWAr1SHhRsgQqEw+dKfz//dZbpQEPviuJisPnEWHaZu28jS292cmRzlyqtbTwrqxjv5V7tBO
HqakuWSK3C2UmM9VW64eYH1fs3pA7nNZC5oIY7SKIbDYyTIDRTeXs84vj3gBAgMBAAGjggJh
MIICXTA+BgNVHSAENzA1MA8GDSsGAQQBga0hgiwBAQQwEAYOKwYBBAGBrSGCLAEBBAYwEAYO
KwYBBAGBrSGCLAIBBAYwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYI
KwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRIiMCZXsxAsAlv1zzQHfKsUXODNzAfBgNV
HSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAzBgNVHREELDAqgShqYW4ucGV0cmlzY2hr
ZWl0QGhvY2hzY2h1bGUtc3RyYWxzdW5kLmRlMIGNBgNVHR8EgYUwgYIwP6A9oDuGOWh0dHA6
Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNybDA/
oD2gO4Y5aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwv
Y2FjcmwuY3JsMIHbBggrBgEFBQcBAQSBzjCByzAzBggrBgEFBQcwAYYnaHR0cDovL29jc3Au
cGNhLmRmbi5kZS9PQ1NQLVNlcnZlci9PQ1NQMEkGCCsGAQUFBzAChj1odHRwOi8vY2RwMS5w
Y2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NhY2VydC9jYWNlcnQuY3J0MEkGCCsG
AQUFBzAChj1odHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2Nh
Y2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQB43RymqsNYFKR4yBgwxBZdTLHz
Fxrb0hwAwaTgOOqqzo1p9mO7n9eA3SgVU0KJ5AEMzt7DP7oWwIkik3Bzk6STgDift2ojAOC9
1+IIO1OaqXcjbSAMlpqHvbrk1YGmldkiAFzC0IeI/WBNcULKOzi4/HvW1MX6KskIF/h+/gRp
lRs2SVFGWI7s+3xO63Gx3BLO/3vyzb1jKQEaeVLFob2TWCBoJUlzMpNKfZsA2/W0xAXtR2iG
uExDYjN1JjRr0XlbmtHZCuAHMvutrP6E99nKIdNVOBcb7XWvdijhNt9GpuNWbGaidNtP2VVx
yZYN6j62hRLImKMkHdWDfNbDrinGMYIECzCCBAcCAQEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUw
QwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4g
R2xvYmFsIElzc3VpbmcgQ0ECDCK3quywH2epq5n95TANBglghkgBZQMEAgEFAKCCAj0wGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIwOTI5MDU0MzQ1WjAv
BgkqhkiG9w0BCQQxIgQguK2+VAAluDMnbC3hCqJcXpLnOUJw3I2XI1S6cYxuiQ4wbAYJKoZI
hvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqG
SIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBrwYJ
KwYBBAGCNxAEMYGhMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBG
b2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYD
VQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwi
t6rssB9nqauZ/eUwgbEGCyqGSIb3DQEJEAILMYGhoIGeMIGNMQswCQYDVQQGEwJERTFFMEMG
A1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdz
bmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEds
b2JhbCBJc3N1aW5nIENBAgwit6rssB9nqauZ/eUwDQYJKoZIhvcNAQEBBQAEggEAYTEGxWs4
r7WdVdW2ko6UPuQUC+SLqTCaFoTsL/HTNic1P12KL1Wn/gtmTyy3CRqioL9FJDIaWRR4TpuR
eQnuCUCivVNZCr6ayBvUQ34c1xhC/BGoUsXE/YUJ+U5XkQT43GOFvg31jG3au8iLN7T4t/bl
HMOjYf1X/gI5WyA0E7WulfFxBBqa8wSCfBvn/fCF2h4QL8ehKB99GBxotQisi7itKTvVFPB4
lmlMQdWt/CnhmpC5mn1Xf3GAqi3xMoqKTfbsmTr/D7VvDjgyFZB1Yf3nHDDfQUZm2ouVURJu
ktVCM6lPYKm5FCB2dtUVHBXJO5ZlDRL906tF+8hyGSJXBgAAAAAAAA==
--------------ms000302020708000305030300--
