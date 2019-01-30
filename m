Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE3C282D7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 11:35:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2F1B20844
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 11:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="nQIhiz/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F1B20844
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dd38bc0;
	Wed, 30 Jan 2019 11:29:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f187cc42
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 11:29:33 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9b02303
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=MonYNPj+DVsODRVFT/tnaRjWrEbqLSwY+dvMb+KTDHA=; b=nQIhiz/n+Acsm0Q8ibGzXlvaNG
 5dMs42+LeeiRlk3oPuNnR49cJ42NXYd5g5wZTfCSfhxuAgsOOoqdl0z3x64xrNpOPcfCkMNsaxouu
 HI47VsFCP0RSZYG207q7Mb9fJ4FWl+YK+MM9WW8DHwnSkwa4Ll84LOUJ+0hyW3tIiRXGEXY6aCLKf
 lfDS5mhR99yVNZmeTbhQbW/xTF3WG65CspySs3ylBFHDJrhNk8NWtjFioxuGAmsDn/UQ/CIPrfIyZ
 JJoHRSFZbEy418c+m6wSbFi55AS/JgQMTy1PcqxgndzcO/Vh1a2CH/XbUOSUsJ8HgfY/draYYZAg5
 cA5vtec/qYkgUazHQMY3ktJyjUFMjuq8dJ8bMIZrtL06tZmJKqqM4LGGXO4D4bIkZUh6You2s2tYP
 7jkETUEHxKYbqKH3CVWXcT8tQn7BpCM7eKhqZ/RjSLlSAEIWlppYXeoWagCA1udwcOLhD8rTGOYVK
 swO6Vffoh7taN/O/xPwRwdkZ6enpfVCJnpXsucpZ+CJTj+NbhEfN+ZKgngUTnt3NlLARPfdU6H8Er
 0tKjXr799u0gUfaclxH388UE3AHxUFSYZYy2fq+4PLL5XBtWxgn7NVWgi8QaxRGNizVaS2cHBuzfV
 8em6utbARhLmAw/Tq7DR10txS4zdhyQcJ9jbj4u5U=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1goo9P-0005pU-Mq
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Wed, 30 Jan 2019 12:35:29 +0100
Subject: Re: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
To: wireguard@lists.zx2c4.com
References: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
 <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <d3011ea0-310a-98e1-5e96-9df0c1e26bd3@bartschnet.de>
Date: Wed, 30 Jan 2019 12:35:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

