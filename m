Return-Path: <SRS0=JHi/=XL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CB0C49ED7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Sep 2019 06:39:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37A120830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Sep 2019 06:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="cb1+cTan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37A120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc8ba5fa;
	Mon, 16 Sep 2019 06:39:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 791c3cff
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 06:39:14 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17b978e2
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 06:39:14 +0000 (UTC)
Received: from LenovoE540 (unknown [192.168.177.65])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id 464AD280624;
 Mon, 16 Sep 2019 08:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1568615953;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=UwU5c8cwvCsneyISTOqn6YlBHvEeQCJJFGdTcIZdjNo=;
 b=cb1+cTanAnZ4v6oeFXlrOjbXVxEKrufWeqERssSAcaTXVbZCWZYupXJH6YvwPSGtgF/xD0
 LhXA6sDj4Qj+FTj18CBJANGrp8kpIHzq34+Rz1h5ufTEsh5vI1xCgwkJLwqq3PF0+R6wh3
 UP41AUtakdi7ZORa1Jm7rbbeQD5rUutcu6Xtg35ZPW1wfX+fodETYKDfBaRCeTfI+jHmuo
 BB1etzGPrl247WiLq691/SskY3Zb0+6Pi6xVTTP3F5pIRiqknXMmwBNAY5LIQlgrclYxQu
 1TlygpMWTlua23EmPbBdcQiLIUsGCPrvyD/dZQfRiFeMp50nXTzTehT8mva/wg==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: <wireguard@lists.zx2c4.com>,
	"'Jason A. Donenfeld'" <Jason@zx2c4.com>
References: <1d6e01d56a08$89e4e620$9daeb260$@lindenberg.one>
 <CAHmME9p3RdgKOKWUKDhtJwKimKGM3pjoM+VpOFfakyYfpSaXTg@mail.gmail.com>
 <CAHmME9rHUztxrpAjD6G7o7cmQ3W6jozNsDM9TvqRXyqZNweYYA@mail.gmail.com>
In-Reply-To: <CAHmME9rHUztxrpAjD6G7o7cmQ3W6jozNsDM9TvqRXyqZNweYYA@mail.gmail.com>
Subject: AW: error messages on Hyper-V..
Date: Mon, 16 Sep 2019 08:38:44 +0200
Message-ID: <1e3301d56c59$62dc6dc0$28954940$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI7skYgL7AVjgUMs4TzzqONk1zaygMlfcEgAtj/QGOmMVle4A==
Content-Language: de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1568615953;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=UwU5c8cwvCsneyISTOqn6YlBHvEeQCJJFGdTcIZdjNo=;
 b=c83U+P9vF0cfJCUbOKxPppe1rvJxSC+guvXHpgUYfbuIxmNA7JaKE/4sp6T6xaPC7jT+jJ
 +SppYGQT1zlpg8pCT7I3VIOlNHfVb9Q27gnw4A+YPi9+NKIRIfd01nGD5ZDKfNwnNNrZ2S
 mFYAkHK2CxSfvyfZijA45e5wQvjtIVJRvLZUl0mt82cJsdh4HAn1AZn0U6PAqt1MBZpQo3
 XLYte/n1ZtmmDSNxT4jtnYzQ1Bqa/b8AJgRBAL9CoSu8hIiOcHOAlxfK8cFiIjYC3OfUXV
 F5QD97iMs7o7E8XAM+oVOpAS2lXpunY5/YkNsfpYlQQ+zjKriHF4MqSBgE/bPw==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1568615953; a=rsa-sha256;
 cv=none;
 b=lo1TpgyVtv4kAlwbN2NGOzHZuAkY9LcggTAXlu401UI7eQQLpYGYkgql1U+5/cEvRwYGIqIixaYyy8tf9Vl4wUyOgekEOWq2zWlhhPiqbasUFHU3seAc3HMDLZCokuuPsd7PH0BdPiz6NbeehOlXLpeXcvWYPHYmm41h0ODMEwHN+Mxnlgd8f3aslbgWPZKj9yvQaFIBrtiJCFgaxA1aYN+SoiGqBWLtwYf84bnYFkOOCs1w8j82hkZqtXYrGiVt+R7aJuulSPeiA2+QPjDmRNxzvuQyEmeAPukeP6FJfdqHWnFZK0CGae3EvWMKWb8+CUrNEjqc5pGToYovtMzsPA==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
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

SGkgSmFzb24sCm5vdCBzdXJlIEkgY2FuLiBJIGluc3RhbGxlZCAuMjYgYW5kIGNvbmZpZ3VyZWQg
YW4gZW1wdHkgdHVubmVsICh1bmluc3RhbGwgb2YgLjIyIGRlbGV0ZWQgdGhlIHByZXZpb3VzIGNv
bmZpZ3VyYXRpb24pLiBBZnRlciAyNCBob3VycyBJIGhhdmVuwrR0IHNlZW4gdGhlIGVycm9yIGFn
YWluLiBLZWVwaW5nIFdpcmVndWFyZCBpbnN0YWxsZWQgZm9yIG5vdy4uLgpSZWdhcmRzLCBKb2Fj
aGltCgoKPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tCj4gVm9uOiBKYXNvbiBB
LiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KPiBHZXNlbmRldDogU2Ftc3RhZywgMTQuIFNl
cHRlbWJlciAyMDE5IDE5OjIyCj4gQW46IEpvYWNoaW0gTGluZGVuYmVyZyA8d2lyZWd1YXJkQGxp
bmRlbmJlcmcub25lPgo+IEJldHJlZmY6IFJlOiBlcnJvciBtZXNzYWdlcyBvbiBIeXBlci1WLi4K
PiAKPiBIaSBKb2FjaGltLAo+IAo+IENvdWxkIHlvdSBjb25maXJtIHRoYXQgMC4wLjI2IGZpeGVz
IHRoZSBpc3N1ZT8KPiAKPiBUaGFua3MsCj4gSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
