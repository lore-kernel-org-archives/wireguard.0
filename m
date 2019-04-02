Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC4EC282DC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:59:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C92C2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=roopc.net header.i=@roopc.net header.b="S+GjmPN/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C92C2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roopc.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e99b7b9;
	Sat, 6 Apr 2019 11:56:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ecf0982
 for <wireguard@lists.zx2c4.com>; Tue, 2 Apr 2019 08:44:57 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10752557
 for <wireguard@lists.zx2c4.com>; Tue, 2 Apr 2019 08:44:57 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q1so6192128pgv.13
 for <wireguard@lists.zx2c4.com>; Tue, 02 Apr 2019 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=roopc.net; s=google-roopc;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=XsIm4PVJkQ/yNfbnq+eO7761RJjD3Jh15RoU+uHl3+s=;
 b=S+GjmPN/tCpVjhPlhqw3qakKtYPaZnb5oCS2WZNO1B8LluufgYIjVikgqf3+UuYgcF
 wSa591NdLJY6nU7OiwHGJiAfM4kYSQ24w7sFDwjxX0Eq5GTx77EXXzbmPyVw/XOl6eL1
 b+cK/gEG5TEMCduXPeV1rGoVzVsAWmUp9CInE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=XsIm4PVJkQ/yNfbnq+eO7761RJjD3Jh15RoU+uHl3+s=;
 b=JZ38cNJdKYOcjUikh0VItRAbuI/Zsj7KgZa893o2TcAWwl4bjOBo1U9H1ed864Df9p
 sGAn4isfzDkH4nvK62XZVIv3ECadXzRzCwXuwJQhutVyMGaQ+S2+sivsjOzY/5ov3o6m
 sI86CF5VQMN5tFUemA/qjwNltgbfAEeewH03sliEs7eeaFNJ1s0zu8B4Be9qpUp0TKG1
 Xsx8TwY//pPjN6e8kuTF7/RtvdPWxwKyK77BfSSMec0NhlDWdMTYYcEGl0f2lXrw3jNL
 0Gm0ieZ8S+VGYGiAmV1PvjFzuATeWUsPf6nHBmwpSog/0Y+xAsrmxkD6XDi1/pV1scaf
 vHMQ==
X-Gm-Message-State: APjAAAVgU87cBq/q1JqK/zD4Z7TssSjZ3+8LZZUUwIsYJ8YTa7+QWuxM
 Cs2p6ZuTgJE5qyPvyqW2D1cV2OJXl2YKv/GB
X-Google-Smtp-Source: APXvYqy/4ulsPEfoxgSg1ely8F6FiznnwTY5AzeNxtBc3Nd8OAKdeqMh5HO8ntrz1h1oJMAqqSjvMg==
X-Received: by 2002:a65:5c8c:: with SMTP id a12mr6060059pgt.296.1554194812255; 
 Tue, 02 Apr 2019 01:46:52 -0700 (PDT)
Received: from [192.168.2.180] ([122.167.226.139])
 by smtp.gmail.com with ESMTPSA id k71sm14961485pfc.155.2019.04.02.01.46.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 01:46:51 -0700 (PDT)
From: Roopesh Chander S <roop@roopc.net>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: iOS connection issue
Message-Id: <B83487AC-E545-443A-9879-28058C1B5E10@roopc.net>
Date: Tue, 2 Apr 2019 14:16:45 +0530
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Sat, 06 Apr 2019 13:56:41 +0200
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

