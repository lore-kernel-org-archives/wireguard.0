Return-Path: <SRS0=l04w=4P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA24AC4BA3B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 11:40:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A67A24690
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 11:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="aJ979jZt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A67A24690
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8901807c;
	Thu, 27 Feb 2020 11:36:41 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ce73130
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Feb 2020 11:36:39 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 1FC7E1002F87; Thu, 27 Feb 2020 12:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1582803624;
 bh=QrGZLGShT8j2GJ5+o3g/qXsc5LANvPhCvxFRlZwrbmw=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=aJ979jZtiX5D51ELqcYyCUerbGgVT/x6vfqJh6Uq/VuI0swDxEbpMOw7isi+rcaw0
 Wh+Z7gq8LR9f6HXD0iCamjyMVFTTW/yZlklvcWm8End6Oz29yhnTKNo9lw1vFqzy7F
 IFvpCMrnQV5EoFMOep4U4xZ7qtU30N9eZ7e8fc8A=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 58D011002F87;
 Thu, 27 Feb 2020 12:40:21 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Thu, 27 Feb 2020 12:40:21 +0100
From: Simon Rozman <simon@rozman.si>
To: Arjen Brouwer <arjenjb@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] DO_NOT_LAUNCH parameter was ignored by MSI, should work
 now
Thread-Topic: [PATCH] DO_NOT_LAUNCH parameter was ignored by MSI, should
 work now
Thread-Index: AQHV6xbhddRYcZ6UTUa9oM8/janovKgu7zMA
Date: Thu, 27 Feb 2020 11:40:20 +0000
Message-ID: <AE60ED0F-6F29-43E2-9565-D61998256B85@rozman.si>
References: <20200224133237.953-1-arjenjb@gmail.com>
In-Reply-To: <20200224133237.953-1-arjenjb@gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.22.0.200209
x-originating-ip: [2a00:ee2:209:164::1]
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7145866042671502114=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7145866042671502114==
Content-Language: en-GB
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha256; boundary="B_3665652020_936472756"

--B_3665652020_936472756
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi Arjen,

I was not able to reproduce the problem your patch was supposed to solve.

Running:
msiexec /i https://download.wireguard.com/windows-client/wireguard-amd64-0.=
0.38.msi /l* setup.log DO_NOT_LAUNCH=3D1
did not launch the WireGuard after setup was complete. Screencast here: htt=
ps://1drv.ms/v/s!AsRKV9itoeUTi0Y-LT895Ynvh0da

Running the same command in elevated prompt neither. Screen cast here: http=
s://1drv.ms/v/s!AsRKV9itoeUTi0cEkCG_n2FEX1WA

When adding /qn to completely silence the MSI progress neither. Screen cast=
 here: https://1drv.ms/v/s!AsRKV9itoeUTi0izY000CEIE4axC

So, how were you setting the `DO_NOT_LAUNCH` property in the first place?

Regards,
Simon

=EF=BB=BF-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Arjen Brou=
wer <arjenjb@gmail.com>
Date: Tuesday, 25 February 2020 at 01:51
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Cc: Arjen Brouwer <arjen@ag5.nl>
Subject: [PATCH] DO_NOT_LAUNCH parameter was ignored by MSI, should work no=
w

    From: Arjen Brouwer <arjen@ag5.nl>
   =20
   =20
    The `DO_NO_LAUNCH` parameter did not actually work. After running the i=
nstaller with the DO_NO_LAUNCH parameter, the UI still showed up afterwards =
and the MSI log had the following entry:
   =20
    ```
    MSI (c) (28:08) [14:43:17:966]: Ignoring disallowed property DO_NOT_LAU=
NCH
    ```
   =20
    By explicitly defining the DO_NOT_LAUNCH property and making it secure,=
 solved the problem.
   =20
    ---
     installer/wireguard.wxs | 7 ++++---
     1 file changed, 4 insertions(+), 3 deletions(-)
   =20
    diff --git a/installer/wireguard.wxs b/installer/wireguard.wxs
    index 5bbb1eb..781d20c 100644
    --- a/installer/wireguard.wxs
    +++ b/installer/wireguard.wxs
    @@ -45,7 +45,8 @@
     		<Property Id=3D"DISABLEROLLBACK" Value=3D"yes" />
     		<Property Id=3D"MSIDISABLERMRESTART" Value=3D"1" />
     		<Property Id=3D"MSIRMSHUTDOWN" Value=3D"1" />
    -
    +		<Property Id=3D"DO_NOT_LAUNCH" Value=3D"0" Secure=3D"yes" />
    +		
     		<!--
     			Upgrading
     		-->
    @@ -135,7 +136,7 @@
     		-->
     		<CustomAction Id=3D"LaunchApplication" HideTarget=3D"yes" Impersonate=3D"n=
o" Execute=3D"deferred" FileKey=3D"wireguard.exe" ExeCommand=3D"" Return=3D"asyncNoW=
ait" />
     		<InstallExecuteSequence>
    -			<Custom Action=3D"LaunchApplication" Before=3D"InstallFinalize">(&amp;W=
ireGuardFeature =3D 3) AND NOT DO_NOT_LAUNCH</Custom>
    +			<Custom Action=3D"LaunchApplication" Before=3D"InstallFinalize"><![CDAT=
A[(&WireGuardFeature =3D 3) AND (DO_NOT_LAUNCH =3D "0")]]></Custom>
     		</InstallExecuteSequence>
    =20
     		<!--
    @@ -143,7 +144,7 @@
     		-->
     		<CustomAction Id=3D"LaunchApplicationAsOrdinaryUser" HideTarget=3D"yes" =
FileKey=3D"wireguard.exe" ExeCommand=3D"" Return=3D"asyncNoWait" />
     		<InstallExecuteSequence>
    -			<Custom Action=3D"LaunchApplicationAsOrdinaryUser" After=3D"InstallFina=
lize">(&amp;WireGuardFeature =3D -1) AND (!WireGuardFeature =3D 3) AND NOT DO_NO=
T_LAUNCH</Custom>
    +			<Custom Action=3D"LaunchApplicationAsOrdinaryUser" After=3D"InstallFina=
lize"><![CDATA[(&WireGuardFeature =3D -1) AND (!WireGuardFeature =3D 3) AND (DO_=
NOT_LAUNCH =3D "0")]]></Custom>
     		</InstallExecuteSequence>
     	</Product>
     </Wix>
    --=20
    2.24.1.windows.2
   =20
    _______________________________________________
    WireGuard mailing list
    WireGuard@lists.zx2c4.com
    https://lists.zx2c4.com/mailman/listinfo/wireguard
   =20

--B_3665652020_936472756
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
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

--B_3665652020_936472756--

--===============7145866042671502114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7145866042671502114==--
