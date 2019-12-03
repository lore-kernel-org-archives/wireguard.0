Return-Path: <SRS0=ggdK=ZZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3B1C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Dec 2019 21:07:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD872080F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Dec 2019 21:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=netravnen.de header.i=@netravnen.de header.b="DM5CTCFm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD872080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netravnen.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 130222db;
	Tue, 3 Dec 2019 21:07:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 200cf4b0
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 21:07:26 +0000 (UTC)
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72372e81
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netravnen.de; s=20191106;
 h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
 message-id:from:cc:to:references:subject:reply-to:from;
 bh=JQ3AdZ93qzB01kb727A1lhQLwHv6+vX/bPseBMKoHl8=;
 b=DM5CTCFmHXHrVdxMMCaAwrtfDSHPaSXl2/Xtw5pVXV2Feh8BuR4hBZDm3FrnOiWKrSF0mKY/uRwfg
 76uU0+/uCB+M4D2hm2qaJabAEpuWws+OcCn8nqvVqwX2jet1HKg7ku7wulDsyv4Onv9VZqSiCbMfiZ
 INVGXJ/ISQjoPF39el+T9a9wAs6QV5gH5EDM/0gARAhxEMOVcl+7VkmM3CTqUbkRzKBeJdDG8glvEz
 +T2PuJeDF9uCxE5Lgy4V8H0SjKP3jgmFeiPe1S+FtxR0KOZErppo3GDKZgCJ0+1djaFWJTYtZnPNW8
 Ez83RMIwPL5oW3zBs0YmeLpzymQxAKA==
X-HalOne-Cookie: be292434f9c5c130f40fb4cc904bd701f4d349ae
X-HalOne-ID: e72513ff-1610-11ea-ba02-d0431ea8a290
Received: from [192.168.128.254] (unknown [87.188.75.222])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id e72513ff-1610-11ea-ba02-d0431ea8a290;
 Tue, 03 Dec 2019 21:07:24 +0000 (UTC)
Subject: Re: [wireguard] Wireguard for Windows - local administrator necessary?
References: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
 <CAHmME9rjiN_q7yhFtaUybaX+x60qeVJ8+oFTdWtr65yb6CMzqQ@mail.gmail.com>
To: Jason@zx2c4.com
From: CHRIZTOFFER HANSEN <chriztoffer@netravnen.de>
Openpgp: id=18DD23C550293098DE07052A9DCF2CA008EBD2E8;
 url=https://keybase.io/chri/pgp_keys.asc?fingerprint=18dd23c550293098de07052a9dcf2ca008ebd2e8
Autocrypt: addr=chriztoffer@netravnen.de; prefer-encrypt=mutual; keydata=
 mDMEXAAS+xYJKwYBBAHaRw8BAQdALbnw1RxC+0YdAmJ1+yfqVZk0c47PpF1yhCZFrmUBPZq0
 LUNocml6dG9mZmVyIEhhbnNlbiA8Y2hyaXp0b2ZmZXJAbmV0cmF2bmVuLmRlPoiWBBMWCAA+
 FiEEGN0jxVApMJjeBwUqnc8soAjr0ugFAl1FtH8CGwMFCQtJi7UFCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AACgkQnc8soAjr0ujV8AEAyvy21bHFg1lA1doTMgEkzITd7iryzSRGxw3XWCfs
 Dw8BAIP97zUZA37nTz8LQWGhTsj/EMB1yK3rC/8uGI8MoTEOtC1DaHJpenRvZmZlciBoYW5z
 ZW4gPGNocml6dG9mZmVyQG5ldHJhdm5lbi5kZT6IeAQwFggAIBYhBBjdI8VQKTCY3gcFKp3P
 LKAI69LoBQJdRbSFAh0AAAoJEJ3PLKAI69LoXuEBAMxeYlMwITaIAcHhlWYb1rY4N5L+IOef
 gkOwW7fHck61AQDEFhwx+HDg39loaVPP7aOnkPpFrfBr2eNlRDWGicGYALQtQ2hyaXN0b2Zm
 ZXIgSGFuc2VuIDxjaHJpc3RvZmZlckBuZXRyYXZuZW4uZGU+iHgEMBYIACAWIQQY3SPFUCkw
 mN4HBSqdzyygCOvS6AUCXUW1uQIdAAAKCRCdzyygCOvS6Lx2AP41mPaxcCjp/wo2F1p9o+Sx
 v/Kn/KSYersleDuTR4m24QD+Ih4a1fOeoa2f6pMaNassZJW0z64vST4TgA4E9nqLzQK4OARc
 ABL7EgorBgEEAZdVAQUBAQdAQ3kU9zblE7a3lLU9Lq7ScGK4/QDg8j7zCXlFyDmgIRcDAQgH
 iH4EGBYIACYWIQQY3SPFUCkwmN4HBSqdzyygCOvS6AUCXAAS+wIbDAUJC0mLtQAKCRCdzyyg
 COvS6HPqAP929IamBksrgJptTou0CBIbn5HS6/AaO5spNdSkSHLcUwD/a6+AblAcfkkszBjd
 clhJNNQG2RjPWN1AXlp+AFRlpwU=
Message-ID: <13b61b9c-0fbd-2588-99b0-b377ce8a4c4f@netravnen.de>
Date: Tue, 3 Dec 2019 22:07:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rjiN_q7yhFtaUybaX+x60qeVJ8+oFTdWtr65yb6CMzqQ@mail.gmail.com>
Content-Language: en-GB
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: chriztoffer@netravnen.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Jason A. Donenfeld wrote on 27/11/2019 13:29:
> On Wed, Nov 27, 2019 at 10:07 AM Chris Bennett <chris@ceegeebee.com> wrote:
>> However I've found the logged in user needs local Administrator access to activate and de-activate a tunnel.  Is there any way around this?  Is it in the roadmap to remove this requirement?
> 
> No intention of reducing the security of the system, no. WireGuard
> requires administrator access because redirecting an entire machine's
> network traffic is certainly an administrator's task.

What if you this functionality is coded as opt-in, for e.g. a org/corp 
sysadmin to enable for the users, and *not* opt-out?

The the default knob will still be secure, and the sysadmin has the 
conscious possibility to put power in the hand of the users. And it will 
  be the sysadm's choice. Not the team behind pushing the development of 
WireGuard forward, taking a choice on behalf of the consumer/user base.

Chriztoffer
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
