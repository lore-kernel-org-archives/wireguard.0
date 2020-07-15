Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB28C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 09:12:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBDA206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 09:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBDA206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gwdg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86722de3;
	Wed, 29 Jul 2020 08:48:29 +0000 (UTC)
Received: from gmailer.gwdg.de (gmailer.gwdg.de [134.76.11.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7059201
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jul 2020 08:08:32 +0000 (UTC)
Received: from excmbx-11.um.gwdg.de ([134.76.9.220] helo=email.gwdg.de)
 by mailer.gwdg.de with esmtp (GWDG Mailer)
 (envelope-from <marjan.olesch@gwdg.de>) id 1jvcnu-0007yC-H3
 for wireguard@lists.zx2c4.com; Wed, 15 Jul 2020 10:30:14 +0200
Received: from [192.168.178.103] (10.250.9.199) by excmbx-11.um.gwdg.de
 (134.76.9.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2044.4; Wed, 15
 Jul 2020 10:30:01 +0200
To: <wireguard@lists.zx2c4.com>
From: Marjan Olesch <marjan.olesch@gwdg.de>
Subject: Hardware Security Token
Message-ID: <cd5b0b55-fe63-e4ec-7ee3-b68fc9e95e31@gwdg.de>
Date: Wed, 15 Jul 2020 10:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms090304090701090504020302"
X-Originating-IP: [10.250.9.199]
X-ClientProxiedBy: excmbx-14.um.gwdg.de (134.76.9.225) To excmbx-11.um.gwdg.de
 (134.76.9.220)
X-Virus-Scanned: (clean) by clamav
X-Mailman-Approved-At: Wed, 29 Jul 2020 10:48:27 +0200
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

--------------ms090304090701090504020302
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi,

I'm a student in computer science and currently writing my master=20
thesis. It's about an STM32F103 based security token, that is=20
specifically designed for the WireGuard authentication. For now, it has=20
more like a proof-of-concept character, and I'm aware of the possible=20
security flaws, which also have been discussed here before=20
(https://lists.zx2c4.com/pipermail/wireguard/2016-July/000243.html).


Nevertheless I want to briefly present my team's concept, as well as our =

progress.

The Noise IK pattern shows clearly, that it is not enough to just=20
outsource DH(SiPriv, SrPub) to the token, since this part would be=20
static, as long as the private static key or the peer=E2=80=99s public ke=
y does=20
not change. Considering chapter 5.4 in the wireguard paper (initiation=20
scenario), at least the operation (Ci, k) :=3D Kdf2( Ci, DH(SiPriv, SrPub=
)=20
) needs to be ported to the token, since it is the Ci that is based on=20
ephemeral keys. Furthermore, the k, resulting from the KDF2 is a secret, =

that is needed to create the AEAD. This means, that the k is kept on the =

device, while the AEAD is also calculated on the token. Because the AEAD =

calculation requires a timestamp, the device needs to run an RTC.=20
Considering all this, an attacker that intercepts the communication=20
between token and computer cannot replay the handshake with the=20
information transceived, since he is not able to alter neither the time=20
stamp, nor the k.

Unfortunately, the STM32F103 can - from our findings - only run the=20
time, not the date, while powered off (with backup battery connected).=20
So for now the date has to be delivered once a day in our=20
implementation. The delivery can be protected by a password and/or a=20
hardware button for better security. The most important algorithms=20
Blakse2s, curve25519 and chacha20-poly1305 run on the STM32 and we were=20
able to reconstruct the operations needed, in order to source out the=20
particular parts from the handshake initiation. The communication to the =

(virtual COM) device runs via USB and a really simple rpc protocol. We=20
used wireguard-rs for the development and everything stated above works=20
at the moment.

I don=E2=80=99t want to bother you with too much information. Please let =
me=20
know, if you have thoughts about this idea and/or the implementation. I=20
would be pleased to present you everything in more detail.

Code can be found on https://gitlab.gwdg.de/uenigma


Best Regards,


Marjan




--------------ms090304090701090504020302
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
ENEwggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
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
NCIaE40GMIIGBzCCBO+gAwIBAgIMIPUCyIxks9cyOVhOMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDUxMDE0MDU0OVoXDTIyMDUw
OTE0MDU0OVowZTELMAkGA1UEBhMCREUxPjA8BgNVBAoMNUdlc2VsbHNjaGFmdCBmdWVyIHdp
c3NlbnNjaGFmdGxpY2hlIERhdGVudmVyYXJiZWl0dW5nMRYwFAYDVQQDDA1NYXJqYW4gT2xl
c2NoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvFbX+5+qqup9/DOwZaC3fiRd
vrUO+3B3I+3fnV7Dsn54WNIZ8EUV5WWJGHJRR6pdERdE3f9HgLkVsNSvYVjfY3U7MZVhFa0V
WshUT9oG2KcXe6rxumdWpr4T9yyIfxFRHGzFJ+YjcbcbWVd8+4Q6rQJ2AoK8lNs8eMfDT5jA
wlrEST4OnbLH3O3o6haOPZ/ckuHazAl3Wn3qciWLfFc3mUOs9kJRPNdxXf2Mt07eTN/2GzOf
w131fcQjw1OFIzlOfd42NyVHWi0qulznXcj2tFAsspu4oZU6Ghqg9O7GmfFySLn8ZyzKbjPq
1NIugKZzGfrWF6em0izFwYtApEo+mwIDAQABo4ICjDCCAogwQAYDVR0gBDkwNzAPBg0rBgEE
AYGtIYIsAQEEMBEGDysGAQQBga0hgiwBAQQDCTARBg8rBgEEAYGtIYIsAgEEAwkwCQYDVR0T
BAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0G
A1UdDgQWBBRwjYF9I5NWCPS9HqZxfGnsXmQa2TAfBgNVHSMEGDAWgBRrOpiL+fJTidrgrbIy
Hgkf6Ko7dDBcBgNVHREEVTBTgRVtYXJqYW4ub2xlc2NoQGd3ZGcuZGWBFG1hcmphbi5vbGVz
Y2hAZ214LmRlgSRtYXJqYW4ub2xlc2NoQHN0dWQudW5pLWdvZXR0aW5nZW4uZGUwgY0GA1Ud
HwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcy
L3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1j
YS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHOMIHLMDMGCCsG
AQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1AwSQYIKwYB
BQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2Fj
ZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZu
LWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEB
AI5vfOV9B0Ru63U2L76lUiOPctX4lkZpJucmKW85v9B8LK3SLB7+Ex5TbsTNWhF3ZWzLstMV
MCCBhHfaYIEZe9Lv15DcBqryHoRiy8pAN42jx9abt9tAcE8C5b/vLyKzcy7NskQ+tLVHR28j
YVHkT1GmI/wxsOcRtS1J7py+Mka7n0uIR2B9Em+ekqTOcshz6bdLii8P2fiwgO5ZQfDxHbhy
OTTg/QbybAWQ5Gvn0QNkjk0NvIjWjJySELUCELQaowEW2udwJMFFqN998ErJKizqqfopofp1
AlKPwb3vAtBX7sKfGrNzY0TNCepeFAPArj7Nwpa0vCg9lXKn+SM17VgxggQLMIIEBwIBATCB
njCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5l
cyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTEl
MCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMIPUCyIxks9cyOVhOMA0G
CWCGSAFlAwQCAQUAoIICPTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMDA3MTUwODI5NTdaMC8GCSqGSIb3DQEJBDEiBCDbXtIMCk0HqaRatYQumHFx8QNq
tyUyKJvNEGAOMyiXLDBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMIGvBgkrBgEEAYI3EAQxgaEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUw
QwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4g
R2xvYmFsIElzc3VpbmcgQ0ECDCD1AsiMZLPXMjlYTjCBsQYLKoZIhvcNAQkQAgsxgaGggZ4w
gY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMg
RGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAj
BgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0ECDCD1AsiMZLPXMjlYTjANBgkq
hkiG9w0BAQEFAASCAQAmFAnYXHX+OwXicp4+9Vm+yOVYIhEny7vZ6NXTzuzxkt6X/pXisjIy
PtNEtKRIBPVyizbCg7RIIXLbzQEOdD7IpHTbdhnMqCQoM5P3qfqqZHcD6X+RI3JLHbV+DEPB
meD5dZqwQcsAKTVcQnSl+tCA7jfPiQeIC9EXtNysEeIitaA2VKtS/szQnvwGloeSKMq3A/jT
i3QUDn2dCi1P5W/zdAcSW8ILENcSrEwumH1fBMFVZ6eKlw1wXccHNsqWByClx2W5mD0nuUqV
p7OqxDsf8iW4FcyvruvixVlYY2HDj0kMTE1A1G27JpSp2PkWHwezdHg++L4adhJ550Gd2FI9
AAAAAAAA
--------------ms090304090701090504020302--
