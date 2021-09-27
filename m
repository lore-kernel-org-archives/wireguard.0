Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27A0C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:14:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8185C60F9B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8185C60F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22697f91;
	Mon, 27 Sep 2021 16:14:47 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1e36e2e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 16:14:44 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id E81271FF81;
 Mon, 27 Sep 2021 18:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1632759284; bh=2xlohANDakGFAzb52t+LF+vsQQkgkM9w2yTxvqMZKXQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=OziKc9NsbkpSyLayx2X1+k9acdHtYSu+duDiw+XyoF4SvpCb8HlMIbRMyMN6gnHIk
 6jPWK2oJPDMRjRqcHQU7E9b9cHloEr9r7WHvh3aMfKT4BNpz1lK7NFTD+UZpYjK32m
 inLHQbNIzpEohr0uzO1Gg+n0uA2RDi7SE9B4w+XfgAZQQWKWrHXcQlFefLskyNFHQN
 1i7E7COMi0C7bI10R/GppmBPDcsZXcdOFepDc6wtiI6AuimQKovWrgByxj9KZOG05f
 MVjN4chQtbhT4CkDUsyEvsNOwnXkjHz9+e0wkKdSGEo0znTWUd3X/vVQqwJP7Darys
 9vbifD+1CJSdA==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 67A6F14CC28E; Tue, 28 Sep 2021 01:14:56 +0900 (KST)
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm> <20210927102157.GA23755@wolff.to>
 <d071a9ed-a1cf-4b4c-85ba-8a918a6e331a@www.fastmail.com>
User-agent: mu4e 1.7.0; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: StarBrilliant <coder@poorlab.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Date: Tue, 28 Sep 2021 00:59:19 +0900
In-reply-to: <d071a9ed-a1cf-4b4c-85ba-8a918a6e331a@www.fastmail.com>
Message-ID: <87tui6yozj.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


StarBrilliant <coder@poorlab.com> writes:

> On Mon, Sep 27, 2021, at 10:21, Bruno Wolff III wrote:
>> If your ISP is blocking your Wireguard traffic call them up and complain.
>
> All ISPs in China is blocking Wireguard traffic. If you call any of
> them up, you will end up in jail. There was a case where one user sued
> their ISP for blocking Google, and got prosecuted until disappear in
> public.
> [...]

Thanks a lot for the detailed explanation. While we have become a bit
off-topic (more of the why then the how) in regards to wireguard, I
think above explanation is important.

Wireguard's purpose is to be a secure VPN tunnel and I personally would
love if we can add "reliable" to its feature list. However that would
need more advanced support, like obfuscation is providing.

I'm not saying obfuscation is the only method, but compared to
a DPI with statistical analysis, I think we are pretty far away from
being reliable in hostile networks. Maybe extending wireguard with
obfuscation is out of scope of this project, but then it might be an
idea to wrap the wireguard traffic into other protocols.

I'm not sure how much wireguard depends on the IP/UDP layers, but
assuming it only uses it for payload, maybe it makes sense to
wrap wireguard into HTTP, HTTPS, SMTP (+TLS), IMAP(S) or even DNS
(slow). I am aware that there is a variety of tools out there that
handle some of the tunnel ideas.

Given that all of these approaches are actually rather trivial to
implement, is there any easy way to grab the outgoing wireguard packets
without the need of creating n artifical local UDP endpoints?

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
