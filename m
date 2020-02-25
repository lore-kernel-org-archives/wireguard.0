Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC0DC35DF8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 07:34:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E3921556
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 07:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="RxxfRCPH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E3921556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312f4b6f;
	Tue, 25 Feb 2020 07:31:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02a6a447
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:31:16 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 877d419a
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:31:16 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id E14EE1002F94; Tue, 25 Feb 2020 08:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1582616084;
 bh=z5jaZ4jIyLx20L4Ey+f6KOvXe5UgQcs/yT+NTOgWFro=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RxxfRCPHI7HROgOZH9AIOajLSNJkFtJ05a2T2NFImUx5PZdVGyWffy+LoV5IKNuTc
 0inPOV9TotVmZbnhr+wPD2SZuWm/Mge59T2yCkLDGU/z27uOCORVCrsamKj5IJXRuU
 UWbT/agq0HsJIs9kFA+lK+BjlWfp7NWGDxTnPB28=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 412511002F87;
 Tue, 25 Feb 2020 08:34:42 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0468.000; Tue, 25 Feb 2020 08:34:42 +0100
From: Simon Rozman <simon@rozman.si>
To: Eiji Tanioka <tanioka404@gmail.com>
Subject: Re: [PATCH] Add japanese translation.
Thread-Topic: [PATCH] Add japanese translation.
Thread-Index: AQHV4yYHU90nY+tQGEeolquzntujRqgbjDWAgAA8cxqAADQ0gIABldSAgAA824CACpTGgIAAGkq7///ypgCAACa8UIAC5WEAgAAYaoA=
Date: Tue, 25 Feb 2020 07:34:41 +0000
Message-ID: <33114245-EBC2-4CD6-B4FF-F3D5B72B6459@rozman.si>
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
 <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
 <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
 <3a52d59c-0784-4eaf-aedd-ce7baba2f5c3@rozman.si>
 <CAA2ss9FUyK_Hrk3AoPLd9cKe1Mpci=yt28L_zY9kQ7S2_1eqkw@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0760855@PLANJAVA.amebis.doma>
 <CAA2ss9EORZq+NzY0zeDVFNna6cf8T62S+GxsddiWEkaFC10LNA@mail.gmail.com>
In-Reply-To: <CAA2ss9EORZq+NzY0zeDVFNna6cf8T62S+GxsddiWEkaFC10LNA@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.22.0.200209
x-originating-ip: [2a00:ee2:209:164::1]
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2100720993621968504=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2100720993621968504==
Content-Language: en-GB
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha256; boundary="B_3665464481_1008178226"

--B_3665464481_1008178226
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi Eiji,

Yes, Microsoft-assigned locale ID for Japanese is 0x0411.

(0x04b0 stands for UTF-16. Legacy software would probably specify 0x03a4 =3D =
Japan (Shift =E2=80=93 JIS X-0208) here. I'm not sure if this property is actually=
 used anywhere other than Windows 95.)

Just put something like this to the resources.rc file after French (to keep=
 the list sorted by language names in English):

LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT
VERSIONINFO_TEMPLATE(
  "041104b0", 0x411, 0x4b0,
  "WireGuard: =E9=AB=98=E9=80=9F=E3=81=A7=E6=9C=80=E6=96=B0=E3=81=AE=E5=AE=89=E5=85=A8=E3=81=AAVPN=E3=83=88=E3=83=B3=E3=83=8D=E3=83=AB",
  "https://www.wireguard.com/"
)

Best regards,
Simon

=EF=BB=BF-----Original Message-----
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tuesday, 25 February 2020 at 08:07
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Add japanese translation.

    Hi Simon,
   =20
    I read "resources.rc", and start working.
    and I have question about it.
   =20
    - For Japanese resource, copy from line 45-50 and paste it at EOF
    - Rewrite "LANG_ENGLISH" to "LANG_JAPANESE"
    - Rewrite "040904b0" to "041104b0"
    - Rewrite "0x409" to "0x411"
    - Translate "WireGuard: Fast, Modern, Secure VPN Tunnel" into Japanese
   =20
    I googled and found that "0x411" means "Japanese".
    https://docs.microsoft.com/en-us/windows/win32/menurc/versioninfo-resou=
rce
   =20
    Is this correct?
   =20
    Regards,
   =20

--B_3665464481_1008178226
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

--B_3665464481_1008178226--

--===============2100720993621968504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2100720993621968504==--
