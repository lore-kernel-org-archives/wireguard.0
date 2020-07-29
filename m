Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FB1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1EA206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vUANqYdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E1EA206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 731c820b;
	Fri, 31 Jul 2020 13:51:28 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a6cd049
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 16:04:25 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id j10so4447038qvo.13
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pu02erbbj0lzg6up/CStgcZBhvNEOvbcTYJTCPp1PAk=;
 b=vUANqYdRgtN842k1Mlo0lYQv+Z4yjYRCqLhHCyPxz9Ny/57tQFQBNeWUjhV45mjDh2
 TPmHjhCZJFfiPNE0Y527FeQisV6SVzEDATpsxjXd5qQ202u510hi2J59xaPN3qzbJxTs
 jLnPnTyynkMjsp+oG9KkvNirRfN2J4Y6pWdoMu+N2iIx79OzM1qqOMQpmVAJOtHG3XO9
 MhTKjlhwmPHTVgFekGRApim7yXsEsFDbARia7Squ+UbTG5DaltRpsrgOQ4doJRnrAipI
 glArgNbojaNV2pXNzl5mw2rmva8ybjC8cBuE/rQombwzerNFJB4VmE4HGrMFiTvtbYZt
 lBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pu02erbbj0lzg6up/CStgcZBhvNEOvbcTYJTCPp1PAk=;
 b=MaM3qGrH4FJU/Iy/y+1DFx5SfE7cbO53Okd5qPM05+fOyIrIKnAZsIqQXME2YcVtmP
 tDlbaY6Tkc1OCK482zcJC9EDRSRESHJ0ktrbrQUzKEHAj3A+v3OqfhG/j+hBfs5NK3iE
 RsIpK7qFrVeRs1B5hhOC0PzaRx7LCHOMoCrR112PC3+8Vn9BQgLQpn5j9I3yjFHO9+XG
 JHzbDPPalLJxcPJJbAXyfMuYzqs936V8oUu1+z6t4XuvVuCdSCow2rRO/9kZpx1dx5bu
 Y8ek/3HzOEET46oTENXBMXpUs3tf/MIQ4LjyXc51TEDFDqspDx/LXfoNRTcqT5GvXpeZ
 Wryg==
X-Gm-Message-State: AOAM533PmqZflJ3tjO9E8nUtA1n37GK0e7k4OXY8EGV4zgA8eh2PM39U
 UiUIP7f3g2bpZiotOjMo1RqmsrVMjtI=
X-Google-Smtp-Source: ABdhPJx2V5Z/e3gLVnhu+MEXCJ9J/l3WcATvQip0d1t3HhHXUNKGKBmmMH3Bz52tPymBxQMHBomW+w==
X-Received: by 2002:a0c:c787:: with SMTP id k7mr33729643qvj.234.1596040080007; 
 Wed, 29 Jul 2020 09:28:00 -0700 (PDT)
Received: from [192.168.2.245]
 (76-253-187-197.lightspeed.rlghnc.sbcglobal.net. [76.253.187.197])
 by smtp.gmail.com with ESMTPSA id k25sm2104663qtp.72.2020.07.29.09.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 09:27:59 -0700 (PDT)
Subject: Re: Confused about AllowedIPs meaning?
To: M Rubon <rubonmtz@gmail.com>, Rich Brown <richb.hanover@gmail.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>, wireguard@lists.zx2c4.com
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
 <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
 <CAJ24mqCQ+jyzZ13ji+z31-=Rj1rfBrLDtq1bZMAMO+rgsxKXCg@mail.gmail.com>
From: Gunnar Niels <gunnar.s.niels@gmail.com>
Message-ID: <e5953067-a158-0a64-b6a0-1602d8fd22d0@gmail.com>
Date: Wed, 29 Jul 2020 12:27:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ24mqCQ+jyzZ13ji+z31-=Rj1rfBrLDtq1bZMAMO+rgsxKXCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Jul 2020 15:51:20 +0200
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

On 7/29/20 12:11 PM, M Rubon wrote:
> AllowedIPs  — a comma-separated list of IP (v4 or v6) addresses
> with CIDR masks which are allowed as
>         destination addresses when sending via this peer and are
> allowed as source addresses when receiving via this peer.

+1, the man page definition you cited is somewhat ambiguous; this is a more
explicit definition that clears up the ambiguity.

I really appreciate all the responses, it's been very helpful. I've waiting on
the hardware I've selected to ship before deploying the suggestions. I'm planning
on using a pfsense default gateway for both networks and running RPi 4s
with static addresses on both subnets as wireguard gateways between the two nets
(they have gigabit NICs which is a nice upgrade over my older 3s, especially
for this use-case). From some of the PFSense community discussions, it doesn't
look like they're ready to accept an official wireguard plugin, although there
are some community contributions.

I will report back after I've my hardware has arrived and I've had some time to
tinker.

-GN

