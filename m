Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC566C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 18:10:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d971e335;
	Sun, 19 Feb 2023 18:09:07 +0000 (UTC)
Received: from mail.as41281.net (mail.as41281.net [45.154.255.109])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8fa19011
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:09:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F8E9161407; Sun, 19 Feb 2023 19:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keff.org; s=dkim;
 t=1676830144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7TCMC/EsfnpRpbPpvFTD7bJGonURazeKA12h2kH/24Q=;
 b=puexns/nXWW195UQwSk6YxammAwBQD2eWJAwV1oaMGyNpz+T2zIxzJth4R52PnV38wrlyU
 cjbBv0KkMZuBQlTAEcMOg0m576+Urlz6MzbKREW0hI3do5Pj64LXku7U0SAolegx0i1yDL
 I2JjHLRh9UEZGIEkVpIg15g/SUm5R2Q=
Message-ID: <b234f06b-6d6b-7d52-c205-b80add684d6d@keff.org>
Date: Mon, 20 Feb 2023 01:08:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:110.0) Gecko/20100101
 Thunderbird/110.0
Subject: Re: Source IP incorrect on multi homed systems
To: Janne Johansson <icepic.dz@gmail.com>
Cc: wireguard@lists.zx2c4.com
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <00b94fdf-22d5-00ad-e068-30ad4a453236@keff.org>
 <CAA6-MF9q68pdBZDojmA+DOsH-WOckyv+J4jD+T6zBZot2Grz6g@mail.gmail.com>
Content-Language: en-US
From: Sebastian Hyrvall <sh@keff.org>
In-Reply-To: <CAA6-MF9q68pdBZDojmA+DOsH-WOckyv+J4jD+T6zBZot2Grz6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

It is the default behavior of the kernel. But all networking software 
dealing in security knows how to correctly behave. You are welcome to 
inform me of something else suffering the same problem.

On 2023-02-20 01:04, Janne Johansson wrote:
> Den sön 19 feb. 2023 kl 18:06 skrev Sebastian Hyrvall <sh@keff.org>:
>> You should get into that debate. Proposing firewall workarounds is not a
>> correct solution so please don't do it. It needs to be fixed. It's an
>> immature VPN solution that always just proposed a workaround instead of
>> fixing the problem.
> I would make sure that you are not mis-ascribing the problem* to "an
> immature VPN" and not what the default UDP behaviour of the kernel is,
> to pick a working interface to send packets from based on the routing
> table, in which any/all udp based tunnel would suffer the same
> problem. If you google it, you may find that other udp transports face
> the same "problem".
>
> *) https://en.wiktionary.org/wiki/Chesterton%27s_fence
>
