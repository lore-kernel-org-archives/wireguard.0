Return-Path: <SRS0=FpfO=5R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F23BC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 06:46:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 262F1206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 06:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="q3AbuPm/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 262F1206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b4dfc1c;
	Wed, 1 Apr 2020 06:38:16 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 307c65f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 06:38:13 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id D5A721002F93; Wed,  1 Apr 2020 08:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1585723577;
 bh=hUI/WuSGZglCF3FGTXexRQ05ujkblr9ZpYJrzE/WnPs=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=q3AbuPm/EpD9Ejf2zVdLz/h1szNm5EqQ03Q482vq+0EVLU+rCtxmP3vLTD9K5Z96G
 aJI/j37UewmSXzP8bROIXsChT3/0Gvc4wKyxHzBI6BNr3P3JLLZopTfPs3Rt/Lrf57
 NMnImbHO5GX2exqA1iIPdptt95+B+rNTDVAwVkTw=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id A51ED1002F8A;
 Wed,  1 Apr 2020 08:46:12 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Wed, 1 Apr 2020 08:46:12 +0200
From: Simon Rozman <simon@rozman.si>
To: Ludwig Herzog <ludwig.herzog@web.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
Thread-Topic: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
Thread-Index: AQHWBjscateo5Q/HNkSIjh4Tpj9zjqhgeweAgAA01oCAAyYhAA==
Date: Wed, 1 Apr 2020 06:46:11 +0000
Message-ID: <EE280F52-484A-4C40-BBF3-F23D0E19CFC9@rozman.si>
References: <20200327170750.5285-1-suyjuris.gi@nicze.de>
 <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
 <e7f67006-09a0-e775-5f7d-4d0c8e7e271a@web.de>
In-Reply-To: <e7f67006-09a0-e775-5f7d-4d0c8e7e271a@web.de>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.35.20030802
x-originating-ip: [2a00:ee2:209:164::1]
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha256; boundary="B_3668575570_434790901"
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

--B_3668575570_434790901
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi Ludwig,

Would a support for ExecPostUp/ExecPreDown satisfy your need?

Regards, Simon

=EF=BB=BF-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Ludwig Her=
zog <ludwig.herzog@web.de>
Date: Tuesday, 31 March 2020 at 05:33
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH wireguard-windows] Calculate the actual route metric by=
 summing interface and route metric.

    Hi,
   =20
    I'm reading this maillist since a longer time and was never brave enoug=
h
    to mention my problem since I'm not a developer or programmer and don't
    know if I can describe it properly. Now this windows/metric stuff came
    up, so I take a heart ;-)
   =20
    In short: I have windows 10 client softwares which only work properly
    with manually set adapter and gateway metrics in the VPN network
    adapter, what works for openVPN (even better for a logmein test setup)
    but not for wireguard, since manual metric settings are not recognized =
/
    overwritten by the windows wireguard app. Is it possible to set the
    metrics somehow in the config file? Or prevent the windows wireguard ap=
p
    from overwriting?
   =20
    Regards
   =20
    Ludwig
   =20

--B_3668575570_434790901
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

--B_3668575570_434790901--
