Return-Path: <SRS0=Rf1T=6J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3282EC55186
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Apr 2020 06:23:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4402F20767
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Apr 2020 06:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="Yi/AN32H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4402F20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7885027a;
	Sat, 25 Apr 2020 06:12:18 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc94a7e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Apr 2020 06:12:16 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 50F5E1002FA9; Sat, 25 Apr 2020 08:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1587795806;
 bh=7KRD+qgVOv2X5w5BVzgG+LrC1r79WcPYfv1fIbBrvPQ=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Yi/AN32HTcFIakzepYoW2+L0YISKAX/9IthEfxoBMn2DdhWtVljygvF0C24rz2WzA
 0dxfRWSRmHtZxuHHRTGl/+Tx6y4A9upDPX+LcSSIGzOtu3UGoOEr2/qLzitlLFMqfB
 pixyB+SWY87QPjxzJ1ShV/45O5/qgOcEpOw1J0NU=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 973B11002FA1;
 Sat, 25 Apr 2020 08:23:23 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Sat, 25 Apr 2020 08:23:23 +0200
From: Simon Rozman <simon@rozman.si>
To: Shawn Hoffman <godisgovernment@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH 0/1] wintun: use standard volatile semantics
Thread-Topic: [PATCH 0/1] wintun: use standard volatile semantics
Thread-Index: AQHWGno0X1xiA9GKeU+V6EcPByd9H6iJXxUA
Date: Sat, 25 Apr 2020 06:23:23 +0000
Message-ID: <B6B013EB-18CF-4017-A096-3512B19C9963@rozman.si>
References: <20200424194010.32225-1-godisgovernment@gmail.com>
In-Reply-To: <20200424194010.32225-1-godisgovernment@gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.36.20041300
x-originating-ip: [2a00:ee2:209:164::1]
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha256; boundary="B_3670647802_893478996"
MIME-Version: 1.0
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

--B_3670647802_893478996
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi Shawn!

Thank you. This generally looks good. I can't find any official documentati=
on on the set of functions and macros from wdm.h, but that's nothing new wit=
h Microsoft.=20

I have some nitpicks thou.

1. As the atomic.h is no longer used; it could be deleted from the repo.
2. By removing #include "atomic.h", you should add #include <wdm.h>. wintun=
.c is now directly using functions and macros declared in wdm.h.
3. Please add "Signed-of-by: Shawn Hoffman <godisgovernment@gmail.com>" lin=
e to your commit message.
4. You are right, there is no WireGuard for Windows 10 ARM64 yet, because t=
here is no MinGW and Go support for Windows 10 ARM64 yet. If we can get arm-=
w64-mingw32-native, we could use set GOARCH=3Darm to compile 32-bit ARM wiregu=
ard.exe. 32-bit ARM runs at native speed on Windows 10 ARM64. The challenge =
I see is making SetupAPI work. I do know the SetupAPI does not work in x86 p=
rocesses on AMD64 Windows. The System32 folder deflection makes it fail when=
 attempting to create a device. I am expecting the same in ARM process on AR=
M64 Windows.

I have the ARM/ARM64 support high on my TODO list. I do hope to find some t=
ime next week to play with your patch and WireGuard ARM.

Regards, Simon

=EF=BB=BF-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Shawn Hoff=
man <godisgovernment@gmail.com>
Date: Friday, 24. April 2020 at 22:52
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 0/1] wintun: use standard volatile semantics

    Make all archs are use the standardized concept of volatile.
    This patch will cause the most changes to arm64 codegen, and has
    yet to be tested on arm64 so is currently being submitted for
    comments. If someone would like to test on arm64 it would be
    appreciated. I do have an arm64 device, but it seems there's no
    existing arm64/windows wireguard binary package, so I can't
    just install such a thing and swap out the driver.

    Shawn Hoffman (1):
      replace atomic.h with provided APIs switch to /volatile:iso

     wintun.c               | 76 +++++++++++++++++++++---------------------
     wintun.vcxproj         |  5 ++-
     wintun.vcxproj.filters |  3 --
     3 files changed, 40 insertions(+), 44 deletions(-)

    --=20
    2.20.1


