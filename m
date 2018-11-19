Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DB9C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 23:00:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8452080C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 23:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8452080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b56bda3d;
	Mon, 19 Nov 2018 22:54:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3df81c07
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 22:54:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8800aea9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 22:54:48 +0000 (UTC)
Received: from [10.0.0.20] ([193.81.35.23]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MQih7-1g1U7h2Z81-00Tz4L; Tue, 20
 Nov 2018 00:00:48 +0100
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: Android key-icon in statusbar
From: Robert Walli <rwalli@gmx.net>
X-Priority: 3
In-Reply-To: <362749885.10996.1542657892449@office.mailbox.org>
Date: Tue, 20 Nov 2018 00:00:46 +0100
Message-Id: <F88F15D7-FF7C-40C2-A84F-0B04F00E4BCA@gmx.net>
References: <8365521A-0DE2-44B0-BFDF-5AAB82054756@gmx.net>
 <362749885.10996.1542657892449@office.mailbox.org>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.101.1)
X-Provags-ID: V03:K1:PZmmk9hCuooFavnNIokCNlziDjwmw3OzwbVP2paVyDNwKXWuiLm
 NIrOr9L1kkn+eaoZkhiwZUmvTM7JC850Kxdaj1sIHokRGS9sL9I2VdtLBp1xhPFxrq8r1LW
 ydpMknfqVAJb4qynccY0AFdb30b7Eofi0BHLhT5c+czMQ0Zi8hCi7w8PUQUDbeqcyc51Bxp
 8599R25+TvOHiDEVwxDag==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vQnQdMpnuLo=:FwHZD3gTrDrXezUWX08Y5Z
 cs8zuu6AhcQ/vzfnppFt+nVDnv2uPzcxka9dg0tE8LInauijgtzDCHlLMRN3lJxUWmPbhSgJW
 3DppnWEQBd2BNgkT1s8mWTjHY4CLzQtp//ioOYfS4OFkun74qx1+7wQIduF9GNabfdr3OauHZ
 9gu+/cJ1QoId/iPkNTUMOYBPDOwBqhaszzuynp6FmlkGhEY73EkjZ9QQYLLI3080iO23bIDs/
 RS8tZWJ+707QMtzw7EfMqUJ7UM2NNOL4ZSUOR7f5LKtuzkRn6eBNEiH53O4fST1Cht4hvgaBg
 qm/IRXf7Gy/MJvmtcf4yutS51NMjqroHHgoo8O6OVTjqKGhmdEAdhDsl/Qz2LhmFMT1+yeGJX
 RXxLKXwbKZ1T6qf3yh6fyUMk4xhH3up44H/f3Mvd/FIlIaPiGl1nlJeA4FU7ngUln3IOSAQ3m
 MrvoAgKayllMPEDUjBbXdGkWcXRWaw0qNQc4G7e9lpGItDchRtF/8RZErLZp+exqyIRKBdVHI
 QtR04Mf1gBQA3U+MS2uHJhrBRhMPNR0Z74NLDbWY7vpERK6NQso4EIDcmdRl6GvLOdVT0LFF4
 a2mesTUthFQZfpDvjGNsWCJ7h9EDuyOvZPt7ZXMhr5Ph5nplHDog2OScI3p+JYPux5+jrN0Ox
 p4EKDapBK2c+UgH3WrGFLmXIkuaBRY9lsgWW61Swita5vGDEAx7VMPL+icVoMkLapQW6OaMUP
 nRX65BM1DMHgEie7A7LsFBIzxisGPwg1NsRPrefQozY2VmIrU/pYK6O6o8UJyH67QdkhZVh1r
 5mJSNQG6oGqvsErkaxQv8L9VkgfksuUxzKUdV/66my4igT/45M9HUschVBJvfkBqUWOMxrue8
 XLIHn5L4bHnykSFeEtQiX9aelCqxskUmKuG4PhzPpyE6e12UOqcoAsEhqMbWft
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

Cgo+IE9uIDE5LjExLjIwMTgsIGF0IDIxOjA0LCBuaWNvbGFzQGVpc2Z1bmtlLmNvbSB3cm90ZToK
PiAKPiBIZWxsbywKPiAKPj4gSeKAmXYgaW5zdGFsbGVkIHdpcmVndWFyZC1hcHAgZnJvbSBwbGF5
IHN0b3JlIG9uIGFuZHJvaWQgOC4xLgo+PiBJZiB1c2luZyB0aGUgdXNlcnNwYWNlIHZlcnNpb24g
aSBnZXQgYSAia2V5LWljb24iIGluIHRoZSBzdGF0dXMtYmFyIHdoZW4gYSB0dW5uZWwgaXMgYWN0
aXZlLgo+PiBTd2l0Y2hpbmcgdG8gdGhlIGtlcm5lbCB2ZXJzaW9uIHRoZSBpY29uIGlzIG5vdCB3
b3JraW5nIGFueSBtb3JlLgo+IAo+IHRoZSB1c2Vyc3BhY2UgdmVyc2lvbiB1c2VzIHRoZSBuYXRp
dmUgQW5kcm9pZCBWUE4tQVBJLCB3aGljaCBhbHdheXMgc2hvd3MgdGhlIGtleSBpY29uIGZvciBz
ZWN1cml0eSByZWFzb25zLgo+IAo+IFRoZSBrZXJuZWwgdmVyc2lvbiBkb2Vzbid0IHVzZSB0aGlz
IEFQSSBiZWNhdXNlLCB3ZWxsLCBpdCB1c2VzIHRoZSBrZXJuZWwgbW9kdWxlLiBUaGF0J3Mgd2h5
IHRoZSBrZXkgaWNvbiBpc24ndCBzaG93bi4KPiAKCgpTb3JyeSwgaeKAmW0gYSBuZXcgdG8gdGhp
cyBhbmQgZGlkIG5vdCBrbm93IGl0LgoKSSBoYXZlIGFub3RoZXIgcHJvYmxlbSB3aGlsZSB0ZXN0
aW5nOgpNeSBST00gaGFzIG5vIHdpcmVndWFyZC1zdXBwb3J0IHNvIEkgaGFkIHRvIGNvbXBpbGUg
bXlzZWxmLgpEaXJ0eSBmbGFzaGluZyBiYWNrIHRvIG9yaWdpbmFsIChBSUNQKSBST00gY2F1c2Vk
IHN0b2NrIG9uIHRoZSBsb2Nrc2NyZWVuLgoKSXMgdGhlcmUgYW55IG9wdGlvbiB0byBmb3JjZSBh
bmRyb2lkIHRvIHVzZSB0aGUgdXNlcnNwYWNlLXZlcnNpb24gdG8gdGVzdCBib3RoIHZlcnNpb24g
d2l0aG91dCBlcmFzaW5nIHRoZSB3aG9sZSBmbGFzaD8KV2hhdCBmaWxlcyBzaG91bGQgaSByZW1v
dmUgaW4gb3JkZXIgdG8gYXZvaWQgdGhlIGxvY2tzY3JlZW4gaXNzdWU/CgpUaGFuayB5b3UgaW4g
YWR2YW5jZSwKClJvYmVydAoKIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5j
b20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
