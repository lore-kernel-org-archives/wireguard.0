Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F47CC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:18:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B3960238
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6B3960238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=physik.uni-bonn.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09354dfb;
	Fri, 24 Sep 2021 20:18:56 +0000 (UTC)
Received: from mail.uni-bonn.de (mail.uni-bonn.de [131.220.15.113])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4b4178c
 (TLSv1.2:ECDHE-ECDSA-AES256-SHA:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 17:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=physik.uni-bonn.de; s=mail; 
 bh=IK9BLp4NEs2Lk2o4ldgs692TeXLLEtFtqjSOvtl4myc=;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To
 :Subject; b=PQEq/q0v40rZwEnaPzW9N1DtAzyo9EUHGoAYzbZv1QoRJBdo2EmvkKgAYZeH0H6C4
 XR1OD5v4NQqTP+AtTDpuqfzys9JEJstWdeLTgh7H72Yk0i+s4HMq0jMvqPx2B8Oj4EQsAKRVpmmAE
 yEEDSFA8HvQHVAz8WMMFSlFRlwYWA=
Received: from [131.220.15.217] (HELO uni-bonn.de)
 by uni-bonn.de (CommuniGate Pro SMTP 6.3.7k)
 with ESMTP id 213742323 for wireguard@lists.zx2c4.com;
 Fri, 24 Sep 2021 19:57:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=physik.uni-bonn.de; s=mail; 
 bh=IK9BLp4NEs2Lk2o4ldgs692TeXLLEtFtqjSOvtl4myc=;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To
 :Subject; b=PQEq/q0v40rZwEnaPzW9N1DtAzyo9EUHGoAYzbZv1QoRJBdo2EmvkKgAYZeH0H6C4
 XR1OD5v4NQqTP+AtTDpuqfzys9JEJstWdeLTgh7H72Yk0i+s4HMq0jMvqPx2B8Oj4EQsAKRVpmmAE
 yEEDSFA8HvQHVAz8WMMFSlFRlwYWA=
Received: from [46.165.185.2] (account freyermuth@physik.uni-bonn.de HELO
 [192.168.2.54]) by uni-bonn.de (CommuniGate Pro SMTP 6.3.7k)
 with ESMTPSA id 16260671; Fri, 24 Sep 2021 19:57:36 +0200
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Arlo Clauser <Arlo@starcubedesign.com>,
 John-Paul Andreini <jandreini@geonerco.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
 <CALaUSusvu8iJTXNc_07=tQ=yNKJ+HXOe1J5A=HRyAAJbzDjjYg@mail.gmail.com>
From: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Message-ID: <adac36f3-e33c-606e-d287-c11467b70606@physik.uni-bonn.de>
Date: Fri, 24 Sep 2021 19:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CALaUSusvu8iJTXNc_07=tQ=yNKJ+HXOe1J5A=HRyAAJbzDjjYg@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms040105000407090204060002"
X-Mailman-Approved-At: Fri, 24 Sep 2021 20:18:51 +0000
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

--------------ms040105000407090204060002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Awesome indeed :-).
I'll contact our two affected users once 0.4.10 is released, especially t=
he one who managed to trigger it twice in one week
should be a good test candidate.

Cheers and a nice weekend,
	Oliver

Am 24.09.21 um 19:53 schrieb Joshua Sjoding:
> Awesome! Can do. Thanks Jason!
>=20
> Joshua Sjoding
> SCJ Alliance
> IT Specialist
>=20
> On Fri, Sep 24, 2021 at 10:49 AM Jason A. Donenfeld <Jason@zx2c4.com> w=
rote:
>>
>> Hey guys,
>>
>> I think we might be onto something with https://w-g.pw/l/ZO5Z ...
>>
>> I'm going to cut a new release in the next few hours here. When that's=

>> released, would you try updating to 0.4.10, going back to using the
>> kernel implementation, and letting me know whether the problem
>> resurfaces? In the absence of being able to locally produce this on a
>> debuggable machine, I think this kind of trial and error is all we've
>> got. Hopefully the theory behind https://w-g.pw/l/ZO5Z is correct.
>>
>> Jason


--=20
Oliver Freyermuth
Universit=C3=A4t Bonn
Physikalisches Institut, Raum 1.047
Nu=C3=9Fallee 12
53115 Bonn
--
Tel.: +49 228 73 2367
Fax:  +49 228 73 7869
--


