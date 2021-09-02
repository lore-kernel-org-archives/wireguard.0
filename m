Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C2CC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:10:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD6560EE6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFD6560EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gugod.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46b682ca;
	Thu, 2 Sep 2021 04:10:16 +0000 (UTC)
Received: from mail.localhosting.tech (mail.localhosting.tech [66.70.129.155])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fbc1d429
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 04:10:12 +0000 (UTC)
Received: from mail.localhosting.tech (localhost [127.0.0.1])
 by mail.localhosting.tech (OpenSMTPD) with ESMTP id 5935bab0
 for <wireguard@lists.zx2c4.com>;
 Thu, 2 Sep 2021 06:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gugod.fr; h=date:from:to
 :message-id:in-reply-to:references:subject:mime-version
 :content-type:content-transfer-encoding; s=default; bh=3mrhsrUTO
 klnojk3yV6uNozSF+8=; b=uDpaiNjY5Lp1itV7UJ0tRxslP2o8G58I0ZiGQ/an9
 kK32EkJfUX34HY0SMztk23PpGpbc64rogVj3YFcsaKipEzC300GjGLsNdk3K4tHG
 AWFMKD9zic7GMXtdP7x4FZd5L53Zcxr/n7fLiYNVorPDKAVC4Y4CFrDw3vgXcInu
 K1wImFGZtWYkcOrzG09f+PGQH1m3EL3zVfAJ3kax+dnRtIYYEqPoWQ5nylnOkQdL
 Z2xgnTsXP/UfixB2bzeEgIHrWdI369EM/N/UdXyxecK+9XWd6kr4rZwp1z14+Lyz
 4ylKjOUNeG3/QMrcwgnLA+FAUququj3TC2V2+nQ75+lbw==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gugod.fr; h=date:from:to
 :message-id:in-reply-to:references:subject:mime-version
 :content-type:content-transfer-encoding; q=dns; s=default; b=hq/
 wH1rm+2s69BHmcRQEzX0/LinTI/urVE73Kd9Rm8Nvl3thSDhfrtnzCsjSizsbbCH
 clJ6O+WhyfugLhX67jDIe9iZNNwK+kodURUG5aMi0ieAaO279mYeiMfe3ITFePy+
 mthDLyrhgitF6SRXq3turEPzlTSoxnj/hOBEBIVJbTD9tHiNQzx+J2S5M3I8+oup
 f62+ozgkTfn4Egx7+r84634ItRapVm43Z6B5fSDBq8McElhA0C1MbKKTGhs9wpHf
 XdYKC/m9svcUN5J2L7HoJq/0z63B83bsLUbWDyisuEJBFh1UhpbretRMI+k4bP1D
 KdK508H5KyzQt7nXAKA==
Received: from dummy.faircode.eu (pop.92-184-100-250.mobile.abo.orange.fr
 [92.184.100.250])
 by mail.localhosting.tech (OpenSMTPD) with ESMTPSA id dd63681d
 (TLSv1.3:AEAD-CHACHA20-POLY1305-SHA256:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 2 Sep 2021 06:10:08 +0200 (CEST)
Date: Thu, 2 Sep 2021 04:10:05 +0000 (UTC)
From: Guy Godfroy <guy.godfroy@gugod.fr>
To: wireguard@lists.zx2c4.com
Message-ID: <12daa07c-f2c5-483c-9c64-7e9a51efd0c6@gugod.fr>
In-Reply-To: <CAJaZ5dPHbc5s=JiCbuBKAGf1Nb3vw0xL9W7_=Na4Skt_pjnWZw@mail.gmail.com>
References: <CAJaZ5dPHbc5s=JiCbuBKAGf1Nb3vw0xL9W7_=Na4Skt_pjnWZw@mail.gmail.com>
Subject: Suggestion for WireGuard
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <12daa07c-f2c5-483c-9c64-7e9a51efd0c6@gugod.fr>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I'm not implied in wireguard dev, but I thinks that wouldn't match wireguard mechanism. Indeed AllowedIP isn't only about routing, it is used to match a cryptographic fingerprint to a given IP. Also, having multiple peers containing such thing as DisallowedIP could lead to nonsense.

What don't you use the firewall to block the IP range instead?
