Return-Path: <SRS0=l04w=4P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2D7C4BA24
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 11:47:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA9024693
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 11:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="Bghs31iR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA9024693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8df1d4d;
	Thu, 27 Feb 2020 11:43:40 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1e5c659
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Feb 2020 11:43:38 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id BD8C31002FB5; Thu, 27 Feb 2020 12:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1582804043;
 bh=NhsNCish2qxxbGJsPvhB00b+eTubPJldY4BHwGHuicM=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Bghs31iRxx4XGi9LmqptqhKH2OPTfj54vB6AgSpQctTwkwEhou52qVtYJkK076guE
 aj0RhqsI3kTC2DAUFraWzdC2MKTnJbl7/8s6ZY30ud/X/ANnTx24kXIcpZ85p30FA1
 iIg2W+Gxf/WHe63MA55lB2fRsDxSXPR0LdbHR4V4=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 2946E1002F87;
 Thu, 27 Feb 2020 12:47:21 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Thu, 27 Feb 2020 12:47:21 +0100
From: Simon Rozman <simon@rozman.si>
To: Eiji Tanioka <tanioka404@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH wireguard-windows] l18n: change EnumerationSeparator for
 Japanese.
Thread-Topic: [PATCH wireguard-windows] l18n: change EnumerationSeparator
 for Japanese.
Thread-Index: AQHV7VJtD2Fs8wXzu0G4VLlr4qtkPqgu7LAA
Date: Thu, 27 Feb 2020 11:47:20 +0000
Message-ID: <3494258D-7F14-4890-B3A4-8CED4EA24D05@rozman.si>
References: <20200227094326.9597-1-tanioka404@gmail.com>
In-Reply-To: <20200227094326.9597-1-tanioka404@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5903017340232201208=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5903017340232201208==
Content-Language: en-GB
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha256; boundary="B_3665652440_613929565"

--B_3665652440_613929565
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Arigato!

Rebuilt the zgotext.go file, amended to your commit, and applied to sr/l18n=
 patch.

Regards, Simon

=EF=BB=BF-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Eiji Tanio=
ka <tanioka404@gmail.com>
Date: Thursday, 27 February 2020 at 10:43
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [PATCH wireguard-windows] l18n: change EnumerationSeparator for Ja=
panese.

    I grepped source tree and found that 'EnumerationSeparator' is used
    for multiple IP addresses separation. In these situation, comma is
    better than "=E3=80=81" in Japanese.
    ("=E3=80=81" is used for Japanese sentence separator, but separation by comma
    is more preferable to enumerate ASCII values.)
   =20
    Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
    ---
     locales/ja/messages.gotext.json | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)
   =20
    diff --git a/locales/ja/messages.gotext.json b/locales/ja/messages.gote=
xt.json
    index 3501458..723cb6c 100644
    --- a/locales/ja/messages.gotext.json
    +++ b/locales/ja/messages.gotext.json
    @@ -455,7 +455,7 @@
             {
                 "id": "[EnumerationSeparator]",
                 "message": "[EnumerationSeparator]",
    -            "translation": "=E3=80=81",
    +            "translation": ", ",
                 "comment": "Inserted between items when listing (e.g. =E2=80=98,=
 =E2=80=99 or =E2=80=98=E3=80=81=E2=80=99)"
             },
             {
    @@ -1494,4 +1494,4 @@
                 ]
             }
         ]
    -}
    \ No newline at end of file
    +}
    --=20
    2.25.0
   =20
    _______________________________________________
    WireGuard mailing list
    WireGuard@lists.zx2c4.com
    https://lists.zx2c4.com/mailman/listinfo/wireguard
   =20

--B_3665652440_613929565
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

--B_3665652440_613929565--

--===============5903017340232201208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5903017340232201208==--
