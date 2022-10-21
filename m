Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261EC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Oct 2022 14:16:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 45e79f57;
	Fri, 21 Oct 2022 14:13:13 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4028ddd6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2022 14:13:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso305544pjc.0
 for <wireguard@lists.zx2c4.com>; Fri, 21 Oct 2022 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OT9JHCmWrhftekjFMugTUoF7ewd2UoXgNsC0AxDlqKI=;
 b=KkP939tAV4sdW2O/tnIJdmnIiaWJNlpS7WqXumtQNaiW8dOGhFDY2t4M0JOnhh+Maf
 vKTkKJqalFZFQ7DzOJVdsQ8SLipDcrA6qc3+i6CZNrVmyrrqwES955gXQJ17tHHYVBrh
 yl5pTJ+3cm0ykC4NL+ytRHhEprEvJqzEArs9cofCLLyRSGPZwdr9LqJUk8BJ8AXIxoam
 mUrhFjdNehlf7+CR+1VrhJBl6eYN7jX9pvj39dse1Jh5C4DK3PPTATX4Cfsztiae56JO
 vGKG3hEQw/084kR4BsUEd7iw94DS1MdKmWAo7Q504Gowh1FFSbrk/Z69buzihsDaZ2eq
 46kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OT9JHCmWrhftekjFMugTUoF7ewd2UoXgNsC0AxDlqKI=;
 b=cCcuhWv8s3fM4prfsnXEIQW9De6tQObUcWAg8QJFEqhn8cMVZRgvPKoVM1iAMLo+aH
 Dt/NTZYi7VnruE+FuPWdRjPfpd3/eRf1slUNpdS0gwNFNgFcaja9LXxAXXkOfKRkPVgB
 BbV0Mh+QBfAvHCV7G3DNNtH60BtlReZRQ8lXGAq3jP/WZbRgNBCCuDOawH7CqNIw6jK+
 yUJOuFq2XNzQY/UHcGANqw8wXVkdzrsM3ws+3kqqEEk3hDZPN1ze9Z6s9AyEeKox9exo
 GzFopRyDASVA/cFskG/WaTyRaEmz+hpPLwsvCU7oB60OgEzgvea0K+U9cpF2+xl9i07z
 Fe2g==
X-Gm-Message-State: ACrzQf0tXDAwoO2tho7HCzqG8LszFNmGM4QAgd8Kqod533bJJ2+ah7Sw
 3NSlyv5yPs2qXq0/RWfw4x544pQi0LnnaJyRWTQ=
X-Google-Smtp-Source: AMsMyM6UH3mGhVfppmdr+v51XfN0bGd7L5g1rfkopw9yYxXL7Zjn5ogE6lpZPz06LR7zvgczAYsQpVvHjF+hIK7pABQ=
X-Received: by 2002:a17:902:7585:b0:182:57fa:b9c4 with SMTP id
 j5-20020a170902758500b0018257fab9c4mr19761140pll.104.1666361589279; Fri, 21
 Oct 2022 07:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACu-5+0Z1JPCttbZpM13870N9Wce8K3V2ZRdhV6XFmVk4FJKxQ@mail.gmail.com>
 <60b5d439-e117-f3c7-3a6b-8ce46bc48fc2@chil.at>
 <19530c0e-6e5e-f47c-8490-8338512f2cb2@chil.at>
 <e460fec5-3c8f-fafc-4a08-e739be1cf5c5@chil.at>
 <CAA6-MF_AKBUPv9KzeUa2XoxR3m2YARuwtME+Vr_q8pg5NWpubQ@mail.gmail.com>
In-Reply-To: <CAA6-MF_AKBUPv9KzeUa2XoxR3m2YARuwtME+Vr_q8pg5NWpubQ@mail.gmail.com>
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Fri, 21 Oct 2022 22:12:58 +0800
Message-ID: <CACu-5+1_7MC5qxw86azNipP5WJwEz003wPEaz2mmY1Gqs9Y2xw@mail.gmail.com>
Subject: Re: Source IP selection or multi-home or multi-interface issue -
 solved with source-based route - was: Re: Wireguard source ip selection issue
 with multi interfaces
To: Janne Johansson <icepic.dz@gmail.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,
Actually, I've hacked the wireguard source code by myself months ago,
and it's working as expected on openwrt with mwan3.
See details and the last hack patch on my github issue:
https://github.com/openwrt/packages/issues/9538
As I said on the issue, the problem is wireguard always reset the
incoming ip and ipmark, and then select the source ip from main
routing table.

Janne Johansson <icepic.dz@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=BA=94 21:27=E5=86=99=E9=81=93=EF=BC=9A
>
> > "How should wireguard know which IP is the correct source IP address?"
> >
> > I digged into the source code but couldn't find the part where the sour=
ce-IP is selected for outgoing connections (like a simple ping).
> > I am not a developer but would like to try to understand it. Could some=
one give me a pointer?
>
> I think it is left to the OS and it's tcp stack to pick the ip (and
> interface) based on the UDP destination ip and the current routing
> table when sending udp packets.
>
> --
> May the most significant bit of your life be positive.
