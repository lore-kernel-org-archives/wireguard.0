Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D46C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:55:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB46206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:55:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wi4Hf931"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB46206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 667f19f6;
	Sun, 25 Aug 2019 18:54:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26adc5eb
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:54:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52561658
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:54:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb4a093e
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=ofvFiCnUYLeq
 i45hQkvUFP39/MA=; b=wi4Hf931sva0nP70LdOEikoDM7pmnnIQz8x2F7EuFdF6
 waw7G3B4IAxB1y3l5sBFdr/qnIm3Sjx0pkq8Re0/2REgUo06WaS2f8yK48mLMlTs
 +3LB+B211962mUm5y69VdBDUCegtQzjvcEEGXvH0S1CUkjp3L+kM6Oh5GSOJ27TO
 LkV/w2OIloPtgTyHy+YCJ401QLjsUde9k1CREvYgE28Qkumo224Q/hZx8e1z+rCx
 opV0m0Uj1fm350WPg2HPW528xfE+85fEwJt4/yfcWDmscxpdPmx2g9sU9+jre377
 uhPi93cfusD0vMwQdEInj2czdY9EWSGHu17+LT6Ncw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0cb59a9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:12:57 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id b1so13236681otp.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 11:54:46 -0700 (PDT)
X-Gm-Message-State: APjAAAXEO511IC8/O6DZH5e/yVKNwjJxdL2TZNKI6RNxT/GinV5GuMUy
 q5+iTruOLMXd5uSo1THFiNwJAFyKbO9lF6sBfpM=
X-Google-Smtp-Source: APXvYqwNqPTZ9rojWFia9a8dt7jPM5aUcfu4jSAhvyTf91AuKcrTBdATHZHQBYjb8X/7bP5yTeVi+A8woFBI31gpOB8=
X-Received: by 2002:a9d:66d8:: with SMTP id t24mr12770306otm.52.1566759286328; 
 Sun, 25 Aug 2019 11:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
 <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
 <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
 <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
 <015d01d55b76$30373290$90a597b0$@lindenberg.one>
In-Reply-To: <015d01d55b76$30373290$90a597b0$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 12:54:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9qf_kpT=u3JfLDh2fENq=z6P5cebYC5YRwTBF2P7NcGWg@mail.gmail.com>
Message-ID: <CAHmME9qf_kpT=u3JfLDh2fENq=z6P5cebYC5YRwTBF2P7NcGWg@mail.gmail.com>
Subject: Re: Hyper-V 2019: unable to create wintun device: no interfaces found
To: news@lindenberg.one, Simon Rozman <simon@rozman.si>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMTI6NTIgUE0gPG5ld3NAbGluZGVuYmVyZy5vbmU+IHdy
b3RlOgo+IG5vdCB0aGUgcG9ydC4gTXkgZXh0ZXJuYWwgSVAgaXMgZHluYW1pYy4gVGhpcyBpcyBy
ZWFsbHkgc3RhbmRhcmQgZm9yIGludGVybmV0IHNlcnZpY2VzIGluIEdlcm1hbnkgb2ZmZXJlZCB0
byBub24tYnVzaW5lc3MgdXNlcnMsIG9yIGFsc28gYnVzaW5lc3MgdGhhdCBwcmVmZXIgbm90IHRo
ZSBwYXkgZXh0cmEgY2hhcmdlcyBmb3IgdGhlIGFzc2lnbm1lbnQgb2YgYSBzdGF0aWMgaXAgYWRk
cmVzcy4gTXkgSVAgYWRkcmVzcyBjaGFuZ2VzIGF0IGxlYXN0IG9uY2UgYSBkYXkgKHVzdWFsbHkg
YmV0d2VlbiAxIGFtIGFuZCAyIGFtKS4gVXN1YWxseSBvbmUgdXNlcyBhIGR5bmRucyBwcm92aWRl
ciwgYW5kIG1hbnkgcm91dGVycyBzdXBwb3J0IHVwZGF0aW5nIHRoZSBpcCBhZGRyZXNzIGF1dG9t
YXRpY2FsbHkuIEFzIEkgYW0gcnVubmluZyBteSBleHRlcm5hbCBETlMgd2l0aCBjbG91ZGZsYXIs
IEkgYW0gY2FsbGluZyB0aGVpciBBUEkgdG8gdXBkYXRlIG15IGV4dGVybmFsIGFkZHJlc3MuCj4g
Tm93IGFmYWlrIFdpcmVndWFyZCByZXNvbHZlcyB0aGUgZG9tYWluIG5hbWUgb2YgdGhlIHNlcnZl
ciBqdXN0IG9uY2UgdG8gYW4gSVAgYWRkcmVzcyBhbmQgbm90IHJlZ3VsYXJseSBvciB3aGVuZXZl
ciB0aGUgY29ubmVjdGlvbiBicmVha3MgZG93biBvciBoYXMgYmVlbiBpZGxlIGZvciBzb21lIHRp
bWUuCj4gUGVyc2lzdGVudEtlZXBBbGl2ZSBjYW5ub3QgYWRkcmVzcyB0aGUgaXNzdWUsIGFzIHRo
ZSBjbGllbnQgaXMgYWxzbyBub3QgYXdha2UgYWxsIHRoZSB0aW1lIGluIG9yZGVyIHRvIHNhdmUg
ZW5lcmd5LiBMb29raW5nIGF0IHdnIC8/IG9uIHdpbmRvd3MgSSBhbHNvIGRvbsK0dCBzZWUgYW55
IG9wdGlvbiB0aGF0IHNlZW1zIGFwcGxpY2FibGUuLgoKQWhoaCwgdGhlIEROUyByZS1yZXNvbHV0
aW9uIGlzc3VlLiBPbiBsaW51eCB3ZSBoYXZlIHRoaXMgbmljZSBzY3JpcHQ6CgpodHRwczovL2dp
dC56eDJjNC5jb20vV2lyZUd1YXJkL3RyZWUvY29udHJpYi9leGFtcGxlcy9yZXJlc29sdmUtZG5z
CgpPbiB3aW5kb3dzLCBpdCBzaG91bGQgYmUgcHJldHR5IGVhc3kgdG8gZG8gYXMgd2VsbC4gWW91
IGNhbiBhY3R1YWxseQpqdXN0IHVzZSB0YXNrIHNjaGVkdWxlciB0byBydW4gYHdnIHNldCB3ZzAg
cGVlciBBQkNELi4uRUY9IGVuZHBvaW50CnNvbWV3aGVyZS5vbi5keW5kbnM6MTIzNGAgZXZlcnkg
bWludXRlIG9yIHdoYXRldmVyIHlvdSBmZWVsIGlzIGJlc3QuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1
YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3dpcmVndWFyZAo=