--------------ms040105000407090204060002
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EOswggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
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
NCIaE40GMIIGITCCBQmgAwIBAgIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MTExNTEyNDMyOFoXDTIxMTEx
NDEyNDMyOFowgbIxCzAJBgNVBAYTAkRFMRwwGgYDVQQIDBNOb3JkcmhlaW4tV2VzdGZhbGVu
MQ0wCwYDVQQHDARCb25uMTgwNgYDVQQKDC9SaGVpbmlzY2hlIEZyaWVkcmljaC1XaWxoZWxt
cy1Vbml2ZXJzaXRhZXQgQm9ubjEgMB4GA1UECwwXUGh5c2lrYWxpc2NoZXMgSW5zdGl0dXQx
GjAYBgNVBAMMEU9saXZlciBGcmV5ZXJtdXRoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAwKdVNE7QbQkmWwUVE7N+izRfbbEalPrylpwB9Mgm/YIjJCVfzpcdF7g63VY1TSFP
Uxh4yDSpw0lVruJZ6Gd6A1JCQEcw/yiG88Y806POHQEM0LTOYYmkKKG+iz8DEvTQbxC5+DyQ
shU2tYSi5druehKqylyReTun9NfJ1gTdLueKjpGqJnsG3CZOaVUx4eMFj7pMmHzPnZsfe/Nr
w3lTdmtaG0RoKHLDq3jK2LkDC3vgej/FyOVclUfwkEpxrm1l1GegqYMRZ5qAhwJ0d/FdD1Gt
HVdISFHrpHDDJAFZ2dVB+G4bhif1dvXsQK4qWOWT6M2+71xLhDdf9Qawci+isQIDAQABo4IC
WDCCAlQwQAYDVR0gBDkwNzAPBg0rBgEEAYGtIYIsAQEEMBEGDysGAQQBga0hgiwBAQQDCDAR
Bg8rBgEEAYGtIYIsAgEEAwgwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYw
FAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRVYUmFlJJi/QG+QVTQn2tfh4wnhTAf
BgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAoBgNVHREEITAfgR1mcmV5ZXJtdXRo
QHBoeXNpay51bmktYm9ubi5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7hjlodHRwOi8vY2RwMS5w
Y2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwP6A9oDuGOWh0
dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNy
bDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4u
ZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRmbi5k
ZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2Fj
ZXJ0LmNydDANBgkqhkiG9w0BAQsFAAOCAQEARUAUNWOOOT8zUouetmweHEU3pYU3Wt5yEWao
KoayF1t5FTdeY9nvOrTss2kKzskO1lH5QodZP+nYGF4nA1YI37J115K8YJN+tjx7A8bVc34C
RAX6R2KXhTM6ToVTr6IsROkO7kj0HMLBcxbCgui635+Pu2PuPw86cd9rP+PxjHIXfQc0dIRi
z2eWG+nY7GwBZDBhpyQwqEBVBD09h8TN9Nz40WrO6fTu3unq7+JV5n7ccqef2ioc6fmI8Aqp
GBK1sl8MUuqD0e7gBdYqGwmZsB/faEgIRC1dKugq5UngD68gfn5rUzchoBAMWxoRcfQ+NEpb
8cw+P7/rk+/cwdD1vTGCBAswggQHAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8
VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVz
IGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJ
c3N1aW5nIENBAgwgDOd9xCyYowfAqlgwDQYJYIZIAWUDBAIBBQCgggI9MBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDkyNDE3NTczNVowLwYJKoZIhvcN
AQkEMSIEIHCGkk4VPoKeAoAJQi98CDo+DxjtD6ymmoQv0wVXGla2MGwGCSqGSIb3DQEJDzFf
MF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga8GCSsGAQQBgjcQ
BDGBoTCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVu
ZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZO
LVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMIAznfcQsmKMH
wKpYMIGxBgsqhkiG9w0BCRACCzGBoaCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZl
cmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBl
LiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNz
dWluZyBDQQIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBAQUABIIBAHfoL6JcdH0pVPFyJHmp
CytRho87c9MgxWRpxfC7W9Wr6p63oXxXC/NElcFF5nIuH5a0GItBmpJDPYrSQ2w4i534GAeu
MRhScebdl6cGRIRoD11JKjnyvVDz/2fYXDAff6XiK3G+ZFOEVqoc6KpjnC5Nlujggcm1s2QN
VaaO5HF+rk7Y9dxUI3xfnkdsSEMZizajn0+s0a9UpUVaumAOiJorQWIKIJPovH+eM3tfhtx0
2ol+dF2jZ/zLncyg6rG4AObruZCksv8/es1WhdX342sccZ0kFbcEKCXrFH3Q/rUwISlEVYE1
khbUsBtjxAvfsGQMvdhnevS7i/C5chNzqJIAAAAAAAA=
--------------ms040105000407090204060002--
