Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B720C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 13:39:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A4E46044F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 13:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A4E46044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3e9ca96;
	Sat, 10 Apr 2021 13:39:18 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [2a01:260:4101:1464::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 844a6ffd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 13:39:16 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id A1A0D18E8786; Sat, 10 Apr 2021 15:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1618061955;
 bh=MhH9z1gL+30YviSs6xlO6IJUsDclljS5RGy2v+wOBLE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=c9cI+65Sg9oUc12dfe/Dl5syy8ldzwJ2oSfRA0Hg+eeN+Gv9uNQhL5CuYGoB+sQGp
 33Vmmy0iwcU0lSlCbsx+CApXpriMGKq2VgOZP+2J5fYqnrpD2aTSFwetS8OTtlyGQy
 Wzofpa5/8gDxEO6bZQssqX4aLTzF4hJoy+lFq820=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 2C92118E8786;
 Sat, 10 Apr 2021 15:39:11 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Sat, 10 Apr 2021
 15:38:59 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0792.010;
 Sat, 10 Apr 2021 15:38:58 +0200
From: Simon Rozman <simon@rozman.si>
To: David Woodhouse <dwmw2@infradead.org>, Daniel Lenski <dlenski@gmail.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Allowing space for packet headers in Wintun Tx/Rx
Thread-Topic: Allowing space for packet headers in Wintun Tx/Rx
Thread-Index: AQHXK6U1nzJARpm0fUegHsStd/bwDaqqs4hggAArpSmAAubqsA==
Date: Sat, 10 Apr 2021 13:38:58 +0000
Message-ID: <a1bee48639cb40299118c53d4fa8fe7a@rozman.si>
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
In-Reply-To: <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:dc9d:cfdd:b8a:c905]
Content-Type: multipart/signed; micalg=SHA1;
 protocol="application/x-pkcs7-signature";
 boundary="----=_NextPart_000_0008_01D72E1F.9B97A6F0"
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

------=_NextPart_000_0008_01D72E1F.9B97A6F0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi David,This is my =
proposal:https://git.zx2c4.com/wintun/commit/?id=3Deebd6aea4f75551f6e847a=
1d4fff857450bac6e9Awaiting review and zx2c4 approval. =
=F0=9F=98=8ARegards, Simon

