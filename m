Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0CFC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5DCB20868
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="orev+mmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5DCB20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fd1be9e;
	Fri, 8 Mar 2019 15:15:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b07858c
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 00:20:34 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ad4298f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 00:20:34 +0000 (UTC)
Date: Sat, 02 Mar 2019 00:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551486624;
 bh=6zFC9SDTqDoo25lHw6oiZKaNoKSpZnoTK7tTPZ2P+UM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=orev+mmWSuxO4BmmdCgPussGTfbJmOsidyDsU1vLxTRZ+sXN5d7o9yJ9cYAZYlPtd
 +eRU4W2cDddE5zl1EW+Hiq2OjLmTPmwKazaAtH9HEmrbSqVlgRvTDttfnx8hHPNsZW
 s8N23f/K6BGGSCqFpCSRG/phEwkUmMY9C0QPVNwY=
To: Kalin KOZHUHAROV <me.kalin@gmail.com>, kolargol <kolargol@protonmail.com>
From: Mark Finzel <mfinzel@protonmail.com>
Subject: Re: iOS WG Battery Life
Message-ID: <ADH75VEasjjK3HQr1kLelM9oY4U-yFZLxMqlG8FaYyToO8t4xGFSExYjnpd_uK3xQHrBy526KnpNXUAzI13IHcA8TiRrvd9pB6F4KoQ8CJE=@protonmail.com>
In-Reply-To: <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
Feedback-ID: zNP3ZoYUFe5C8Tx2hpJm0xyp94cNyJwhLtgOZ1XX4Uc7strp8MotawDYmAZVE1uWXE928OxEPUEr0iR_aKB4Uw==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:15:49 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Mark Finzel <mfinzel@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1283251852756513023=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============1283251852756513023==
Content-Type: multipart/alternative;
	boundary="b1_adcd5d35e536eef7185cc2a75621f5b0"

This is a multi-part message in MIME format.

--b1_adcd5d35e536eef7185cc2a75621f5b0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RldJVywgSSBoYXZlbuKAmXQgbm90aWNlZCBhIGRpZmZlcmVuY2UgaW4gYmF0dGVyeSBsaWZlIG9u
IGlPUy4gSeKAmW0gdXNpbmcgYW4gaVBob25lIFhTLCBpT1MgMTIuMS40LCBWUE4gaXMgYWx3YXlz
IG9uLiBTbyBtYXliZSBzb21ldGhpbmcgaW4geW91ciBzZXR1cD8KClNlbnQgZnJvbSBQcm90b25N
YWlsIE1vYmlsZQoKT24gRnJpLCBNYXIgMSwgMjAxOSBhdCAzOjA4IEFNLCBLYWxpbiBLT1pIVUhB
Uk9WIDxtZS5rYWxpbkBnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIE1hciAxLCAyMDE5IGF0
IDExOjAzIEFNIGtvbGFyZ29sIDxrb2xhcmdvbEBwcm90b25tYWlsLmNvbT4gd3JvdGU6Cj4+IEkg
YW0gdGVzdGluZyBXRyBvbiB2YXJpdXMgT1NlcyBhbmQgZGV2aWNlcyBhbmQgSSBoYXZlIG5vdGVk
IHNldmVyZSBiYXR0ZXJ5IGRyYWluIG9uIGlPUyAoMTIuMiwgaVBob25lIDgpLiBUeXBpY2FsbHkg
YmF0dGVyeSBkcm9wcyA0MCUgZHVyaW5nIG5pZ2h0LXRpbWUgKHRoYXQgaXMgNyBob3VycyBvZiBp
bmFjdGl2aXR5IG9uIHRoZSBwaG9uZSkgd2hlbiBXaXJlR3VhcmQgaXMgZW5nYWdlZC4KPj4KPiBD
b21wYXJlZCB0byBob3cgbXVjaCBkdXJpbmcgbmlnaHQgd2l0aG91dCBhY3RpdmF0ZWQgV2lyZUd1
YXJkPwo+Cj4+IElzIHRoaXMgc29tZSBraW5kIG9mIGtub3duIGlzc3VlPyBJIGRpZCBub3QgaGFk
IGNoYW5jZSB0byB0ZXN0IHByZXZpb3VzIGlPUyB2ZXJzaW9uIHdpdGhvdXQgU0lNRCBDaGFDaGEy
MCBzdXBwb3J0IHNvIGkgY2Fubm90IHRlbGwgaWYgaXQgaXMgYmVjb3VzZSBvZiB0aGUgbGFzdCB1
cGRhdGUuCj4+Cj4+IEFueXRoaW5nIGkgY2FuIGRvIHRvIHRyYWNrIGlzc3VlIGhlcmU/Cj4+Cj4g
SXMgdGhlcmUgYW55dGhpbmcgdXNpbmcgdGhlIGludGVyZmFjZSwgb3IganVzdCB3ZyBrZWVwLWFs
aXZlPwo+IE1heSBiZSB0cnkgdG8gY2hhbmdlIHRoZSBrZWVwLWFsaXZlIHRvIGEgbG9uZ2VyIHBl
cmlvZC4KPiBBbHNvIChhbmQgSSBoYXZlIDAgZXhwZXJpZW5jZSB3aXRoIGlPUyksIGEga2VlcC1h
bGl2ZSBwYWNrZXQgbXkgd2FrZQo+IHVwIHRoZSBwaG9uZSwgYW5kIGxldCBpdCBzdGF5IGF3YWtl
IGZvciBzb21lIGxvbmdlci10aGFuLW5lZWRlZAo+IGludGVydmFsIChlLmcuIDUgbWludXRlcyku
Cj4gVHJ5IHRvIGhhdmUgYSBsb29rIGF0IHdoYXQgYWN0dWFsbHkgZWF0cyB0aGUgYmF0dGVyeTog
Q1BVLCByYWRpbywgc2NyZWVuPwo+Cj4gQ2hlZXJzLAo+IEthbGluLgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gV2lyZUd1YXJkIG1haWxpbmcgbGlz
dAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZA==


