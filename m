Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF2BC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 09:08:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ea63d1fe;
	Wed, 1 Jun 2022 09:08:10 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2003707e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 09:08:08 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l84so1821363oif.10
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPRsmTcHUVbWGadgK9+cQbvqeNhDebVovlHWkAFI3+o=;
 b=blz8O3HO3Dl0/+qw7vD9szEgjcv1+UPXL/336a0jMy2uxKFqErvFX+3rF+j49mY5RA
 A5sq2Ub8rnGfuVzaslVQxc1z+WfOAyGkg5HocIBMuNV6CiOAp87VoMgrPN7/sGTI+2IF
 jE+U4+MR3Lp3iegR5WWuC7jJHj8fJrXhk378esejP3za/xDmsXyQWfTN+th/rIWixIGO
 zXgOdPcLhskAwfr4uSVIeVCDWxvcHF2o7ol8yvoEsIrOnBnr1d0aDUqHAFg5AsKbvsKi
 MWbJ+52s0Sa+Klc8Ev3fe5FoAIMgIpnBoP74SAyX/Q7ZUwILxVopJEJGqAKZo8MOq3uJ
 IGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPRsmTcHUVbWGadgK9+cQbvqeNhDebVovlHWkAFI3+o=;
 b=6eo4Hii+/T1iQmY7QOJ/0SID63r/SOWc3Xlwx5SHnzjcwaCToHiMEcWsTj7a8iW23K
 dryslrvyYsw2U6xSRlKzu84sDW9HUqD1ExumLCupqrVjwP3q0N1ZyxHFCQO3NGMHvjPg
 8fPMl8QaC8EgiumWZ6D4tCUJfB/A0trgAzbp/jFi+LJ5QFB4MKsEpp8A0IAvRzN3Qi/q
 1itCa18SpNeh2Z6sLc+XYHFpbOvf+8VZWl8g40pfUz+Wq7EiGbqKXC+sV5dVsYEtYkxR
 +i39o+aRmyXNRwxax1bMDwslhG0ax3ZB330u52lNoDr7DQRIIDsMBZPknTD4nhDCu3rg
 JqLA==
X-Gm-Message-State: AOAM5337PgMVfT0fOFxBN8KilBgTkiGJooJG65czLOhjLRD8pmupuE4j
 jNc0gVOyZxdwONMaOEEaUgyIt08Vw35gJdOdZ+eeswGI
X-Google-Smtp-Source: ABdhPJz8YGcG/o4OdL4tBAsz31oAHfI5gagUFH2h5mlMjfY11OhyEHe8tms3teyUZ+7jmSc83lt0uPQuvGUVUH8DSKk=
X-Received: by 2002:a54:438e:0:b0:2ec:ddab:c219 with SMTP id
 u14-20020a54438e000000b002ecddabc219mr14733292oiv.180.1654074487195; Wed, 01
 Jun 2022 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
 <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
In-Reply-To: <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Wed, 1 Jun 2022 10:07:31 +0100
Message-ID: <CABBZOs=kxe4DwHN=utdb8FzDTt3=TcSo05JVAo=-JCUjC_eEug@mail.gmail.com>
Subject: Re: How to improve Wireguard speed?
To: Janne Johansson <icepic.dz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Thanks for your reply.

I have run htop to observe the CPU consumption during this test, and
the CPU(s) go up only to 10-20%. So the CPU doesn't seem to be the
bottleneck.

I didn't change the MTU settings, but I have a suspicion about MTU. I
found this article here that makes some interesting suggestions to set
MTU to 1280: https://keremerkan.net/posts/wireguard-mtu-fixes/

And beyond that iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu





On Wed, 1 Jun 2022 at 09:51, Janne Johansson <icepic.dz@gmail.com> wrote:
>
> Den ons 1 juni 2022 kl 09:49 skrev Houman <houmie@gmail.com>:
> > Hello,
> > I'm compiling the latest stable Wireguard on Debian 11.
> > git clone https://git.zx2c4.com/wireguard-tools
> > make -C wireguard-tools/src -j$(nproc)
> > sudo make -C wireguard-tools/src install
> >
> > However the speed is not that impressive.  I have a VPS with 4 vCores
> > and 8 GB RAM on 1 Gbps network.  The VPS is located in London and so
> > am I.
> >
> > With wireguard enabled I get 117 Mbps
> > Without wireguard I get 506 Mbps
> >
> > That's a drop of 75%. What are the factors to improve the download rate?
>
> That seems like very poor values, I would make two tests, one local to
> the VPS and one test local to the other end (which you left out of the
> description) and see which one is the limiting box. People (including
> me) have easily gotten speeds at 1-2 gigabit on 10GE networked
> computers and VPSes and several gigabits on loopbacks, so the fault is
> not simply using wireguard.
>
> If you check the results of the nightly builds for x86_64 at
> https://www.wireguard.com/build-status/ you find several iperf3 runs
> that end up over 2-3 Gbit/s when a box is talking "to itself" so it's
> not the crypto or the tunnel that prevents you from filling up the
> gigabit link. Perhaps the VPS isn't giving you a lot of cpu? Perhaps
> the test reacts poorly to the lowered MTU for using (any) tunnel in
> between?
>
> --
> May the most significant bit of your life be positive.
