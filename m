Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIM_INVALID,
	URIBL_BLOCKED,URI_TRY_3LD autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8AFC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 15:53:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0AF2098A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 15:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=poorlab.com header.i=@poorlab.com header.b="CKhUCHxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0AF2098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorlab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05fcfe40;
	Tue, 25 Sep 2018 15:50:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 732043db
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 15:50:26 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1c25d6d
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 15:50:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=poorlab.com; q=dns/txt;
 s=mailo; t=1537890781; h=Content-Transfer-Encoding: Content-Type: Cc:
 To: Subject: Message-ID: Date: From: In-Reply-To: References:
 MIME-Version: Sender; bh=N5OHeShFDZBNQ+5hQ+lY98Fj4y/8rET8n4rzmXbNOT8=;
 b=CKhUCHxWjSPrn3j5r2vjctEyJ2IxBUohRRqQwwcgW9qFUT95nYviu51QaiUvVxfkw1K2Boil
 z4KTXS5+Fde8ClDLnLAhO6VESq5ErdzM4SkLj8c0++5yJgCIwOTU/vXF4+A27sASXacwwFX1
 HHOovrY1YLKYkihADaGlaO7PgWo=
X-Mailgun-Sending-Ip: 141.193.32.4
X-Mailgun-Sid: WyJkNWMyNiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImJiMCJd
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mxa.mailgun.org with ESMTP id 5baa59db.7f726456f230-smtp-out-n02;
 Tue, 25 Sep 2018 15:52:59 -0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id q20-v6so9445325qkc.12
 for <wireguard@lists.zx2c4.com>; Tue, 25 Sep 2018 08:52:59 -0700 (PDT)
X-Gm-Message-State: ABuFfojj3DoASsZ9K9bcBfYHMLNhPHdcmjujBw9JWVA5uZXbF1JOVxDh
 WDEEtUxxW3mv4wxa0nQ1WH3Fv2obtv112V3mDXg=
X-Google-Smtp-Source: ACcGV60o+TJqp/h7Hi+C+6OUq0WKwJIkjNy2zdwwD+PBEJCUrWZWyeNEC8gKavjKkxFB4jO+KPeAf/iS+owLJNSSnx4=
X-Received: by 2002:a37:d117:: with SMTP id
 s23-v6mr1213644qki.130.1537890778411; 
 Tue, 25 Sep 2018 08:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