--b1_adcd5d35e536eef7185cc2a75621f5b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

ICAgPGRpdj5GV0lXLCBJIGhhdmVu4oCZdCBub3RpY2VkIGEgZGlmZmVyZW5jZSBpbiBiYXR0ZXJ5
IGxpZmUgb24gaU9TLiBJ4oCZbSB1c2luZyBhbiBpUGhvbmUgWFMsIGlPUyAxMi4xLjQsIFZQTiBp
cyBhbHdheXMgb24uIFNvIG1heWJlIHNvbWV0aGluZyBpbiB5b3VyIHNldHVwPzwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXYgaWQ9InByb3Rvbm1haWxfbW9iaWxlX3NpZ25hdHVyZV9ibG9jayI+U2Vu
dCBmcm9tIFByb3Rvbk1haWwgTW9iaWxlPC9kaXY+IDxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwv
ZGl2Pk9uIEZyaSwgTWFyIDEsIDIwMTkgYXQgMzowOCBBTSwgS2FsaW4gS09aSFVIQVJPViAmbHQ7
PGEgaHJlZj0ibWFpbHRvOm1lLmthbGluQGdtYWlsLmNvbSIgY2xhc3M9IiI+bWUua2FsaW5AZ21h
aWwuY29tPC9hPiZndDsgd3JvdGU6PGJsb2NrcXVvdGUgY2xhc3M9InByb3Rvbm1haWxfcXVvdGUi
IHR5cGU9ImNpdGUiPiAgT24gRnJpLCBNYXIgMSwgMjAxOSBhdCAxMTowMyBBTSBrb2xhcmdvbCAm
bHQ7a29sYXJnb2xAcHJvdG9ubWFpbC5jb20mZ3Q7IHdyb3RlOjxicj4mZ3Q7IEkgYW0gdGVzdGlu
ZyBXRyBvbiB2YXJpdXMgT1NlcyBhbmQgZGV2aWNlcyBhbmQgSSBoYXZlIG5vdGVkIHNldmVyZSBi
YXR0ZXJ5IGRyYWluIG9uIGlPUyAoMTIuMiwgaVBob25lIDgpLiBUeXBpY2FsbHkgYmF0dGVyeSBk
cm9wcyA0MCUgZHVyaW5nIG5pZ2h0LXRpbWUgKHRoYXQgaXMgNyBob3VycyBvZiBpbmFjdGl2aXR5
IG9uIHRoZSBwaG9uZSkgd2hlbiBXaXJlR3VhcmQgaXMgZW5nYWdlZC48YnI+Jmd0Ozxicj5Db21w
YXJlZCB0byBob3cgbXVjaCBkdXJpbmcgbmlnaHQgd2l0aG91dCBhY3RpdmF0ZWQgV2lyZUd1YXJk
Pzxicj48YnI+Jmd0OyBJcyB0aGlzIHNvbWUga2luZCBvZiBrbm93biBpc3N1ZT8gSSBkaWQgbm90
IGhhZCBjaGFuY2UgdG8gdGVzdCBwcmV2aW91cyBpT1MgdmVyc2lvbiB3aXRob3V0IFNJTUQgQ2hh
Q2hhMjAgc3VwcG9ydCBzbyBpIGNhbm5vdCB0ZWxsIGlmIGl0IGlzIGJlY291c2Ugb2YgdGhlIGxh
c3QgdXBkYXRlLjxicj4mZ3Q7PGJyPiZndDsgQW55dGhpbmcgaSBjYW4gZG8gdG8gdHJhY2sgaXNz
dWUgaGVyZT88YnI+Jmd0Ozxicj5JcyB0aGVyZSBhbnl0aGluZyB1c2luZyB0aGUgaW50ZXJmYWNl
LCBvciBqdXN0IHdnIGtlZXAtYWxpdmU/PGJyPk1heSBiZSB0cnkgdG8gY2hhbmdlIHRoZSBrZWVw
LWFsaXZlIHRvIGEgbG9uZ2VyIHBlcmlvZC48YnI+QWxzbyAoYW5kIEkgaGF2ZSAwIGV4cGVyaWVu
Y2Ugd2l0aCBpT1MpLCBhIGtlZXAtYWxpdmUgcGFja2V0IG15IHdha2U8YnI+dXAgdGhlIHBob25l
LCBhbmQgbGV0IGl0IHN0YXkgYXdha2UgZm9yIHNvbWUgbG9uZ2VyLXRoYW4tbmVlZGVkPGJyPmlu
dGVydmFsIChlLmcuIDUgbWludXRlcykuPGJyPlRyeSB0byBoYXZlIGEgbG9vayBhdCB3aGF0IGFj
dHVhbGx5IGVhdHMgdGhlIGJhdHRlcnk6IENQVSwgcmFkaW8sIHNjcmVlbj88YnI+PGJyPkNoZWVy
cyw8YnI+S2FsaW4uPGJyPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyPldpcmVHdWFyZCBtYWlsaW5nIGxpc3Q8YnI+V2lyZUd1YXJkQGxpc3RzLnp4MmM0
LmNvbTxicj5odHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFy
ZDxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+



--b1_adcd5d35e536eef7185cc2a75621f5b0--


--===============1283251852756513023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1283251852756513023==--

