Return-Path: <SRS0=zPvC=SJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F863C10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Apr 2019 10:55:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6218D20B1F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Apr 2019 10:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="iyRPDSxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6218D20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f73f0c85;
	Sun, 7 Apr 2019 10:53:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84168802
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 10:53:02 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [IPv6:2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a8b72b5
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dOARTYVJyxz/TLm/mWEvSeSY2I1K4gHwLvvAFtvPx7E=; b=iyRPDSxY+nB6blRpaN5AcdPphB
 6GLCa6agjFuQ43evZ4jb0CKbEmnHBbVFUcioe4LLY9CMlN2GK51EknqoaGefzd6A5uzkMkC+uZwvX
 HuLo2lvur74mefeMrF48XFo51b19zGrD6uUoTJwG9lCodlJkvvlozL6KQ67d9ZAZc5TnqUsevu+gK
 JFjkq0/BgZ2Qu97LSqVILIRUDIlVwCgdXORdqdydsWaLTPx2JvsLbEQpAYLTtWnm0efdMIycSgZSP
 Woq993Ma7JQNicQJtwE8RUluoqqmyZxQ7YOrc1jiqYk9arKAfO5KpCMWXRn++isY25kJyfsI6i0mn
 L4zj1+VUZsfwqrx5yEHmXOfN4sEhyNhLRnXoOL/ss5Whj0k0h9NEEdfKWVG7cGmWU1Dvht/ifOgEt
 TuIisey/n8CQUwvby7SLP/fkfWefrJ3jrcLWsplmxS7SEpnGsDFvCqWSCQdKgakwIZZ9EyXsex5pU
 j6UmlfEmtqCDp6dTEVz86bVJ4jJA3SWp1g0divcrie4SlThmaluYJ6ftrvpNqiuf6aeo46mLFZsbQ
 6/jq5GYkNRP5onWWFG1cpfToLro+3LFFNZ8Q46TTvT0QXbWN+NNolzxsQaEPfht6B2c+KfcOCaiYq
 xMCbpLXdgPBOlGJt9/4DdBXjpMeZFrLdpmmushFjk=;
Received: from desk.s.smurf.noris.de ([2001:780:107::5])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1hD5SB-0007Ky-O5
 for wireguard@lists.zx2c4.com; Sun, 07 Apr 2019 12:55:11 +0200
Subject: Re: Multiple VPN connections on Android
To: wireguard@lists.zx2c4.com
References: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
 <911c5ed5-0bf8-80bb-cf15-7b2c6ee896fa@m7n.se>
 <d46cbe36-887a-d7ab-4daa-3aea02b78e8c@gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
 g+QSzodhGewsjufm
Message-ID: <07e3c2c2-bef3-2e72-da4a-3e6e063913e1@urlichs.de>
Date: Sun, 7 Apr 2019 12:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <d46cbe36-887a-d7ab-4daa-3aea02b78e8c@gmail.com>
Content-Language: en-US
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 07.04.19 12:37, Julian Orth wrote:
> If they insistet on generating the keys on their servers
> and sending me the private key

A VPN provider who does this obviously has no clue whatsoever, and thus
should not be used in the first place.

-- 
-- Matthias Urlichs

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
