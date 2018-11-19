Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C5CC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 09:58:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB4620817
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 09:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB4620817
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t0x0sh.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 387bc26e;
	Mon, 19 Nov 2018 09:52:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76c59709
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 09:51:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66dc05bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 09:51:58 +0000 (UTC)
X-Originating-IP: 46.193.66.13
Received: from [10.188.77.148] (eth-east-parth2-46-193-66-13.wb.wifirst.net
 [46.193.66.13]) (Authenticated sender: tosh@t0x0sh.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 09FE6FF812
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 09:57:54 +0000 (UTC)
Subject: Problem to load wireguard LKM in Archlinux
To: wireguard@lists.zx2c4.com
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
From: Tosh <tosh@t0x0sh.org>
Openpgp: preference=signencrypt
Autocrypt: addr=tosh@t0x0sh.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <41797799-8633-d195-54cb-ca3f38fbd371@t0x0sh.org>
Date: Mon, 19 Nov 2018 10:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7139023293508744726=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7139023293508744726==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wkkGzcmK27OV5rzT24uD82Cv7La7fUog3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wkkGzcmK27OV5rzT24uD82Cv7La7fUog3
Content-Type: multipart/mixed; boundary="tVvrc19RsajXNNJaFyNnBywPIpCjeN0Gv";
 protected-headers="v1"
From: Tosh <tosh@t0x0sh.org>
To: wireguard@lists.zx2c4.com
Message-ID: <41797799-8633-d195-54cb-ca3f38fbd371@t0x0sh.org>
Subject: Problem to load wireguard LKM in Archlinux
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
In-Reply-To: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>

--tVvrc19RsajXNNJaFyNnBywPIpCjeN0Gv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US

SGVsbG8sCgpJJ20gdXNpbmcgV2lyZWd1YXJkIG9uIEFyY2hMaW51eCBzaW5jZSBhIGxvbmcg
dGltZSwgYW5kIHRvZGF5IEkgaGF2ZQpzb21lIHRyb3VibGVzIHRvIHN0YXJ0IG15IFZQTi4g
SGVyZSBpcyB0aGUgbG9nIG9mIGRtZWcgd2hlbiBJIHRyeSB0bwonbW9kcHJvYmUgd2lyZWd1
YXJkJyA6Cgp3aXJlZ3VhcmQ6IFVua25vd24gc3ltYm9sIHBvbHkxMzA1X2Jsb2Nrc19hdngg
KGVycgotMinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKd2lyZWd1YXJkOiBVbmtub3duIHN5bWJvbCBw
b2x5MTMwNV9lbWl0X2F2eCAoZXJyCi0yKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKd2lyZWd1
YXJkOiBVbmtub3duIHN5bWJvbCBwb2x5MTMwNV9ibG9ja3NfYXZ4NTEyIChlcnIKLTIpwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgCndpcmVndWFyZDogVW5rbm93biBzeW1ib2wgY2hhY2hhMjBfYXZ4NTEydmwg
KGVycgotMinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCndpcmVndWFyZDogVW5rbm93biBzeW1i
b2wgY2hhY2hhMjBfYXZ4MiAoZXJyIC0yKQp3aXJlZ3VhcmQ6IFVua25vd24gc3ltYm9sIHBv
bHkxMzA1X2Jsb2Nrc19hdngyIChlcnIKLTIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAp3aXJlZ3VhcmQ6
IFVua25vd24gc3ltYm9sIGNoYWNoYTIwX2F2eDUxMiAoZXJyIC0yKQoKSSBkaWQgYSBNQUog
b2YgbXkgc3lzdGVtIHllc3RlcmRheSwgYnV0IHdpcmVndWFyZCB3YXNuJ3QgdXBncmFkZWQs
IHNvIEkKZG9uJ3Qga25vdyB3aGVyZSB0aGUgcHJvYmxlbSBjb21lIGZyb20uLi5TZWVtcyBh
IExLTSByZWxhdGVkIHRvIGNyeXB0bwppcyBtaXNzaW5nLCBidXQgSSBkb24ndCBrbm93IHdo
aWNoIG9uZSBpcy4KCk15IGtlcm5lbCBpcyA0LjE5LjItYXJjaDEtMS1BUkNILCBhbmQgbXkg
d2lyZWd1YXJkIHBhY2thZ2VzIGFyZSA6CgotIGNvbW11bml0eS93aXJlZ3VhcmQtZGttcyAw
LjAuMjAxODExMTUtMQoKLSBjb21tdW5pdHkvd2lyZWd1YXJkLXRvb2xzIDAuMC4yMDE4MTEx
NS0xCgpUaGFua3MgZm9yIHlvdXIgd29yaywKCi0tIAotVE9TSC0KCklmIHlvdSBuZWVkIHBy
aXZhY3kgeW91IGNhbiBlbmNyeXB0IHlvdXIgbWFpbHMgd2l0aCBteSBHUEcga2V5Ogo5Qjc5
IDc3NTQgMDBFMiAyM0M3IEZDOTAgIEU1QzYgRTVEOSAxQjJGIDBCRDUgM0M2QQoK

--tVvrc19RsajXNNJaFyNnBywPIpCjeN0Gv--

--wkkGzcmK27OV5rzT24uD82Cv7La7fUog3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEm3l3VADiI8f8kOXG5dkbLwvVPGoFAlvyiSIACgkQ5dkbLwvV
PGoiqA/8D+E299CrMKzPztUTQnlAMIg7y7Qh3QCtMQiSO1yilLmXQRidIm7095EB
OymVFkzCz3bldNo2gz7es09X5Jh7TZfql4bwUEUSTJFXOygJRXedjuKmv/ukGK9F
Fi7FuWy5SKMnJWYMN+MWdKjzTIqFkj4faU1E3jLorwup1Md/pBfHQFM1a/k1WhZ4
/H1sZg+qVENF6Pxrhx72CeATaraiSPy7ELBgmmnT9Q0Np5MZ/fim8UlRBalgPh3j
gGIxZ6m7py5+uuuAZ82/1eXhtz3w+0TughH4/aXGnH7sMRrfkX1C1WxjtRypecaa
mnYXkGbP8qECx17iO0oTN1t7pz3IhhSrNkBsbDeEhUDEGA33eMPBne7OfVHRGSoF
HIYp8OFpGqpdy51uqcJ0E381dDWS4doCi1kXQVceUZzpdCY1/jc9OQIWrqRCy5Qc
a2k16mFB08TX+33T+n/vtG4subigfC3E9gEwqgfYpF3i/T7cxlwz/oQEtNUJXMCp
vT6b4q16TXv9v6su4nMw+ehevCGRWJsLijYI23DdIqL1JUQCteax1Y1vqaWZlIAt
AfhleTk1TJJsn1ksCauXrFv8tdm+uxUb7ttt5beKnXd/5SyrBnhYY7D6FNbUZFgs
ecdHmxr0+a1iLUtZjNctPFnFgspm4ttg4+ISKNJ4IG8fNYuPJXA=
=r2mQ
-----END PGP SIGNATURE-----

--wkkGzcmK27OV5rzT24uD82Cv7La7fUog3--

--===============7139023293508744726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7139023293508744726==--
