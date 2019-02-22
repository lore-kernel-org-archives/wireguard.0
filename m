Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19226C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:21:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA822175B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA822175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 472dc734;
	Wed, 20 Mar 2019 22:21:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c67086c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 01:20:42 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 874c7cb8
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 01:20:41 +0000 (UTC)
Received: (qmail 17193 invoked from network); 22 Feb 2019 01:29:31 -0000
Received: from localhost (HELO ?192.168.1.133?) (127.0.0.1)
 by achernar.uberspace.de with SMTP; 22 Feb 2019 01:29:31 -0000
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
 <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
 <ce051517-9325-824c-3299-ba08138e7912@ironai.com>
 <ed8879bd-4a2e-662a-b908-6b31354e64c2@urlichs.de>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Message-ID: <60d7d88b-8adf-0f31-1d20-8893641c31be@ironai.com>
Date: Fri, 22 Feb 2019 02:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ed8879bd-4a2e-662a-b908-6b31354e64c2@urlichs.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:21:19 +0100
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

SGkgTWF0dGhpYXMsCgpPbiAyMS4wMi4yMDE5IDA4OjU5LCBNYXR0aGlhcyBVcmxpY2hzIHdyb3Rl
Ogo+IE9uIDE5LjAyLjE5IDE2OjQ1LCBWaW5jZW50IFdpZW1hbm4gd3JvdGU6Cj4+IEEga2VybmVs
IFZQTiBtb2R1bGUgc2hvdWxkIG5vdCBkZXBlbmQKPj4gb24gYSB1c2VyIHNwYWNlIGRhZW1vbiBm
b3IgZG9pbmcgcmVndWxhciBjaGVja3Mgb3IgYSBkYWVtb24gcnVubmluZyBhdAo+PiBhbGwuCj4g
Cj4gSXQgZG9lc24ndC4gWW91IG9ubHkgbmVlZCB1c2Vyc3BhY2Ugd2hlbiB0aGUgZXh0ZXJuYWwg
SVAgYWRkcmVzcyBjaGFuZ2VzCj4gKmFuZCogdGhlIG90aGVyIHNpZGUgZWl0aGVyIGRvZXNuJ3Qg
aW5pdGlhdGUgYSBsaW5rIHRvIHVzLCBvciBjYW4gbm8KPiBsb25nZXIgcmVhY2ggdXMgZHVlIHRv
IGZpcmV3YWxsIG9yIE5BVCBpc3N1ZXMuIFRoaXMgaXMgYWxyZWFkeSBvcmRlcnMgb2YKPiBtYWdu
aXR1ZGUgYmV0dGVyIHRoYW4gT3BlblZQTi4KClRoZXJlIGFyZSBzZXR1cHMgd2hlcmUgdGhlICJz
ZXJ2ZXIiIGhhcyBhIGR5bmFtaWMgSVAgYWRkcmVzcyBhbmQgdXNlcwpEeW5ETlMuIFRoZSAiY2xp
ZW50IiBzaXRzIGJlaGluZCBhIGZpcmV3YWxsLiBUaHVzIHRoZSBzZXJ2ZXIgY2FuJ3QKaW5pdGlh
dGUgYSBjb25uZWN0aW9uLiBXaGVuIHRoZSBJUCBhZGRyZXNzIG9mIHRoZSBzZXJ2ZXIgY2hhbmdl
cywgdGhlCmNsaWVudCBsb3NlcyBjb25uZWN0aW9uLgoKPiBETlMgaXMgYSBjb21wbGV4IHByb3Rv
Y29sIHRoYXQncyBub250cml2aWFsIHRvIGltcGxlbWVudCBzZWN1cmVseSwKPiBETlNTRUMgZXZl
biBtb3JlIHNvLiBZb3UgZG8gbm90IHdhbnQgdGhhdCBpbiB0aGUga2VybmVsLiBJJ2Qgd2FnZXIg
YQo+IGxhcmdlIGNodW5rIG9mIG1vbmV5IHRoYXQgbmVpdGhlciBkb2VzIExpbnVzIFRvcnZhbGRz
LgoKUGxlYXNlIGRvbid0IHVuZGVyc3RhbmQgbWUgd3JvbmcuIEkgZG9uJ3Qgd2FudCB0byBoYXZl
IEROUyBxdWVyaWVzCnJ1bm5pbmcgaW4ga2VybmVsIGxhbmQuCgo+PiAgICAgT25lIGNvdWxkIGJ1
aWxkIHVwIG9uCj4+ICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9u
L25ldHdvcmtpbmcvZG5zX3Jlc29sdmVyLnR4dCAsCj4+ICAgICBidXQgaXQncyBhIGxvdCBvZiB3
b3JrIGFuZCBzaG91bGRuJ3QgYmUgYSBnb2FsIGJlZm9yZSBXaXJlR3VhcmQgYmVjb21lcwo+PiAg
ICAgYW4gdXBzdHJlYW0ga2VybmVsIG1vZHVsZS4KPiAKPiAgICAgSSdtIHByZXR0eSBzdXJlIHRo
YXQncyB0aGUgd2F5IHRvIGdvIGxvbmctdGVybS4KPiAKPiBVbW0g4oCmIHlvdSBtaWdodCB3YW50
IHRvIHJlYWQgdGhhdC4gSXQgc3BlY2lmaWVzIHVwY2FsbGluZyB0byB1c2Vyc3BhY2UuCj4gSG93
IGlzIHRoYXQgYmV0dGVyIHRoYW4gcnVubmluZyBhIFdHIGRhZW1vbj8KCk5vdCBkZXBlbmRpbmcg
b24gYSBkYWVtb24sIGJ1dCBvbmx5IGNhbGxpbmcgYSB1c2Vyc3BhY2UgcHJvZ3JhbSB3aGVuIG5l
ZWRlZC4KCj4gV2UnZCBhbHNvIGxvc2UgZmxleGliaWxpdHkuIEkgbWlnaHQgd2FudCB0byB0ZWFj
aCB0aGF0IFdHIGRhZW1vbiB0byBnZXQKPiB0aGUgbmV3IGFkZHJlc3MgZnJvbSBzb21ld2hlcmUg
ZWxzZSwgbGlrZSBhIHNlY3VyZSBjb25uZWN0aW9uIHRvIGEgVlBOCj4gc2VydmVyIChnaXZlbiB0
aGF0IEROUyB0aW1lb3V0cyBtaWdodCBiZSB0b28gbG9uZyksIG9yIHRvIHVzZSB0aGF0Cj4gbmV0
bGluayBjYWxsYmFjayB0byB0cmlnZ2VyIGFuIGFsZXJ0IG9yIHRvIGFjdGl2YXRlIGEgZmFsbGJh
Y2sgY29ubmVjdGlvbi4KCllvdSBhcmUgcmlnaHQuIE5ldGxpbmsgbm90aWZpY2F0aW9ucyBhcmUg
YSBkZXNpcmFibGUgZmVhdHVyZS4KCkkganVzdCB0aGluayB3ZSBzaG91bGQgbm90IGRlcGVuZCBv
biBhIGRhZW1vbiBpbiB0aGlzIHNjZW5hcmlvLgpXZSBjb3VsZCBhbHNvIHJld3JpdGUgV2lyZUd1
YXJkIHRvIGJlIGluIHRoZSB1c2Vyc3BhY2UgYW5kIGltcGxlbWVudCBhCiJ0dW5zb2NrIiBpbiB0
aGUga2VybmVsIGFsbG93aW5nIHVzIHRvIHVzZSByZWN2bW1zZyBvbiBhIHR1biBkZXZpY2UuIFRo
ZQp0aHJvdWdocHV0IHdvdWxkIG5vdCBiZSB0aGF0IG11Y2ggbG93ZXIgYXMgdGhlIGxpbWl0aW5n
IGZhY3RvciBvZgp1c2Vyc3BhY2UgVlBOcyBpcyBvZnRlbiB0aGUgbnVtYmVyIG9mIGNvbnRleHQg
c3dpdGNoZXMsIGJ1dCBpbnN0ZWFkIHdlCmxvdmUgdG8gc2VlIFdpcmVHdWFyZCBpbiB0aGUga2Vy
bmVsLCBiZWNhdXNlIGhpZ2gtYmFuZHdpZHRoIHBhY2tldApwcm9jZXNzaW5nIHNob3VsZCBiZSBk
b25lIHRoZXJlLiBMaWtld2lzZSBzb21ldGhpbmcgYXMgZnVuZGFtZW50YWwgZm9yIGEKVlBOIGFz
IEROUyByZXNvbHV0aW9uIHNob3VsZCBiZSBjYWxsZWQgZnJvbSB3aGVyZSB0aGUgVlBOIGxpdmVz
LgpBcyBmYXIgYXMgSSBrbm93IG5vIHR1bm5lbCBpbXBsZW1lbnRhdGlvbiBleGlzdHMgaW4gdGhl
IGtlcm5lbCB0aGF0CmRlcGVuZHMgb24gYSBkYWVtb24gcnVubmluZyBhbmQgYXMgdGhlcmUgaXMg
YW4gZXhpc3RpbmcgQVBJIGZvciBETlMKcmVzb2x1dGlvbiBhbHRob3VnaCBpdCB1cGNhbGxzIGEg
dXNlcnNwYWNlIHByb2dyYW0gKG9uIHdoaWNoIHdlIGFncmVlCml0J3MgbGVnaXQgZm9yIEROUyBy
ZXNvbHV0aW9uKSB3aHkgZG9uJ3Qgd2UgcmV1c2UgYW5kIGltcHJvdmUgaXQ/CgpSZWdhcmRzLAoK
VmluY2VudCBXaWVtYW5uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