--B_3670647802_893478996
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIILkQYJKoZIhvcNAQcCoIILgjCCC34CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggl6MIIFWTCCBEGgAwIBAgIEO0oNLjANBgkqhkiG9w0BAQUFADA9MQswCQYDVQQGEwJz
aTEbMBkGA1UEChMSc3RhdGUtaW5zdGl0dXRpb25zMREwDwYDVQQLEwhzaWdlbi1jYTAeFw0x
NjAyMTkxNzU0NDFaFw0yMTAyMTkyMTM4MTVaMIGAMQswCQYDVQQGEwJTSTEbMBkGA1UEChMS
c3RhdGUtaW5zdGl0dXRpb25zMREwDwYDVQQLEwhzaWdlbi1jYTEUMBIGA1UECxMLaW5kaXZp
ZHVhbHMxKzATBgNVBAMTDFNpbW9uIFJvem1hbjAUBgNVBAUTDTIzNDU2Nzk1MTIwNDIwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD+LEVulmN6fPkadqe82V8M1xrQ52BYGDka
xqVw/tEwalpKEiMR6DO8VfCpkjj1Ka5JEoU21Srm1MFg6Tkot9b8ykHAGEWGakBRBSgJGBBQ
AqiO8knjtQuohXSAFeUWjLMfA3mOZG8rJbGrCyg39Fmm1jeezWYuB/7s2xrqK7Stc/GzIheq
sYE0Pw1FhqtECA52JuzoItOX368d31tN/O1ynkH7F0TXy48GFncmq5Yid3d3QVOk1qQC68lo
ILwSSkLA5xOV6mHz/XlAAb/jfNLfsIyxT1RO4+rPlOulTYVex/bfxlbKGXN4qfK/o84TFqXW
1dbDUK7jS9PzMxthWpTfAgMBAAGjggIbMIICFzAOBgNVHQ8BAf8EBAMCBaAwSwYDVR0gBEQw
QjA2BgsrBgEEAa9ZAgIDAzAnMCUGCCsGAQUFBwIBFhlodHRwOi8vd3d3LmNhLmdvdi5zaS9j
cHMvMAgGBgQAizABAjAYBggrBgEFBQcBAwQMMAowCAYGBACORgEBMBoGA1UdEQQTMBGBD3Np
bW9uQHJvem1hbi5zaTCB7gYDVR0fBIHmMIHjMFagVKBSpFAwTjELMAkGA1UEBhMCc2kxGzAZ
BgNVBAoTEnN0YXRlLWluc3RpdHV0aW9uczERMA8GA1UECxMIc2lnZW4tY2ExDzANBgNVBAMT
BkNSTDQ1NTCBiKCBhaCBgoZXbGRhcDovL3g1MDAuZ292LnNpL291PXNpZ2VuLWNhLG89c3Rh
dGUtaW5zdGl0dXRpb25zLGM9c2k/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlhido
dHRwOi8vd3d3LnNpZ2VuLWNhLnNpL2NybC9zaWdlbi1jYS5jcmwwKwYDVR0QBCQwIoAPMjAx
NjAyMTkxNzU0NDFagQ8yMDIxMDIxOTIxMzgxNVowHwYDVR0jBBgwFoAUcXuKBh8xBVWrYBJ3
RyAeA4gY7IkwHQYDVR0OBBYEFLv/sAfJBgjR7wY4+bBNzVlM3DmXMAkGA1UdEwQCMAAwGQYJ
KoZIhvZ9B0EABAwwChsEVjguMQMCA6gwDQYJKoZIhvcNAQEFBQADggEBAEFQvgobVnWgEgh0
ohmz3InGcmD8t8Q9W/M0fz4IKp6CrQPqTjwOijvahUSKySOqCB1tQaPfS4Afw+MIPmQsZWgP
CHlrZq1DepDNpgD+WPYmzZ/h91c2frS9GntfNsaxB3Bhh5wisrM7nHpdUAhFv5Mdk2NcvdVf
q86jPAFC//53HU/0f+sxSft3xyLu/g96pKFtZtbCLp7PX1xm9IpKTP+VZ/i2PxBsDSdZ5QGW
TcHHr9NF1ruTBfNwUTG35E4a3RgmNtkI3eR3uzBxG9FPqASL0vqfVcuCHA9JiHNmNovl9e8j
XUm5KhALLXddYGSrfkyijiJjX3BqdLVbpQzxirQwggQZMIIDAaADAgECAgQ7PPnJMA0GCSqG
SIb3DQEBBQUAMD0xCzAJBgNVBAYTAnNpMRswGQYDVQQKExJzdGF0ZS1pbnN0aXR1dGlvbnMx
ETAPBgNVBAsTCHNpZ2VuLWNhMB4XDTAxMDYyOTIxMjc0NloXDTIxMDYyOTIxNTc0NlowPTEL
MAkGA1UEBhMCc2kxGzAZBgNVBAoTEnN0YXRlLWluc3RpdHV0aW9uczERMA8GA1UECxMIc2ln
ZW4tY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCw5WWywKxklvKIG7PtnuQC
xk8riM4uilGAda8QW/LLOGabog5tNEeWpZIRr/Y1R6J3IgzOFohiqtNJbhi8LkTYvsaewhoZ
rEGO/DAHAvLGatRbIwDvQTTYpHNj3yKSM4QBpY3zg1z6uNR6Nd/s+G0P4EztrZw6fYbWpQiU
vn16ER/+hT9UWohjh5ylsadOzbdEc6/PiklrH+PN10lNWisX5lx2s7tyuW8n0puJFYjfEF92
IQFqxxUxCtGcWPgoFgVt2U7ZodcHIMtLJolNkrKnupbo41iPIpwBllrE9zFNC0m14Xhh4lQY
BrueVDR+DD7r7rWAH90WhB1oOGZnc/iRAgMBAAGjggEfMIIBGzARBglghkgBhvhCAQEEBAMC
AAcwXwYDVR0fBFgwVjBUoFKgUKROMEwxCzAJBgNVBAYTAnNpMRswGQYDVQQKExJzdGF0ZS1p
bnN0aXR1dGlvbnMxETAPBgNVBAsTCHNpZ2VuLWNhMQ0wCwYDVQQDEwRDUkwxMCsGA1UdEAQk
MCKADzIwMDEwNjI5MjEyNzQ2WoEPMjAyMTA2MjkyMTU3NDZaMAsGA1UdDwQEAwIBBjAfBgNV
HSMEGDAWgBRxe4oGHzEFVatgEndHIB4DiBjsiTAdBgNVHQ4EFgQUcXuKBh8xBVWrYBJ3RyAe
A4gY7IkwDAYDVR0TBAUwAwEB/zAdBgkqhkiG9n0HQQAEEDAOGwhWNS4wOjQuMAMCBJAwDQYJ
KoZIhvcNAQEFBQADggEBAAC6YzTzGBjurn6Nksc19cIT1NYAqiEyFtbQW/opsI36F3eS+aW2
9vmHPwYPIO5iPTT3qS/HqTvQJ4hMrN3JqeVaWIXXEjU93LCCW3L0u3O3+/44IZgEgLKIYg8e
rDoWqeazCvYVEEUDo5fizawQ3PkAHr9zbEPsdyIWBi+Wg4l7sLhTREEI3IAfBdsZCXaHvjWd
TiFLtJPBaDqdXzb+oa4wLEveeCQ6WNYWQ++dmTiLKpj+MNHC6tavJdWldgu570A5Lvbr3zJe
HX2HtUTMAjnSJpVy2G+FQ6iPDqNGztfO6LlWqfiJFxIfQ0kGejLnP75veb7WM9dMPCj8EvF2
dhgxggHbMIIB1wIBATBFMD0xCzAJBgNVBAYTAnNpMRswGQYDVQQKExJzdGF0ZS1pbnN0aXR1
dGlvbnMxETAPBgNVBAsTCHNpZ2VuLWNhAgQ7Sg0uMA0GCWCGSAFlAwQCAQUAoGkwLwYJKoZI
hvcNAQkEMSIEIFaCcgcGBT85fbaxSlpAsA6t9TUNyEqMG9K55YolKcN7MBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDQyNTA2MjMyMlowDQYJKoZIhvcN
AQEBBQAEggEAlwVJ1ddnpPEdS83isMsnXHHgjBsD9KYXdSDek+OjbH15qUEhwszECcwC7BQY
UsukOmHFs9QvwHnhr9d0BZ14GHwxfRVUEoMT0YiEB/cwJoqcpxEZ2WyH/a3Ry3Tldq7NRIRW
l9wichKaC3uura9F6Wih5MStqiQIOpZE7Xy6KwaiMrjDME2F3mkRrElg79c5uaqXDKkxTJQe
t/zINd3KK31A9Eg9+B1pQKfTkgw2qnbysoDckJkphzdthJ9BvcMwQNJCGLdN9YAzIuF+pqnT
qLgESlsbaaZViaDHhEkc8FhoA8GeOsoB1afSwHnRvZJqXTtwFZ0iEW52QhMHL1Mi0w==

--B_3670647802_893478996--