In-Reply-To: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
From: StarBrilliant <coder@poorlab.com>
Date: Wed, 26 Sep 2018 01:52:21 +1000
X-Gmail-Original-Message-ID: <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
Message-ID: <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
Subject: Re: [feature request] To support "Wireguard over raw TCP"
To: wireguard@lists.zx2c4.com
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

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgMToxNyBQTSBLZVhpYW5iaW4oaHR0cDovL2RpeWlzbS5j
b20pCjxrZXhpYW5iaW5AZGl5aXNtLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIEknbSB1c2lu
ZyB1ZHAycmF3LXR1bm5lbCB0byB0cmFuc2Zvcm0gd2lyZWd1YXJkIHVkcCB0cmFmZmljIGludG8g
cmF3IHRjcCAoY29uZmlnIGZpbGVzIGFzIGZvbGxvd3MpLAo+IEl0J3MgdmVyeSBzdGFibGUgb24g
bXkgaG9tZSBuZXR3b3JrIHRoYW4gdXNpbmcgd2lyZWd1YXJkIGFsb25lLAo+IEJ1dCBpZiB3ZSBj
YW4gaW50ZWdyYXRlIFJBVyBUQ1AgZmVhdHVyZSBpbnRvIHdpcmVndWFyZCwgaXQgd291bGQgc2ln
bmlmaWNhbnRseSBpbXByb3ZlIHBlcmZvcm1hbmNlIGFuZCBzdGFiaWxpdHkgZm9yIGVuZCB1c2Vy
cy4KPgo+Cj4gZnJvbTogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZGl5aXNtLzFiODA5MDNhODM3
NzY2NzUwMzFjNzNhZTQ5OTQzOGQ4I2ZpbGUtd2lyZWd1YXJkX2NvbmZpZy10eHQtTDE0NQo+Cj4g
JHdnZXQgaHR0cHM6Ly9naXRodWIuY29tL3dhbmd5dS0vdWRwMnJhdy10dW5uZWwvcmVsZWFzZXMv
ZG93bmxvYWQvMjAxODA4MzAuMi91ZHAycmF3X2JpbmFyaWVzLnRhci5nego+ICR0YXIgeHp2ZiB1
ZHAycmF3X2JpbmFyaWVzLnRhci5nego+ICRzdWRvIGNwIHVkcDJyYXdfYW1kNjQgL3Vzci9iaW4v
Cj4gJHN1ZG8gdWRwMnJhd19hbWQ2NCAtYyAtbDEyNy4wLjAuMjoyNDQ0OCAtcjxzZXJ2ZXIgaXA+
OjI0NDQ3IC1hCj4gJGNhdCAvZXRjL3dpcmVndWFyZC93ZzAuY29uZgo+IFtJbnRlcmZhY2VdCj4g
UHJpdmF0ZUtleSA9IDxjbGllbnQgcHJpdmtleT4KPiBBZGRyZXNzID0gMTAuMC4wLjMvMzIKPiBM
aXN0ZW5Qb3J0ID0gMjQ0NDcKPiBNVFUgPSAxMzAwCj4gUG9zdFVwID0gaXAgcm91dGUgYWRkIDEw
LjAuMC4wLzI0IGRldiB3ZzAgJiYgd2cgc2V0IHdnMCBwZWVyIDxzZXJ2ZXIgcHVia2V5PiBhbGxv
d2VkLWlwcyAwLjAuMC4wLzAKPiBQb3N0RG93biA9IGlwIHJvdXRlIGRlbCAxMC4wLjAuMC8yNAo+
Cj4gW1BlZXJdCj4gIzEwLjAuMC4xCj4gUHVibGljS2V5ID0gPHNlcnZlciBwdWJrZXk+Cj4gRW5k
cG9pbnQgPSAxMjcuMC4wLjI6MjQ0NDgKPiAjQWxsb3dlZElQcyA9IDAuMC4wLjAvMAo+Cj4gJHN1
ZG8gd2ctcXVpY2sgZG93biB3ZzAgOyBzdWRvIHdnLXF1aWNrIHVwIHdnMAo+ICRwaW5nIDEwLjAu
MC4xCj4gNjQgYnl0ZXMgZnJvbSAxMC4wLjAuMTogaWNtcF9zZXE9MjExMyB0dGw9NjQgdGltZT0x
ODMgbXMKPiAkc3VkbyBpcCByb3V0ZSBhZGQgMTA0LjI0LjAuMC8xNiBkZXYgd2cwCj4gJHBpbmcg
bXlpcC5pcGlwLm5ldAo+IFBJTkcgbXlpcC5pcGlwLm5ldCAoMTA0LjI0LjIwLjUwKSA1Nig4NCkg
Ynl0ZXMgb2YgZGF0YS4KPiA2NCBieXRlcyBmcm9tIDEwNC4yNC4yMC41MCAoMTA0LjI0LjIwLjUw
KTogaWNtcF9zZXE9MSB0dGw9NjAgdGltZT0xODUgbXMKPiAkY3VybCBodHRwOi8vbXlpcC5pcGlw
Lm5ldAo+IElQ77yaPHNlcnZlciBpcD4KPgo+ICN0YWtlIGNhcmUsICJNVFUgPSAxMzAwIiBpbiB3
ZzAuY29uZiBpcyBuZWVkZWQgd2hlbiB3aXJlZ3VhcmQgb3ZlciB1ZHAycmF3LCBvciBlbHNlIG1v
c3QgaHR0cHMgcmVxdWVzdHMgd2lsbCBiZSBibG9ja2VkIGJlY2F1c2Ugb2YgbXR1IHByb2JsZW0u
CgoKSGVsbG8gS2V4aWFuYmluLAoKVGhpcyBpcyBhbiBVTk9GRklDSUFMIHJlc3BvbnNlIHRvIHlv
dXIgcXVlc3Rpb24uIChCdXQgSSB0aGluayB0aGUKb2ZmaWNpYWwgZGV2ZWxvcGVycyBtYXkgaGF2
ZSBzaW1pbGFyIGFuc3dlcnMuKQoKV2lyZWd1YXJkIHByb2JhYmx5IHdpbGwgbm90IGFjY2VwdCBh
biBvZmZpY2lhbCBpbnRlZ3JhdGlvbiB0byB1ZHAycmF3LgpUaGUgcmVhc29ucyBhcmU6CgoxKSBX
aXJlZ3VhcmQgd2FudHMgdG8ga2VlcCB0aGVpciBrZXJuZWwgcGFydCBjb2RlIG1pbmltaXplZCwg
dGhlcmVmb3JlCmVhc3kgZm9yIHNlY3VyaXR5IGF1ZGl0aW5nLCBhbmQgbGVzcyBidWdzLlRoZSBV
RFAgcHJvdG9jb2wgaXMgYWN0dWFsbHkKdmVyeSBzaW1wbGUgYW5kIHN0cmFpZ2h0Zm9yd2FyZC4g
KEJ5IHRoZSB3YXksIGlmIHlvdSBpbnRlbmRlZCB0byB1c2UKV2lyZWd1YXJkIGluIENoaW5hLCBi
ZSBpbmZvcm1lZCB0aGF0IHRoaXMgaXMgYSBwcm90b2NvbCB0aGF0IGlzIHZlcnkKZWFzeSB0byBi
bG9jayBieSB0aGUgSVNQLikKCjIpIEkgaGF2ZSByZWFkIHRoZSBzb3VyY2UgY29kZSBvZiB1ZHAy
cmF3LiBUbyBiZSBmcmFuaywgdGhlIGNvZGUgaXMgb2YKdmVyeSBsb3cgcXVhbGl0eS4gRm9yIHRo
aXMgcmVhc29uLCBJIGRvbid0IHRoaW5rIHVkcDJyYXcgd291bGQgYmUKaW50ZWdyYXRlZCBpbnRv
IFdpcmVndWFyZCB1bmxlc3MgaXQncyByZXdyaXR0ZW4uCgozKSBVZHAycmF3IGlzIG5vdCBzdWl0
YWJsZSBmb3IgZXZlcnlvbmUgb3IgZm9yIGV2ZXJ5IGNvdW50cnkuIEZvcgpleGFtcGxlIHVkcDJy
YXcgbWF5IGhhdmUgcHJvYmxlbXMgcGFzc2luZyBtaWRkbGVib3hlcywgd2hpY2ggaXMgY29tbW9u
CmFtb25nIHNhdGVsbGl0ZSBJU1BzIGluIE9jZWFuaWEuIE1pZGRsZWJveGVzIGJyZWFrIGFuZCBy
ZXNlbWJsZSBUQ1AKc2VnbWVudHMgdGh1cyBtYWtlIHVkcDJyYXcgbGl0ZXJhbGx5IHVudXNhYmxl
LiBBbHNvIGl0IGlzIG5vdApjb25nZXN0aW9uIGZyaWVuZGx5IChieSBkZXNpZ24pLCBzbyBhIG1h
c3NpdmUgZGVwbG95bWVudCBtYXkgYWZmZWN0CnRoZSBnbG9iYWwgSW50ZXJuZXQgZWNvbG9neS4K
Ckhvd2V2ZXIgdGhlIGdvb2QgbmV3cyBpcywgV2lyZWd1YXJkIHByb3ZpZGVzIGFuIG9wZW4gY29u
dHJvbCBpbnRlcmZhY2UKKHNlZSBodHRwczovL3d3dy53aXJlZ3VhcmQuY29tL3hwbGF0Zm9ybS8g
KS4gQnkgdXRpbGl6aW5nIHRoaXMKaW50ZXJmYWNlLCB3ZSBjYW4gZGV2ZWxvcCBhbiBhbHRlcm5h
dGUgZnJvbnRlbmQgYXBwbGljYXRpb24gb3RoZXIgdGhhbgp0aGUgb2ZmaWNpYWwgY29tbWFuZCAi
d2ciLCB0aGF0IGF1dG9tYXRpY2FsbHkgc2V0cyB1cCB0aGUga2VybmVsCldpcmVndWFyZCBrZXJu
ZWwgcGFydCBhbmQgYSB1c2VybGFuZCB1ZHAycmF3IHBhcnQsIHBhY2thZ2VkIGFzIG9uZQphcHBs
aWNhdGlvbi4KCgpNeSB3b3JkcyBmb3IgV2lyZWd1YXJkIGRldmVsb3BlcnM6CgoxKSBJbiBjYXNl
IHlvdSBtYXkgbm90IGtub3cgdGhlIHVkcDJyYXcgcHJvdG9jb2wsIGhlcmUgaXMgYQpkZXNjcmlw
dGlvbi4gU29tZSBJU1BzIGluIGNlcnRhaW4gY291bnRyaWVzIGhhdmUgc3RyYW5nZSBRb1Mgc3Ry
YXRlZ3kKdGhhdCBkZXByaW9yaXRpemUgVURQIHBhY2tldHMgZHVyaW5nIG5ldHdvcmsgY29uZ2Vz
dGlvbiwgcmVzdWx0aW5nIGEKNTAlIGxvc3MgcmF0ZSBvciBtb3JlIGZvciBVRFAuIFRoZSB1ZHAy
cmF3IHByb3RvY29sIHNpbXVsYXRlcyBhCnRocmVlLXdheSBUQ1AgaGFuZHNoYWtlIGFuZCBhZGQg
VENQIGhlYWRlciB0byBVRFAgcGFja2V0cyBzbyB0aGV5IHdpbGwKbm90IGJlIGRyb3BwZWQuIFRo
aXMgcHJvdG9jb2wgZG9lcyBub3QgZG8gY29uZ2VzdGlvbiBjb250cm9sIG9yIHJhdGUKY29udHJv
bCwgbmVpdGhlciBkb2VzIGl0IHVuZGVyc3RhbmQgYW55IFRDUCBzZW1hbnRpY3MuIEl0J3MgYSBk
aXJ0eQpoYWNrIGZvciBkaXJ0eSBJU1AsIG5vdCBzdWl0YWJsZSBmb3IgZXZlcnlvbmUsIGJ1dCBv
dmVyd2hlbG1pbmdseQp1c2VmdWwgaW4gY2VydGFpbiBjb3VudHJpZXMuCgoyKSBXaXJlZ3VhcmQg
Y3VycmVudGx5IGRvZXMgbm90IHN1cHBvcnQgYmluZGluZyB0byBsb2NhbGhvc3QuIFRoaXMgaXMK
cmVxdWlyZWQgZm9yIGFueSB0aGlyZC1wYXJ0eSBwbHVnaW5zIHVwb24gV2lyZWd1YXJkIHRvIHdv
cmsuIFdlIG1pZ2h0Cm5lZWQgdG8gY29uc2lkZXIgYmluZGluZyB0byBsb2NhbGhvc3QgYW4gaW1w
b3J0YW50IGZlYXR1cmUgdG8gZ28gaW4KdGhlIG5lYXIgZnV0dXJlLgoKCkJlc3QgcmVnYXJkcywK
U3RhckJyaWxsaWFudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0
cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
