Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3132080D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=d-a-s.com header.i=@d-a-s.com header.b="MKFZYvMI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=d-a-s.com header.i=@d-a-s.com header.b="eWeiCt+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3132080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=d-a-s.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6b3002d;
	Thu, 18 Jun 2020 00:09:02 +0000 (UTC)
Received: from mail.d-a-s.com (mail.d-a-s.com [72.66.92.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 95598cc5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 00:09:00 +0000 (UTC)
Received: from localhost (localhost.d-a-s.com [127.0.0.1])
 by mail.d-a-s.com (Postfix) with ESMTP id 050F62EC0562
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 10:26:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=d-a-s.com; s=mail;
 t=1592404000; bh=QnHhzTpCScHaCBCJQQyz/hdS4aBrmDihda7EdC1Jefc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MKFZYvMIjohkNxCyIThrnsm3ghoTQQhqunMSO1gIuKoeB/M2EPO7XWZGS4hH9AXaA
 ZSKmE6LDsXduz9DlT892HZnnJ3G/2/edFHVnBTkAIVnybMLDGcsDwVYXbWjb+U1UNt
 qavNIxqTPo4XHE+n/19FVDAZgMXF4TiGfCRoMZ9E=
X-Virus-Scanned: Debian amavisd-new at d-a-s.com
Received: from mail.d-a-s.com ([127.0.0.1])
 by localhost (mail.d-a-s.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJlfvlj9IFKT; Wed, 17 Jun 2020 10:26:39 -0400 (EDT)
Subject: Re: Ubuntu 18.04 broken
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=d-a-s.com; s=mail;
 t=1592403999; bh=QnHhzTpCScHaCBCJQQyz/hdS4aBrmDihda7EdC1Jefc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eWeiCt+Iw3Oybzx6rk+5ezQLefINGYFMmJtjSDM3jgauu9/t2AjeQzKoNRpqnUClF
 +x3Zdra2pKGNPuv1N0HVMUo+HG6+QxzTBfGGAW1c+295Is+kc9QpBhhuL1HUpxySfG
 jXnDPEvSqisfgwcLRWcECsLHzoH9ELjAdkWy9Kow=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b4e30054-3864-c9eb-86dd-b8236af24a5a@d-a-s.com>
 <CAHmME9ox8eSuvkEnaBSD9epdKGkjZxYWXAzwUjLkhwcTv+oaAw@mail.gmail.com>
From: Doug Walker <dwalker@d-a-s.com>
Message-ID: <efebdc3f-5c77-9513-baf6-bfd2d979ed1d@d-a-s.com>
Date: Wed, 17 Jun 2020 10:26:37 -0400
MIME-Version: 1.0
In-Reply-To: <CAHmME9ox8eSuvkEnaBSD9epdKGkjZxYWXAzwUjLkhwcTv+oaAw@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020801030100040805020408"
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

--------------ms020801030100040805020408
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Yep, I just read that.

Thank you for your response and all the hard work you guys are putting in=
=2E

Doug

On 6/17/2020 4:21 AM, Jason A. Donenfeld wrote:
> On Wed, Jun 17, 2020 at 2:01 AM Doug Walker <dwalker@d-a-s.com> wrote:
>> I see that build issues have been reported, but after updating the
>> server I'm having the same issue with the release from
>> http://ppa.launchpad.net/wireguard/wireguard/ubuntu bionic main.
>>
>> Any eta for an update of the ppa?
>>
>> I've had to switch everyone back to OpenVPN, so it may really be a moo=
t
>> point.  Getting people to move back might be a non-starter.
>=20
> See <https://lists.zx2c4.com/pipermail/wireguard/2020-June/005545.html>=

> for an explanation. A longterm solution is coming very soon I hope,
> but the onus is on Canonical.
>=20


--------------ms020801030100040805020408
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
FFowggSSMIIDeqADAgECAgIC9TANBgkqhkiG9w0BAQsFADBNMQswCQYDVQQGEwJVUzEYMBYG
A1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0ExFjAUBgNVBAMTDUVDQSBSb290
IENBIDQwHhcNMTkwNTA3MTI1NTI4WhcNMjUwNTA3MTI1NTI4WjB1MQswCQYDVQQGEwJVUzEY
MBYGA1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRp
ZmljYXRpb24gQXV0aG9yaXRpZXMxGjAYBgNVBAMTEUlkZW5UcnVzdCBFQ0EgUzIyMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt6DTxW5yDAER5mqwNjBumWj29f1myTOf5jY+
hFnWGTHaJd/V9DcX12FxPaAgOsj8q3k9NOOYIPQO6woEVFFf31rNmuE7b5lmhOtjGP8BUUOQ
Iq0lBZxH+Kx6yXQ0gDtDZkpVQMDkxMOxKo8cRcc65DjecWG006CCLcTBN/nIhykX8cXlxIk8
klIkkuC7j6ymjTnMHCAhKGpu1AbDIjyC+RhFhkrhuYNsw9Bpqm941owaLCeiHky8K/mWLfYY
v3Yysz6aUJcWdwZUoEStjClzMDPsRyJD9CbxQ0ZCrSa1NK9HSGc0teT088t21uLDvkWBzGr7
hCOPXJqQGZ4F3oS4IQIDAQABo4IBUjCCAU4wHwYDVR0jBBgwFoAUM1ulb3pVYCuBSyYUzHm/
SrqLMr0wHQYDVR0OBBYEFOikBAKeSdIV0aVfu+uUOQS7giluMA4GA1UdDwEB/wQEAwIBhjAz
BgNVHSAELDAqMAwGCmCGSAFlAwIBDAQwDAYKYIZIAWUDAgEMBTAMBgpghkgBZQMCAQwKMBIG
A1UdEwEB/wQIMAYBAf8CAQAwDAYDVR0kBAUwA4ABADA3BgNVHR8EMDAuMCygKqAohiZodHRw
Oi8vY3JsLmRpc2EubWlsL2NybC9FQ0FST09UQ0E0LmNybDBsBggrBgEFBQcBAQRgMF4wOgYI
KwYBBQUHMAKGLmh0dHA6Ly9jcmwuZGlzYS5taWwvaXNzdWVkdG8vRUNBUk9PVENBNF9JVC5w
N2MwIAYIKwYBBQUHMAGGFGh0dHA6Ly9vY3NwLmRpc2EubWlsMA0GCSqGSIb3DQEBCwUAA4IB
AQBIB/AYjrPQr2Jh/qkcECcjetqBrhU8SsNRI42IW2xdfRqBODnKxWDFkkBtfNd/8+g5/76e
6c8f0Zw9fn8UTqdMaU0H9ylZt9ngc8aM6BhcaOyK1ClZwHohTpZHemhlI8nw6o7VRgIWl8E0
Om/AOOuNxPOYJ1DeG4XfGKqbTMwXVLVYE1M9PO3kNQpVFiXzwtw5WxCoQjkXd6aq1PWWehMF
+r54/O4+Ycu/Gr5y66EEFPnqLKXjJnJcOVDzwQ/k/7sGpQW7kxHeY/+YbBVdG0R0MvCyKIBW
gIwimt0viqqqa3oOCnYP3J1vB7vu+GH9d1bZKB64WZGknXyHK3QS8DArMIIHtzCCBp+gAwIB
AgIQQAFxYIMcFCySCihTffK0sDANBgkqhkiG9w0BAQsFADB1MQswCQYDVQQGEwJVUzEYMBYG
A1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRpZmlj
YXRpb24gQXV0aG9yaXRpZXMxGjAYBgNVBAMTEUlkZW5UcnVzdCBFQ0EgUzIyMB4XDTIwMDQw
OTE5NTUzN1oXDTIzMDQwOTE5NTUzN1owgaUxCzAJBgNVBAYTAlVTMRgwFgYDVQQKEw9VLlMu
IEdvdmVybm1lbnQxDDAKBgNVBAsTA0VDQTESMBAGA1UECxMJSWRlblRydXN0MSIwIAYDVQQL
ExlEWU5BTUlDIEFOSU1BVElPTiBTWVNURU1TMTYwNAYDVQQDEy1DYXJsIEQgV2Fsa2VyOkEw
MTA5QjMwMDAwMDE3MENBM0ZFODBDMDAwMDZCOEQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDkyQXfbPSBCGbWLNck/J8/5lC/gGFVYuquND+I/eVPC2TJU7KP+AF0YISYL4w1
0TH0lMkr33S0dT9BMZflj5x2oyGGYKDKiTtYFO3vbAXU/jeWOIcMHV8e1IXb54vYuuFcQ64c
+vqIE6YAKg+Y7M7/ZJQVYAnMMi0EoNAZIyf808FMKDrKCnP3cPmlRO92u5nCQur5u46fGDBY
c1f8XIOolvWx/t3QG6PvbaaeAJmoGiIGtWERsYgK+BglcFvQc7FcPD3DupH3fI38F+fOS0Ue
+CaGMzNIDR1tolJWapd6E5vd1BV/V6r3AeyDBWXK695rengUa5YK8YUjs5qG0klNAgMBAAGj
ggQQMIIEDDAOBgNVHQ8BAf8EBAMCBSAwggExBggrBgEFBQcBAQSCASMwggEfMCsGCCsGAQUF
BzABhh9odHRwOi8vZWNhczIub2NzcC5pZGVudHJ1c3QuY29tMIGoBggrBgEFBQcwAoaBm2xk
YXA6Ly9sZGFwZWNhLmlkZW50cnVzdC5jb20vY24lM0RJZGVuVHJ1c3QlMjBFQ0ElMjBTMjIl
MkNvdSUzRENlcnRpZmljYXRpb24lMjBBdXRob3JpdGllcyUyQ291JTNERUNBJTJDbyUzRFUu
Uy4lMjBHb3Zlcm5tZW50JTJDYyUzRFVTP2NBQ2VydGlmaWNhdGU7YmluYXJ5MEUGCCsGAQUF
BzAChjlodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NlcnRzL2lkZW50cnVzdGVj
YXMyMi5jZXIwHwYDVR0jBBgwFoAU6KQEAp5J0hXRpV+765Q5BLuCKW4wGwYDVR0JBBQwEjAQ
BggrBgEFBQcJBDEEEwJVUzCCATMGA1UdIASCASowggEmMIIBIgYKYIZIAWUDAgEMBTCCARIw
SwYIKwYBBQUHAgEWP2h0dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20vY2VydGlmaWNhdGVz
L3BvbGljeS9lY2EvaW5kZXguaHRtbDCBwgYIKwYBBQUHAgIwgbUMgbJDZXJ0aWZpY2F0ZSB1
c2UgcmVzdHJpY3RlZCB0byBSZWx5aW5nIFBhcnR5KHMpIGluIGFjY29yZGFuY2Ugd2l0aCBF
Q0EtQ1AgKHNlZSBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9w
b2xpY3kvRUNBL2luZGV4Lmh0bWwpLiBFQ0EtQ1BTIGluY29ycG9yYXRlZCBieSByZWZlcmVu
Y2UuMIH9BgNVHR8EgfUwgfIwgbCgga2ggaqGgadsZGFwOi8vbGRhcGVjYS5pZGVudHJ1c3Qu
Y29tL2NuJTNESWRlblRydXN0JTIwRUNBJTIwUzIyJTJDb3UlM0RDZXJ0aWZpY2F0aW9uJTIw
QXV0aG9yaXRpZXMlMkNvdSUzREVDQSUyQ28lM0RVLlMuJTIwR292ZXJubWVudCUyQ2MlM0RV
Uz9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeTA9oDugOYY3aHR0cDovL3ZhbGlk
YXRpb24uaWRlbnRydXN0LmNvbS9jcmwvaWRlbnRydXN0ZWNhczIyLmNybDAcBgNVHREEFTAT
gRFkd2Fsa2VyQGQtYS1zLmNvbTAdBgNVHQ4EFgQUKnhkilFcM0h2hwVe/PjwgwfCLNswEwYD
VR0lBAwwCgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAAYCezJjuX2QK/4vZMJl0sR3
bPCjO+Fadps68HuAhgyYeHQUAQRDXy0KgQofKQk2WV22SjSoZuzCJPoGwtER1pxcfOV0YfyW
zn8Fka2svs2tula8AMsh7YqrcqyMVMsK2C2P3mszFc5p26fQVQB1plvo7FWieMLybBhU0Ap4
iQoe8Ehv2NCSVrKH+jjvV0ujUFYk5/6n+2z7+UM5/zX5hv1mEv7nSwIJ58oB+Gdc+tuNvYds
oR/kmKQNPBwdfxe1hCmFUuK0egBy6o1/5Ge3LZ24uC1Utm3fpSvOq4w1THGMeAJRawZBjbjv
gfvvfrfeRFGyAdEX5XNK+ThUX4+GBuUwgggFMIIG7aADAgECAhBAAXFghAFboRwOnBRjmAXa
MA0GCSqGSIb3DQEBCwUAMHUxCzAJBgNVBAYTAlVTMRgwFgYDVQQKEw9VLlMuIEdvdmVybm1l
bnQxDDAKBgNVBAsTA0VDQTEiMCAGA1UECxMZQ2VydGlmaWNhdGlvbiBBdXRob3JpdGllczEa
MBgGA1UEAxMRSWRlblRydXN0IEVDQSBTMjIwHhcNMjAwNDA5MTk1NjM2WhcNMjMwNDA5MTk1
NjM2WjCBpTELMAkGA1UEBhMCVVMxGDAWBgNVBAoTD1UuUy4gR292ZXJubWVudDEMMAoGA1UE
CxMDRUNBMRIwEAYDVQQLEwlJZGVuVHJ1c3QxIjAgBgNVBAsTGURZTkFNSUMgQU5JTUFUSU9O
IFNZU1RFTVMxNjA0BgNVBAMTLUNhcmwgRCBXYWxrZXI6QTAxMDlCMzAwMDAwMTcwQ0EzRkU4
MEMwMDAwNkI4RDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALooWwc/GFRGaI5G
U65NYbs3jFxDoFHe052sRZntt9KDJ8q+KSAGY3zJAijKJuDp7H0vmSx0O799KhcS2jMghx1Z
bN7e3s8OOAcvkJjjZ3vB9pb7XwIz4tnYnyolne6l9J3QB9s/FipTqR+jMExYaNKImPMICvAQ
u24YUA06XzN9tBd/tUVBZW9m2FqM7VnbFSMF/NzECayl1KbqGKgQ3hlat1TaDGiab1RvMfdB
wpiK0p7egTXPRPyUhIBUFT5yqEcwwwaysfQ2VqR9P4nUF3uslAJ6f3ojKgTN+Ig/pevbVp1P
ILx2kHGBCwvD/NIFg0Z+7dDi0QSgc5aZHdtYGzUCAwEAAaOCBF4wggRaMA4GA1UdDwEB/wQE
AwIGwDCCATEGCCsGAQUFBwEBBIIBIzCCAR8wKwYIKwYBBQUHMAGGH2h0dHA6Ly9lY2FzMi5v
Y3NwLmlkZW50cnVzdC5jb20wgagGCCsGAQUFBzAChoGbbGRhcDovL2xkYXBlY2EuaWRlbnRy
dXN0LmNvbS9jbiUzRElkZW5UcnVzdCUyMEVDQSUyMFMyMiUyQ291JTNEQ2VydGlmaWNhdGlv
biUyMEF1dGhvcml0aWVzJTJDb3UlM0RFQ0ElMkNvJTNEVS5TLiUyMEdvdmVybm1lbnQlMkNj
JTNEVVM/Y0FDZXJ0aWZpY2F0ZTtiaW5hcnkwRQYIKwYBBQUHMAKGOWh0dHA6Ly92YWxpZGF0
aW9uLmlkZW50cnVzdC5jb20vY2VydHMvaWRlbnRydXN0ZWNhczIyLmNlcjAfBgNVHSMEGDAW
gBTopAQCnknSFdGlX7vrlDkEu4IpbjAbBgNVHQkEFDASMBAGCCsGAQUFBwkEMQQTAlVTMIIB
MwYDVR0gBIIBKjCCASYwggEiBgpghkgBZQMCAQwFMIIBEjBLBggrBgEFBQcCARY/aHR0cHM6
Ly9zZWN1cmUuaWRlbnRydXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L2VjYS9pbmRleC5o
dG1sMIHCBggrBgEFBQcCAjCBtQyBskNlcnRpZmljYXRlIHVzZSByZXN0cmljdGVkIHRvIFJl
bHlpbmcgUGFydHkocykgaW4gYWNjb3JkYW5jZSB3aXRoIEVDQS1DUCAoc2VlIGh0dHBzOi8v
c2VjdXJlLmlkZW50cnVzdC5jb20vY2VydGlmaWNhdGVzL3BvbGljeS9FQ0EvaW5kZXguaHRt
bCkuIEVDQS1DUFMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZS4wgf0GA1UdHwSB9TCB8jCB
sKCBraCBqoaBp2xkYXA6Ly9sZGFwZWNhLmlkZW50cnVzdC5jb20vY24lM0RJZGVuVHJ1c3Ql
MjBFQ0ElMjBTMjIlMkNvdSUzRENlcnRpZmljYXRpb24lMjBBdXRob3JpdGllcyUyQ291JTNE
RUNBJTJDbyUzRFUuUy4lMjBHb3Zlcm5tZW50JTJDYyUzRFVTP2NlcnRpZmljYXRlUmV2b2Nh
dGlvbkxpc3Q7YmluYXJ5MD2gO6A5hjdodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29t
L2NybC9pZGVudHJ1c3RlY2FzMjIuY3JsMFQGA1UdEQRNMEuBEWR3YWxrZXJAZC1hLXMuY29t
oDYGCisGAQQBgjcUAgOgKAwmQTAxMDlCMzAwMDAwMTcwQ0EzRkU4MEMwMDAwNkI4REBET0RF
Q0EwHQYDVR0OBBYEFNxCmBkEUGfvC3iIKXG8yr3RZHOTMCkGA1UdJQQiMCAGCCsGAQUFBwMC
BggrBgEFBQcDBAYKKwYBBAGCNxQCAjANBgkqhkiG9w0BAQsFAAOCAQEAoHAxgJY9wrJ9QCSf
gy8cwVtcux5BLdDZN22OcA8w87oHfZ17XxLZ0+Mgun80gA31twiJfiYL0DYDwjaAvMKZrRUv
KMN8ZevPNGT1zJlinM62ieUtYsfrgYqqqQT4deoC6fsvp3agEgC601Coa2dkJ+xSMZTxoGa+
879+O3NNNwEOHmCw4+pBT1Ki9oyo8I/RbU7pu6IwSGtcr+wmHXvDWhbEPAxDaBshloiB9qfL
gc5NzKAm1QbSFxNYOhpsfsYPPy30vp5WF+HByrTHbUfw8KK4Ehkgfih+ysqBRu77228XdCF8
aXH4iTbPOVTvXtE2dVk7C3+rNzdSHX2hZXResjGCA8wwggPIAgEBMIGJMHUxCzAJBgNVBAYT
AlVTMRgwFgYDVQQKEw9VLlMuIEdvdmVybm1lbnQxDDAKBgNVBAsTA0VDQTEiMCAGA1UECxMZ
Q2VydGlmaWNhdGlvbiBBdXRob3JpdGllczEaMBgGA1UEAxMRSWRlblRydXN0IEVDQSBTMjIC
EEABcWCEAVuhHA6cFGOYBdowDQYJYIZIAWUDBAIBBQCgggITMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDYxNzE0MjYzOFowLwYJKoZIhvcNAQkEMSIE
II9zkLM4SzhacF6qKbd6YEY35BLJ2Df0jwgimXG9ToZZMGwGCSqGSIb3DQEJDzFfMF0wCwYJ
YIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYI
KoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZoGCSsGAQQBgjcQBDGBjDCB
iTB1MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNF
Q0ExIjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9yaXRpZXMxGjAYBgNVBAMTEUlkZW5U
cnVzdCBFQ0EgUzIyAhBAAXFggxwULJIKKFN98rSwMIGcBgsqhkiG9w0BCRACCzGBjKCBiTB1
MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0Ex
IjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9yaXRpZXMxGjAYBgNVBAMTEUlkZW5UcnVz
dCBFQ0EgUzIyAhBAAXFggxwULJIKKFN98rSwMA0GCSqGSIb3DQEBAQUABIIBAK8jx6cTbgAA
0UqMMuHZt9DEJWPzlI1WfUZ1Ff4hcpwpCu/DJsemUbZ0LabIXFOXknYVm2oJG+moIbH1/8b/
z1/PfEDP6VEK2DRNs6k94W7BLplgbiNqtJt11zUbLgNj3/G8JLivFgFrSxacLLgLMJasfCVX
YAcv73kolAGjlazMhzst4IbrlR+MYdm+ne1pdCoJ+NkzpbKFHYzcX7bV6KKNNeVx8bm9jRqi
z3TvqyO0yJSChiXOFDpuDNn0sbZw35XjLwH7P00G8krmHKmnE6ZNJASfRse65v68OUSRCi1M
IBsaR9G5jy/JMRV0wDaf1nEyzntX4qG1WMEP2w6rCA0AAAAAAAA=
--------------ms020801030100040805020408--
