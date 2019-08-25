Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D48C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70B9206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="Td7ikWc7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70B9206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b0bb007;
	Sun, 25 Aug 2019 19:23:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90b9f2f9
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:52:06 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77cf51a2
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:52:05 +0000 (UTC)
Received: from Alex (unknown [192.168.177.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id 0AEAE2805B9;
 Sun, 25 Aug 2019 20:52:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1566759125;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=MMYnganXkLKkW5JEmr+SSLAkgQG0JVG5qL7cr7hw688=;
 b=Td7ikWc7BmI+nbDmWNF3tuybgK8obfnMRlE9nc7GDkSG9xKyrIwcp7ARI9Hu7VAzAPM+bV
 tofjmegYbBx3ZQUQSXc0+XEtnuCnM2UGcrWKD2aaBJxxAZv4anjl8i8IKlccXj6b42xejr
 NopL2Hl7r8rshnAtodxWHVYJ5hrKWlBiKnya8VJQXJCOzd1FDupfKOi+h+XEBsHbiEObh4
 nOYoT88c3gvbGjb0LWlsnNqN6jEC1psvK31uNRA7v9emgit2bAIRh74dfHpYl1n9/wua+X
 HqcA+MND65iI2+37c4moHc5iuIJ07DRoornNf0utb5OGoNqFrJN6QsIOottPJA==
From: <news@lindenberg.one>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
 <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
 <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
 <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
In-Reply-To: <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
Subject: AW: Hyper-V 2019: unable to create wintun device: no interfaces found
Date: Sun, 25 Aug 2019 20:52:04 +0200
Message-ID: <015d01d55b76$30373290$90a597b0$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-de
Thread-Index: AQGl1jjZadwHrDiDTTS7Xq7i75kXDAJFFK7HAfYLZGwBulWLb6c7kfDw
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1566759125;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=MMYnganXkLKkW5JEmr+SSLAkgQG0JVG5qL7cr7hw688=;
 b=o5dWVZ5tci/TXeXnxfZZkSIWJErmcsEK2akWaGh9N0272E2ZdRMEe0WLupXZWF/0ksLfez
 /kxn7GW1PsgsZ933pzdiCKDwfKjt2cmzaZOPnPHfk933PzR+GofAoujm2p7WEYshhH/APc
 kPXVIkRCd56RC2kKGVI8g2MkLX3jfTf+qWfcG01pm1GAN3HAcETifcWmp1VGrA0nYExBL0
 bi74iFJi2JJDkFsw18IQEuN2E+yQqO1+msCeSNpoAGAJqtmFE3aT5mM8ca2WL+24Sms2ld
 CIyYmjGbfMLSs+ecvr4Z7/ICLIznOvinpQ3bemaFierRHBq2h0r++ZAw6g623Q==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1566759125; a=rsa-sha256;
 cv=none;
 b=s55eI+NOw9/ku+K/mITKWTCNgEJvf2XpuKsmmjn5dvSKNIg5HdJppxWZYQpZP/1IbB9ey87q/lxRAS50HIk43/cqGqdaSqMUusJMwuYeIh5kwAWZwDiE3hLvyjbG6bd2AY7nvHQeheBdOHLY3FlIhSFtx5k9hPRYJlDa7DvJW3pTjMfLQ+FzzDgBDWYxGJKvLLK2B6xqCg29NuGou+rVEBU9daId0i1ohvNc/hlSzUFuH4/Px/kM9PgnPBNHqdWaNztqR3C1cpDXyuFKtoOhzRRWUvuUKSk7eOj9wiatRVlrd/J2kSGAbrzX/Eqc5mV+BLYXqGw69WukfdnPPnKZGw==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:23:11 +0200
Cc: 'WireGuard mailing list' <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGkgSmFzb24sCm5vdCB0aGUgcG9ydC4gTXkgZXh0ZXJuYWwgSVAgaXMgZHluYW1pYy4gVGhpcyBp
cyByZWFsbHkgc3RhbmRhcmQgZm9yIGludGVybmV0IHNlcnZpY2VzIGluIEdlcm1hbnkgb2ZmZXJl
ZCB0byBub24tYnVzaW5lc3MgdXNlcnMsIG9yIGFsc28gYnVzaW5lc3MgdGhhdCBwcmVmZXIgbm90
IHRoZSBwYXkgZXh0cmEgY2hhcmdlcyBmb3IgdGhlIGFzc2lnbm1lbnQgb2YgYSBzdGF0aWMgaXAg
YWRkcmVzcy4gTXkgSVAgYWRkcmVzcyBjaGFuZ2VzIGF0IGxlYXN0IG9uY2UgYSBkYXkgKHVzdWFs
bHkgYmV0d2VlbiAxIGFtIGFuZCAyIGFtKS4gVXN1YWxseSBvbmUgdXNlcyBhIGR5bmRucyBwcm92
aWRlciwgYW5kIG1hbnkgcm91dGVycyBzdXBwb3J0IHVwZGF0aW5nIHRoZSBpcCBhZGRyZXNzIGF1
dG9tYXRpY2FsbHkuIEFzIEkgYW0gcnVubmluZyBteSBleHRlcm5hbCBETlMgd2l0aCBjbG91ZGZs
YXIsIEkgYW0gY2FsbGluZyB0aGVpciBBUEkgdG8gdXBkYXRlIG15IGV4dGVybmFsIGFkZHJlc3Mu
Ck5vdyBhZmFpayBXaXJlZ3VhcmQgcmVzb2x2ZXMgdGhlIGRvbWFpbiBuYW1lIG9mIHRoZSBzZXJ2
ZXIganVzdCBvbmNlIHRvIGFuIElQIGFkZHJlc3MgYW5kIG5vdCByZWd1bGFybHkgb3Igd2hlbmV2
ZXIgdGhlIGNvbm5lY3Rpb24gYnJlYWtzIGRvd24gb3IgaGFzIGJlZW4gaWRsZSBmb3Igc29tZSB0
aW1lLgpQZXJzaXN0ZW50S2VlcEFsaXZlIGNhbm5vdCBhZGRyZXNzIHRoZSBpc3N1ZSwgYXMgdGhl
IGNsaWVudCBpcyBhbHNvIG5vdCBhd2FrZSBhbGwgdGhlIHRpbWUgaW4gb3JkZXIgdG8gc2F2ZSBl
bmVyZ3kuIExvb2tpbmcgYXQgd2cgLz8gb24gd2luZG93cyBJIGFsc28gZG9uwrR0IHNlZSBhbnkg
b3B0aW9uIHRoYXQgc2VlbXMgYXBwbGljYWJsZS4uClRoYW5rcywgSm9hY2hpbQoKLS0tLS1VcnNw
csO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQpWb246IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25A
engyYzQuY29tPiAKR2VzZW5kZXQ6IFN1bmRheSwgMjUgQXVndXN0IDIwMTkgMjA6MzYKQW46IEpv
YWNoaW0gTGluZGVuYmVyZyA8d2lyZWd1YXJkQGxpbmRlbmJlcmcub25lPgpDYzogU2ltb24gUm96
bWFuIDxzaW1vbkByb3ptYW4uc2k+OyBXaXJlR3VhcmQgbWFpbGluZyBsaXN0IDx3aXJlZ3VhcmRA
bGlzdHMuengyYzQuY29tPgpCZXRyZWZmOiBSZTogSHlwZXItViAyMDE5OiB1bmFibGUgdG8gY3Jl
YXRlIHdpbnR1biBkZXZpY2U6IG5vIGludGVyZmFjZXMgZm91bmQKCk9uIFN1biwgQXVnIDI1LCAy
MDE5IGF0IDExOjIzIEFNIEpvYWNoaW0gTGluZGVuYmVyZyA8d2lyZWd1YXJkQGxpbmRlbmJlcmcu
b25lPiB3cm90ZToKPiBteSBleHBlcmltZW50cyB3ZXJlIGFjdHVhbGx5IHJvdWdobHkgdGhyZWUg
d2Vla3MgYWdvIHdpdGggdmVyc2lvbnMgLjE4IGFuZCAuMTksIGFuZCB0aGF0IG1haWwgd2FzIHNv
bWVob3cgc3R1Y2suLgo+IEp1c3QgcmV0cmllZCB3aXRoIC4yMiwgYW5kIHRoZSBnb29kIG5ld3Mg
aXMgdGhhdCBJIHdhcyBhYmxlIHRvIHNldCB1cCBhIHR1bm5lbCBiZXR3ZWVuIGEgSHlwZXItViBh
cyBhIHNlcnZlciBhbmQgYSB3aW5kb3dzIGNsaWVudC4gVGhlIG9sZCBlcnJvciBvbiB3aW50dW4g
aXMgZ29uZS4KCkdvb2QgdG8gaGVhci4KCj4gdHJpY2sgd2lyZWd1YXJkIHRvIHdvcmsgYXJvdW5k
IHRoZSBkeW5hbWljIElQIGlzc3VlIG1vc3QgR2VybWFucyBmYWNlLiBXaXRoIHRoZSBVYnVudHUg
dm1zIEkgY2FuIHBpbmcgdGhlIHNlcnZlciBmcm9tIHRoZSBjbGllbnQsIGFuZCBpZiBpdCBpcyB1
bnJlYWNoYWJsZSBJIGFtIHB1bGxpbmcgZG93biB0aGUgaW50ZXJmYWNlIGFuZCB0aGVuIHVwIGFn
YWluLgoKTm90IHN1cmUgSSB1bmRlcnN0YW5kIGV4YWN0bHkuIElzIHRoZSBnb2FsIHRvIHNpbXBs
eSBjaGFuZ2UvcmUtcmFuZG9taXplIHlvdXIgbGlzdGVuLXBvcnQgZHVlIHRvIHNvbWUgd2VpcmQg
cXVpcmtzIG9mIHlvdXIgcm91dGVyJ3MgTkFUIHRhYmxlLCBpbiB3aGljaCBjYXNlIGB3ZyBzZXQg
d2cwIGxpc3Rlbi1wb3J0IDBgIHdpbGwgcHJvYmFibHkgd29yayBiZXR0ZXIgdGhhbiBkb3duL3Vw
PyBPciBpcyB0aGlzIGFjdHVhbGx5IGEgY2FzZSB3aGVyZSBhZGRpbmcgUGVyc2lzdGVudEtlZXBh
bGl2ZT0yNSBjb3VsZCBmaXggdGhpbmdzPyBCb3RoIG9mIHRoZXNlIG9wdGlvbnMsIGFueWhvdywg
YXJlIGF2YWlsYWJsZSBpbiB0aGUgV2luZG93cyBjbGllbnQuIHdnLmV4ZSBpcyBpbnN0YWxsZWQg
aW50bwpzeXN0ZW0zMiBhbmQgd29ya3MgYXMgZXhwZWN0ZWQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVH
dWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQK
