Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E4C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:13:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35EC20672
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="cP8IKcFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C35EC20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 429f6ef6;
	Mon, 6 Apr 2020 06:04:17 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf71c3f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:04:14 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 7675A1002F24; Mon,  6 Apr 2020 08:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1586153577;
 bh=HFZ5JqlUPVbEXCcj7dsnSYKOgG+saC3wlV78sqikJck=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=cP8IKcFl6IkJD+FwjZC7M6MCFIIheSEFzTC66TQnTOtAt4IDx+VNcpjG4uQyNGbNB
 6kPLnJio+jrA2FCKzChj/+cMhgg2n0l4Z0zGmWEJtJ/GVPJaWIBlg5xM+LlOvUAFdf
 5sV8z6+w5iKoM6bLqzXLolp6cparQQHydDIe+tT8=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 03FA01002F23;
 Mon,  6 Apr 2020 08:12:55 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Mon, 6 Apr 2020 08:12:54 +0200
From: Simon Rozman <simon@rozman.si>
To: Duncan X Simpson <virtualdxs@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: Search Domain/DNS Suffix
Thread-Topic: Search Domain/DNS Suffix
Thread-Index: AQHWC5RQRgUVeyxVtk2fIBLMFF43CqhrnagA
Date: Mon, 6 Apr 2020 06:12:54 +0000
Message-ID: <474EFC8E-BD8D-40B2-A0A9-3A9346A2A8AB@rozman.si>
References: <CAB8Qo2SaN0rkBHKqb-PSH0Sh5WbC5jbkMA8mpdq+-L6art2s+w@mail.gmail.com>
In-Reply-To: <CAB8Qo2SaN0rkBHKqb-PSH0Sh5WbC5jbkMA8mpdq+-L6art2s+w@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.35.20030802
x-originating-ip: [2a00:ee2:209:164::1]
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha256; boundary="B_3669005574_645249782"
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

--B_3669005574_645249782
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi,

I have a similar requirement - to set connection specific DNS suffix. I sol=
ved it by extending the wireguard-windows: https://git.zx2c4.com/wireguard-w=
indows/commit/?h=3Dsr/mydist&id=3D3672fbc0bcb1821c98566fac32ba0638d4d4c611

However, I do not plan to ask zx2c4 to merge it upstream, as he has better =
idea to provide PostUpExec feature which would allow universal mean for any =
extra system configuration required. Stay tuned.

Meanwhile, just a suggestion (haven't tested it thou)... Add a task to Task=
 Scheduler to fire every couple of minutes doing:

reg.exe add HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfa=
ces\<GUID of your WG adapter*> /v Domain /t REG_SZ /d contoso.local

This should setup the connection specific DNS suffix soon after the tunnel =
is established and keep it set. But its nuts and doesn't scale. The PostUpEx=
ec will be the right approach.

Regards, Simon

* On Windows 10 the WG adapter GUID is pseudo-random based on your WG confi=
g. As long as your config is static, it won't change. Once WG connected, loo=
k it up in HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interface=
s.

=EF=BB=BF-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Duncan X S=
impson <virtualdxs@gmail.com>
Date: Sunday, 5 April 2020 at 23:51
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Search Domain/DNS Suffix

    Hello all,
   =20
    I'm trying to deploy a wireguard VPN for a small company and it's
    working great, with one issue: On Windows/Mac I can't find a way to
    set search domains on the connection. Windows, I can probably just set
    a system-wide search domain via the registry (I plan to test that
    tonight), but on Mac I can't figure out anything. Even the normal
    command line method, networksetup -setsearchdomains [interface],
    doesn't take effect - I can retrieve whatever I set with networksetup
    -getsearchdomains [interface], but it's not used by the system.
   =20
    Does anybody know a solution or workaround?
   =20
    Duncan X Simpson, K7DXS
    Removal of this tagline is a violation of Federal Law.
   =20

--B_3669005574_645249782
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

--B_3669005574_645249782--
