Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D361C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 19:09:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6456C22240
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 19:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6456C22240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=patanne.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa145d27;
	Fri, 20 Nov 2020 19:03:46 +0000 (UTC)
Received: from mail-00.helpbox.biz (mail-00.helpbox.biz [207.245.78.62])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02537b1f
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 13:05:07 +0000 (UTC)
Received: from sc-mail-gw-06d6 (localhost [127.0.0.1])
 by sc-mail-gw-06d6.localdomain (Proxmox) with ESMTP id DBC8B3BE;
 Fri, 20 Nov 2020 08:10:06 -0500 (EST)
X-Footer: cGF0YW5uZS5jb20=
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Patrik Holmqvist <patrik.holmqvist@su.se>,
 "vh217@werehub.org" <vh217@werehub.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
 <665e0a8610984d938ab013ec2aac8517@su.se>
 <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
 <6c0c1208b52848bea8b1d0f1ac0dfa3a@su.se>
 <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
From: Patrick Fogarty <patrick@patanne.com>
Message-ID: <d2d82496-2a0b-30fe-d59e-f1af30c7f818@patanne.com>
Date: Fri, 20 Nov 2020 08:10:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 PostboxApp/7.0.37b3
MIME-Version: 1.0
In-Reply-To: <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Nov 2020 20:03:45 +0100
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

Jason

That method has the challenge of having to get a static configuration 
correct at the time of provisioning. A perfect example of when that 
won't work is during COVID. We have had client offices shut down, 
requiring us to migrate the VPN endpoint to a different office of the 
client. A machine in the field needs different configurations at that point.

You mentioned in a previous email you do not like the idea of allowing 
users to be able to change default routes. That was the reasoning behind 
requiring admin rights. Extremely valid point. With tools we have 
written in-house for matters unrelated to WireGuard we write them so 
config files cannot be loaded unless they are digitally signed with 
approved certificates, thereby allowing non-admins the ability to apply 
configuration files while on the road beyond our reach. It constrains 
what the user can do to what we distribute. The theory is, if we do our 
job correctly the user cannot hurt themselves. So far so good.


Patrick Fogarty


Jason A. Donenfeld wrote on 11/20/2020 7:52 AM:
> Hi Patrik,
>
> Why not provision the config for the users when you're provisioning
> the rest of the machine for their ownership?
>
> Jason
>



