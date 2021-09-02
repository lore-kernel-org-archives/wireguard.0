Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421A9C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:54:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7249A610CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7249A610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afa24768;
	Thu, 2 Sep 2021 04:54:52 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 151aa5a0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 04:54:49 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id z7so459498qvi.4
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s94F0nM67Sd7Ad5kfK2Hhd46O/nHTqxNuGULVjGEpaA=;
 b=LND0gQmlSTRr36WScLRzAxb/VguaY0/wDIrH2mBZXdFNY6LEW6aELJAay6alw8b9sy
 Cx0cUPTb4rD6jiuF14KEZEdCQyC86KVqa5/t55/pBwwHHnDSf90UkKPU7OYtcX4n/uog
 MApADPmPLDV2s1pJjBBOLQIJkq1KqECkRI00Rhdr2Vlm4S0OgYYXBUQcvxp1TyNhMH28
 X6CcNGy6GTIZ8p/LUnyyRTxrKp5jxJUIp4NfwZakgBqwr7sgDyT+oOhJkqU8uxDv6Grm
 zKX3TEBfIrjzqLGjRxO+/wORTOCcnRToqX6CV4bPWW/2DaNqdSlBgpe3xr8VZhL2AV3s
 ltfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s94F0nM67Sd7Ad5kfK2Hhd46O/nHTqxNuGULVjGEpaA=;
 b=msXNVkmKX1mku0HKWBjOhO//GTlsR4WfTS+kJVIiQ9dxZfGf68cse2CeP5DuCQsQ4G
 Hxl+e+0N38k3cfRJuG2eHph+G7agdmSpuHhT3NNYzB4Gn3NYIsN6k/29z+OxN6CiHkMH
 Al7JEsuJx2dXe5o+lcMmauc1B/xEoO5WliwX4exKEwHtDnzmAp7uL3xnY/pTmAVzO5pI
 gVEFXLStZRIC7dndVPa5assSxwcgmlOIfZViRviPlCKcpecw1c4/1i37xr55zpu/vglb
 ZolaDKC0H7vkIc4H1t28huzxK/OujY2NI5isWUNUQPxZscQbeBvBohqExENUlREqNgoe
 Dm7g==
X-Gm-Message-State: AOAM533U48ZtwReWENX5mMmoSzjuakj7ycYqRZKxEV+lTnk9KPTiB5Dg
 JBhvbZzNISuTQ3JXVKaOALtvUfJ5vHhR2a6hkz4GLEvd4JIFf92syBw=
X-Google-Smtp-Source: ABdhPJwUGxaamkpck99MJqI8ulP4c000tdNRq1nT1d2zOsBspCPwQWMWV0BHVxeklj0PERvZqS2uzoy87OW3EpCz6/Y=
X-Received: by 2002:a0c:cc8f:: with SMTP id f15mr1402365qvl.47.1630558487985; 
 Wed, 01 Sep 2021 21:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaZ5dPHbc5s=JiCbuBKAGf1Nb3vw0xL9W7_=Na4Skt_pjnWZw@mail.gmail.com>
In-Reply-To: <CAJaZ5dPHbc5s=JiCbuBKAGf1Nb3vw0xL9W7_=Na4Skt_pjnWZw@mail.gmail.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Thu, 2 Sep 2021 12:54:21 +0800
Message-ID: <CAEK8JBBocnGRt7yFdVqm6Oou-UCYmtO26bzvB=YE7j9BDdjkTw@mail.gmail.com>
Subject: Re: Suggestion for WireGuard
To: Kassem Omega <kassemomega@gmail.com>
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

I have asked this question some months ago like you,
and don't get my answer, this is a workaround from me
to calculate the AllowedIPs, maybe can help you:
```
#!/usr/bin/python

import ipaddress

def address_exclude(rr, r1):
    out = []
    for r in rr:
        if r1.subnet_of(r):
            out += list(r.address_exclude(r1))
        else:
            out.append(r)
    return out

def calc_exclude(includes, excludes):
    includes_addr = [ ipaddress.ip_network(i) for i in includes ]
    excludes_addr = [ ipaddress.ip_network(e) for e in excludes ]

    for e in excludes_addr:
        includes_addr = address_exclude(includes_addr, e)
    strs = [str(i) for i in includes_addr]
    print("AllowedIPs = " + ",".join(strs))

calc_exclude(includes=['0.0.0.0/0'], excludes=['192.168.0.0/16', '10.0.0.0/8'])
```

I have asked this question here too:
https://www.reddit.com/r/WireGuard/comments/m44fi5/enhance_the_allowedips/

On Wed, Sep 1, 2021 at 9:50 PM Kassem Omega <kassemomega@gmail.com> wrote:
>
> Hi,
>
> I sent this before a couple of times to the mailing list but either it
> didn't go through or it is forbidden somehow? I never got any decision
> from the list moderator that it is forbidden to send suggestions at
> all. Hopefully someone can answer with anything.
>
> I was wondering if there is any chance of adding the opposite of
> AllowedIPs option to WireGuard?
>
> Currently, WireGuard has a whitelist option only that specifies which
> IPs to go through it, however I believe adding the blacklist option
> would be beneficial and easier to configure.
>
> The use case: allowing all traffic to go through WireGuard except
> specific ranges.
>
> Right now to do this I must use this long list of ranges to achieve this:
>
> AllowedIPs = 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4,
> 32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6,
> 172.0.0.0/12, 172.16.0.0/24, 172.32.0.0/11, 172.64.0.0/10,
> 172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9,
> 192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15,
> 192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8,
> 194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, 8.8.8.8/32
>
> However, if the DisallowedIPs option is available, I'd simply use:
>
> DisallowedIPs = 192.168.0.0/16, 10.0.0.0/8
>
> What do you think?
>
> Thank you.
> Kassem