SnVzdCB0byBjb25maXJtLCB5b3XigJlyZSBzYXlpbmcgeW91IGNhbiBjb25uZWN0IGZyb20geW91
ciBNYWMgd2l0aCB0aGlzIGNvbmZpZyBhbmQgYWNjZXNzIHRoZSBJbnRlcm5ldCwgYnV0IGNhbuKA
mXQgZG8gdGhhdCBmcm9tIGlQaG9uZSBmcm9tIHRoZSBzYW1lIGNvbmZpZy4gKEnigJltIGFzc3Vt
aW5nIHlvdSBkaWRu4oCZdCBoYXZlIHRoZSBWUE4gb24gaW4geW91ciBNYWMgd2hlbiB0cnlpbmcg
dG8gY29ubmVjdCBmcm9tIHRoZSBpUGhvbmUuKQoKQ2FuIHlvdSBwcm92aWRlIHRoZSBsb2cgZnJv
bSB5b3VyIGlQaG9uZSB0byBpbnZlc3RpZ2F0ZSBmdXJ0aGVyPyAoU2V0dGluZ3MgPiBMb2cpLiBZ
b3UgY2FuIGVtYWlsIGl0IHRvIHRlYW0gYXQgd2lyZWd1YXJkIGRvdCBjb20uCgo+IEZyb20gdGhl
IEdlbmVyYWwgVlBOIGluZm8sIGl0IHNheXMgdGhlIHNlcnZlciBhZGRyZXNzIGlzIDEyNy4wLjAu
MSwgd2hpY2ggZG9lc27igJl0IHNvdW5kIHJpZ2h0LgoKSeKAmW0gYXNzdW1pbmcgeW914oCZcmUg
c2VlaW5nIHRoaXMgaW4gU2V0dGluZ3MgPiBWUE4gPiBbdnBuIG5hbWVdIChpKSBvbmNlIHRoZSBW
UE4gaXMgdXAuIFRoYXTigJlzIGluZGVlZCBub3QgdGhlIGFjdHVhbCBJUCBvZiB0aGUgc2VydmVy
IOKAlCBpdOKAmXMganVzdCBhbiBhcmJpdHJhcnkgc3RyaW5nIHdlIHByb3ZpZGUgaU9TLiBJ4oCZ
dmUgbm90ZWQgZG93biBhIHRhc2sgdG8gZml4IGl0IHdoZW4gdGhlcmXigJlzIGEgc2luZ2xlIHBl
ZXIgd2l0aCBhbiBlbmRwb2ludC4KClRoYW5rcywKcm9vcC4KCj4gR2xlbiBIdWFuZyB3cm90ZToK
PiAKPiBIaSwKPiAKPiBJIGNhbiBjb25uZWN0IHRvIG15IHdnIHNlcnZlciBvbiBteSBNYWMgd2l0
aCB0aGlzIGNvbmZpZwo+IAo+IFtJbnRlcmZhY2VdCj4gQWRkcmVzcyA9IDEwLjAuMC4yCj4gRE5T
ID0gOC44LjguOAo+IFByaXZhdGVLZXkgPSA8dmFsdWU+Cj4gCj4gW1BlZXJdCj4gRW5kcG9pbnQg
PSA8aXA+Ojxwb3J0Pgo+IFB1YmxpY0tleSA9IDx2YWx1ZT4KPiBBbGxvd2VkSVBzID0gMC4wLjAu
MC8wLCA6Oi8wCj4gCj4gQnV0IG9uY2UgdXBsb2FkIGl0IGFzIHFyIGNvZGUgdG8gbXkgaVBob25l
LCBJIGNhbiBlc3RhYmxpc2ggdGhlIHZwbiBjb25uZWN0aW9uLCBidXQgY2FuIG5vdCBhY2Nlc3Mg
YW55IHdlYnNpdGVzLgo+IAo+IEZyb20gdGhlIEdlbmVyYWwgVlBOIGluZm8sIGl0IHNheXMgdGhl
IHNlcnZlciBhZGRyZXNzIGlzIDEyNy4wLjAuMSwgd2hpY2ggZG9lc27igJl0IHNvdW5kIHJpZ2h0
Lgo+IAo+IE9uZSBzdHJhbmdlIHRoaW5nIGlzIHRoYXQgaWYgSSBjaGFuZ2UgdGhlIGVuZHBvaW50
4oCZcyBpcCB0byBhIGNvdXBsZSBhcmJpdHJhcnkgb25lcywgSSBjYW4gc3RpbGwgZXN0YWJsaXNo
IHZwbiBjb25uZWN0aW9ucywgYnV0IGNhbiBub3QgYWNjZXNzIGFueSB3ZWJzaXRlcyBhbmQgc2Vy
dmVyIGFkZHJlc3MgaXMgMTI3LjAuMC4xLCBzYW1lIHJlc3VsdCBhcyBteSBjb25maWcuCj4gCj4g
QWxzbyBhZnRlciBJIHNjYW4gdGhlIHFyIGNvZGUgYW5kIHRoZSBWUE4gcHJvZmlsZSBpcyBhZGRl
ZCwgaVBob25lIHdpbGwgYWxlcnQgYW4gZXJyb3Igc2F5aW5nIHRoZSB2cG4gc2VydmVyIGNvdWxk
IG5vdCBiZSBmb3VuZCwgYnV0IGlmIEkgZGlzbWlzcyBJIGNhbiBlc3RhYmxpc2ggdGhlIGNvbm5l
Y3Rpb24gKGFuZCBjb3VsZG7igJl0IGFjY2VzcyBhbnkgc2l0ZSkuCj4gCj4gSSB3b25kZXIgd2hh
dCBJIG1pZ2h0IGhhdmUgZG9uZSB3cm9uZz8KPiAKPiBUaGFua3MuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2ly
ZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3dpcmVndWFyZAo=