------=_NextPart_000_0008_01D72E1F.9B97A6F0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
QjhhVawBAvwTsOXOx9MRzyt85mnlMMN4Vdqk2vJd2C+uADBknlFXv5CM2CmtAbOXH4OeS0qICTqq
Ww8uh6T+DVl4eommyY8CAwEAAaOCAjcwggIzMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/
BAQDAgEGMDoGA1UdIAQzMDEwLwYEVR0gADAnMCUGCCsGAQUFBwIBFhlodHRwOi8vd3d3LmNhLmdv
di5zaS9jcHMvMGkGCCsGAQUFBwEBBF0wWzA2BggrBgEFBQcwAoYqaHR0cDovL3d3dy5jYS5nb3Yu
c2kvY3J0L3NpLXRydXN0LXJvb3QuY3J0MCEGCCsGAQUFBzABhhVodHRwOi8vb2NzcC5jYS5nb3Yu
c2kwEQYDVR0OBAoECEwlJ4yoLXKeMIIBPAYDVR0fBIIBMzCCAS8wgbeggbSggbGGKmh0dHA6Ly93
d3cuY2EuZ292LnNpL2NybC9zaS10cnVzdC1yb290LmNybIaBgmxkYXA6Ly94NTAwLmdvdi5zaS9j
bj1TSS1UUlVTVCUyMFJvb3Qsb3JnYW5pemF0aW9uSWRlbnRpZmllcj1WQVRTSS0xNzY1OTk1Nyxv
PVJlcHVibGlrYSUyMFNsb3ZlbmlqYSxjPVNJP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Qwc6Bx
oG+kbTBrMQswCQYDVQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UE
YRMOVkFUU0ktMTc2NTk5NTcxFjAUBgNVBAMTDVNJLVRSVVNUIFJvb3QxDTALBgNVBAMTBENSTDEw
EwYDVR0jBAwwCoAITKPDaF4IAmMwDQYJKoZIhvcNAQELBQADggGBADVgVyRt64166Ry1oNxqii/z
IzrKEr24IPkI7vJmczGJ/lRm6vIaZBdxeuebD1KICR8YQznI0xRiQZ/cz2oINJdVqCqXlOddRZvu
fWIcZXpmDPlig86+gueYtJIRLq+gk4Fjz8tdPo6GhYN7b9wQ15FYDIjgPzEDnq/YQJ+ZJs9aPots
kKHvKyaDg8NibS7qdiLXaTooWFCaSV4h+JPtStbw+R7MaLnHvyp8sqhl4vgnPNv3TLwPmWr1jU+E
P1gx5axEkKpJamc1zMgTWw/FS4VzrxSKsDZM/7E6cCZHCWziPWs8C3uLqye2tBBBCgjmyNY5XC8r
j85Rbpl5K1SIlg9jetEfUNoaWXP0S/GgAtgB5EQ9IXwSjf9D/DxqvOme5bhK7o2l3r/1/OvPmoYt
tgQhBmpIYQfzacB94yTHDCJZrWqFc+DW4BOg/dyLLsykcNEnYWClibUWiU/ITlW/AcKkuovMQVMA
HYu4u5LveEWEymkbaTxRmHx3/swn3eZi2jCCBu4wggVWoAMCAQICDBQ5pLoAAAAAVyWXczANBgkq
hkiG9w0BAQsFADBaMQswCQYDVQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEX
MBUGA1UEYRMOVkFUU0ktMTc2NTk5NTcxFDASBgNVBAMTC1NJR0VOLUNBIEcyMB4XDTIxMDExNjEw
MjAyOVoXDTI2MDExNjEwNTAyOVowgYExCzAJBgNVBAYTAlNJMRIwEAYDVQQIEwlTbG92ZW5pamEx
FDASBgNVBAsTC2luZGl2aWR1YWxzMUgwDAYDVQQqEwVTaW1vbjANBgNVBAQTBlJvem1hbjATBgNV
BAMTDFNpbW9uIFJvem1hbjAUBgNVBAUTDTIzNDU2Nzk1MTIwNTAwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQC4dxF31j96pv2U8wDV364mEdeecBnnl2kK5/F2tMiESHlL7uzu6mjc4jWl
kfHHCRTBuBocuBghM5+4nmPCQDW9LpHSUnfTqVL8JFvFawMuwJnZpAkAwc+guL1ExS/xoEMEjREI
RbDVgDE10EgFyCRWMOa8ZN0DUtPjeF6hNUzBLh5TTRg78kD4IMoqn1QOCnqGPcdPTqXQNjk9V4+f
Ms6xU30gQ3kohYKnyG9e/5toM2u6edEm6O5VWCez4wRQbWcAM/2gf1m4VOCTMZLEJnSatswOh/gn
2tz1zdh1swE8Q373N2s5u4u9veqIH0kIUmIdlKM3ksCBHeypNgsz1NTLAgMBAAGjggMKMIIDBjAO
BgNVHQ8BAf8EBAMCBeAwTAYDVR0gBEUwQzA2BgsrBgEEAa9ZAgIDBTAnMCUGCCsGAQUFBwIBFhlo
dHRwOi8vd3d3LmNhLmdvdi5zaS9jcHMvMAkGBwQAi+xAAQAwgaUGCCsGAQUFBwEDBIGYMIGVMAgG
BgQAjkYBATB0BgYEAI5GAQUwajAzFi1odHRwczovL3d3dy5jYS5nb3Yuc2kvY3BzL3NpZ2VuY2Ey
X3Bkc19lbi5wZGYTAmVuMDMWLWh0dHBzOi8vd3d3LmNhLmdvdi5zaS9jcHMvc2lnZW5jYTJfcGRz
X3NsLnBkZhMCc2wwEwYGBACORgEGMAkGBwQAjkYBBgEwcQYIKwYBBQUHAQEEZTBjMDwGCCsGAQUF
BzAChjBodHRwOi8vd3d3LnNpZ2VuLWNhLnNpL2NydC9zaWdlbi1jYS1nMi1jZXJ0cy5wN2MwIwYI
KwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNpZ2VuLWNhLnNpMBoGA1UdEQQTMBGBD3NpbW9uQHJvem1h
bi5zaTCCAToGA1UdHwSCATEwggEtMIG1oIGyoIGvhipodHRwOi8vd3d3LnNpZ2VuLWNhLnNpL2Ny
bC9zaWdlbi1jYS1nMi5jcmyGgYBsZGFwOi8veDUwMC5nb3Yuc2kvY249U0lHRU4tQ0ElMjBHMixv
cmdhbml6YXRpb25JZGVudGlmaWVyPVZBVFNJLTE3NjU5OTU3LG89UmVwdWJsaWthJTIwU2xvdmVu
aWphLGM9U0k/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdDBzoHGgb6RtMGsxCzAJBgNVBAYTAlNJ
MRwwGgYDVQQKExNSZXB1Ymxpa2EgU2xvdmVuaWphMRcwFQYDVQRhEw5WQVRTSS0xNzY1OTk1NzEU
MBIGA1UEAxMLU0lHRU4tQ0EgRzIxDzANBgNVBAMTBkNSTDM2MTATBgNVHSMEDDAKgAhMJSeMqC1y
njARBgNVHQ4ECgQIQ4hOet068oQwCQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAYEAxZ551xN1
ApP9lQzrU9Zex3bp8j6JqsPtE/HPyJd14gMhoxsqU/kvCdgRmu4vP9RANYNg6bpC5sY+nbQu6zgp
p4Iq5yxJnfoPx1bvcx/5BHjD7kU9PIyFDrCWCjTYtNErhRFa2+u9G/SE4KrNGoShNNv7nouboq1Q
qsryOYjUZN++xP40R416AWbnOo8AdOSZlerxKWOm4KbC01o3rcNsV2P4fxSFfsb4SsHmNENeQpy3
9p/08W3emjYb4tznk7T0sU01MWfKSXPdtUwSA4L44AqFHUX28NZrE3yFETeDQV8KUTFeIOOHTUJQ
08lg9p1lGUtAcb/CiKJTNligy6EQeH6CY+ELpb1lAIsNWcL91d1ohbYBytZthAaeVbh5+aE8Zmc0
n6VfQrO7XiBnuKXdnVba5GfhVdhUI1TcJ27E9JRaxKvqUSDZ3ebYE2HV2RLAz5RZLO9sJdTR7TjD
ne6NvfCQOST3+QDLraisYM0knO9HYKOYrGau6R0yL2X7Ha4pMYIDgDCCA3wCAQEwajBaMQswCQYD
VQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UEYRMOVkFUU0ktMTc2
NTk5NTcxFDASBgNVBAMTC1NJR0VOLUNBIEcyAgwUOaS6AAAAAFcll3MwCQYFKw4DAhoFAKCCAesw
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwNDEwMTMzODUxWjAj
BgkqhkiG9w0BCQQxFgQUmlHHmefNGiRCYa/MBDtv+BOFRgcweQYJKwYBBAGCNxAEMWwwajBaMQsw
CQYDVQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UEYRMOVkFUU0kt
MTc2NTk5NTcxFDASBgNVBAMTC1NJR0VOLUNBIEcyAgwUOaS6AAAAAFcll3MwewYLKoZIhvcNAQkQ
AgsxbKBqMFoxCzAJBgNVBAYTAlNJMRwwGgYDVQQKExNSZXB1Ymxpa2EgU2xvdmVuaWphMRcwFQYD
VQRhEw5WQVRTSS0xNzY1OTk1NzEUMBIGA1UEAxMLU0lHRU4tQ0EgRzICDBQ5pLoAAAAAVyWXczCB
kwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcw
CwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglg
hkgBZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQC4BZzE
YK3IlS57afv9GEiONutvaiyIukVTYxDRhz2n/JMEUGup9bDR0XoIW3BlR3VbDo2emb99yB7my1l0
bb9rfsE1tgkmSsxY9x31muXq1zAJB52bCkiOIcBvkZYDQPPCbpRyoY+W/DMo0WEH96fAl4v8lXsZ
D8XszusNVc697wg3XmYAkVMBFnu1XnyNFHyzrg8aiW7tp6Gn5Km9QakOfKzy9c0H4H07teQARxKS
AygGTr8R77CtySN8jGFB/Ln1MjdyYG7HY/OZyYgzjSe2tbSxs9x21hxnHggDgCA6HvpNgJedhFgs
ibfPLURw1z3f+dahxG48zj/KkLCyQ+c+AAAAAAAA

------=_NextPart_000_0008_01D72E1F.9B97A6F0--