CgpBbSAzMC4wMS4xOSB1bSAwMDo1NSBzY2hyaWViIFN0ZXZlIEdpbGJlcmQ6Cj4gSSB2ZXJ5IG11
Y2ggbGlrZSB0aGUgaWRlYSBvZiB0aGlzIHByb2plY3QgLSBJJ3ZlIGJlZW4gbG9va2luZyBmb3Ig
YSBkZWNlbnQgZnVsbC1tZXNoIEwzIFZQTiBmb3IgYWdlcywgYW5kIGhhdmUgbmV2ZXIgZm91bmQg
YSBzb2x1dGlvbiBJJ3ZlIGJlZW4gcHJvcGVybHkgaGFwcHkgd2l0aC4gVGhhbmtzIGZvciB5b3Vy
IHdvcmsgaW4gZGV2ZWxvcGluZyB0aGlzIHNvbHV0aW9uIDotKS4KCk1lLCB0b28gLSBUaGFua3Mh
IDotKQoKPiBIb3dldmVyIC0gSSdtIGNvbmNlcm5lZCBhYm91dCBzb21lIG9mIHRoZSBwb3RlbnRp
YWwgaW5jcmVhc2VkIGF0dGFjayBzdXJmYWNlIHRoYXQgeW91ciBhcmNoaXRlY3R1cmUgaW50cm9k
dWNlczoKPiAgwqAtIHVzZXMgZXh0cmEgY3J5cHRvIGZ1bmN0aW9uYWxpdHkgd2hpY2ggaXMgbm90
IGFscmVhZHkgcGFydCBvZiB3aXJlZ3VhcmQ7IGFuZAo+ICDCoC0gcGFzc2VzIG1lc3NhZ2VzIGFj
cm9zcyBwdWJsaWMgbmV0d29ya3MgdXNpbmcgdGhhdCBmdW5jdGlvbmFsaXR5OyBhbmQKPiAgwqAt
IGNsYW1wcyB0aGUgd2lyZWd1YXJkIGtleXMgaW4gc29tZSB1bnNwZWNpZmllZCB3YXkgdG8gZW1i
ZWQgYSBwcm9vZi1vZi13b3JrIChpbiBmYWlybmVzcywgSSBoYXZlbid0IHJlYWQgdGhlIGNvZGUs
IHNvIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgaGF2ZSBtaXN1bmRlcnN0b29kKS4KPiAKPiBGb3Ig
d2hhdCBpdCdzIHdvcnRoLCBpZiBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBhbHNvIGVuY2Fwc3Vs
YXRlIHlvdXIgY29udHJvbCBwcm90b2NvbCBpbnNpZGUgd2lyZWd1YXJkLCB0aGF0IHdvdWxkIGJl
IHZhc3RseSBwcmVmZXJhYmxlOiBpdCBhbGxvd3MgdGhlIHRyYW5zcG9ydCBjcnlwdG9ncmFwaHkg
dG8gYmUgaW1wbGVtZW50ZWQgaW4gb25lIHBsYWNlLCBvbmNlIChpLmUuIGluIHdpcmVndWFyZCks
IGFuZCBsZXRzIHdpcmVodWIgYmUgYSAKcHVyZWx5IG9yZ2FuaXNhdGlvbmFsIG92ZXJsYXkgZm9y
IG1hbmFnaW5nIGxpbmtzLCByYXRoZXIgdGhhbiB0b3VjaGluZyB0aGUgY3J5cHRvIGFuZCBpbnRy
b2R1Y2luZyB0cm91YmxpbmcgZXh0cmEgY29tcGxleGl0aWVzLgoKSSBhZ3JlZS4gUGlnZ3liYWNr
aW5nIFdpcmVodWIgY29tbXVuaWNhdGlvbiBvbiBXaXJlZ3VhcmQgZW5jcnlwdGlvbiBpbnN0ZWFk
IG9mIGN1c3RvbSBVRFAgc2F2ZXMgYW4gYWRkaXRpb25hbCBsYXllciBvZiBlbmNyeXB0aW9uIGFu
IHRodXMgc3VwZXJmbHVvdXMgY29kZS4KV2lyZWh1YiBzaG91bGQgb25seSB1c2UgWklOQyBmdW5j
dGlvbnMgdG8gc2lnbi92YWxpZGF0ZSB0aGUgREhUIGVudHJpZXMgd2l0aCB0aGUgV2lyZWd1YXJk
IHByaXZhdGUvcHVibGljIGtleS4KCkkgc3VnZ2VzdCB0byB1c2UgYSBjcnlwdG9ncmFwaGljYWxs
eSBnZW5lcmF0ZWQgSVB2NiBhZGRyZXNzICgxMjgtYml0IGhhc2ggb2YgV2lyZWd1cmFkIHB1Ymxp
YyBrZXkgd2l0aCBmaXJzdCBuIGJpdHMgcmVwbGFjZWQgYnkgYSBXaXJlZ3VhcmQtc3BlY2lmaWMg
SVB2NiBwcmVmaXgpCmZvciByb3V0aW5nIGFuZCBtYW5hZ2VtZW50IHB1cnBvc2VzLiBBZGRpbmcg
YSByZXZlcnNlLWxvb2t1cCBJUHY2LWFkZHJlc3MgLT4gV2lyZWd1YXJkIHB1YmxpYyBrZXkgdmlh
IERIVCB3b3VsZCBhbGxvdyBhIHB1YmxpYyBJUHY2IG92ZXJsYXkgbmV0d29yawp3aXRoIGF1dGhv
cml6YXRpb24gdmlhIGZpcmV3YWxsIHJ1bGVzLiBOb2RlcyBzaG91bGQgYWxzbyBiZSBhYmxlIHRv
IGFubm91bmNlIHRoZWlyIHN1Ym5ldHMgdmlhIERIVC4KCj4gCj4gSSB3b3VsZCBhbHNvIGxvdmUg
dG8gc2VlIHNvbWUgc29ydCBvZiBQS0kgb3B0aW9uIHdpdGggdGhpcyBwcm9qZWN0LCB0byBhdm9p
ZCBoYXZpbmcgdG8gZXhwbGljaXRseSB0cnVzdCBhbGwgdGhlIHBlZXJzLiBJJ2QgcHJlZmVyIHRv
IGJlIGFibGUgdG8gc2ltcGx5IHByb3ZpZGUgdGhlIHBlZXJzIHdpdGggYSBzaWduYXR1cmUgdGhl
eSBjYW4gcHJlc2VudCB0byBvdGhlciBwZWVycyB0aGF0IHByb3ZlcyB0aGV5IGNhbiBiZSB0cnVz
dGVkIChvciBldmVuIGJldHRlciwgaGF2ZSB0aGF0IHNpZ25hdHVyZSBnZW5lcmF0ZWQgYnkgYSBu
b21pbmF0ZWQgaG9zdCBhdCBjb25uZWN0IC8gc2V0dXAgdGltZSBmb3IgZWFjaCBwZWVyLCB3aGlj
aCBhdm9pZHMgbXVjaCBvZiB0aGUgc2hlbmFuaWdhbnMgaW52b2x2ZWQgd2l0aCBoYW5kbGluZyBl
eHBpcnksIHJldm9jYXRpb25zIGV0Yy4pIEhhdmluZyB0aGUgYWJpbGl0eSB0byB0ZWxsIGFsbCBw
ZWVycyBvbiB0aGUgbmV0d29yayB0byBpbW1lZGlhdGVseSB0ZXJtaW5hdGUgYWxsIGNvbm5lY3Rp
b25zIHdpdGggYSBzcGVjaWZpYyBjb21wcm9taXNlZCBwZWVyIHdvdWxkIGFsc28gYmUgaGFuZHku
CgpBIFBLSSBpbmNyZWFzZXMgY29tcGxleGl0eSBhIGxvdC4gSSBzdWdnZXN0IHVzaW5nIHRoZSBj
cnlwdG9ncmFwaGljYWxseSBnZW5lcmF0ZWQgSVB2NiBhZGRyZXNzIGFwcHJvYWNoIHdpdGggZGlz
dHJpYnV0ZWQgZmlyZXdhbGwgcnVsZXMuCgpSZWdhcmRzLAoKUmVubmUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApX
aXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4v
bGlzdGluZm8vd2lyZWd1YXJkCg==
