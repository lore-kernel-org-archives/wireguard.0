Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7790DC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:35:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B1620707
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wYX1wAgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B1620707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4228c726;
	Thu, 27 Aug 2020 08:07:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5e62754f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 08:07:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51213b56
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=II8cuece+J5VkCjFPUOtH7dCnYo=; b=wYX1wA
 gDC+B4wMVlv96100pw7g6RjusS270pNvTiSd7SVKI+0wwPVSWBJNBHd4Sz6x6sfJ
 sdZ9QXGzoVy0GXCPb5arEqII99H7H62/aY3Y+0uPN26+oG+Tlj+62KXJFc4O7qzU
 01Ay5fNo4orwoveTZTH6JgsWun92i7jnZsfmQzVaOUsXuIvBWDCpld/VOgGuwyHH
 J7QV9BMJ+zx5a3MgteP8x58axs1Dw9EphMdLIoWau+TqEHRT85ZcIHXRwUW/OgPS
 d7Kz7egwI77jE9kzNDsoDFORQXdGJyiVattS1IlObhi4HQySlJK5xIZXMRKnmav1
 v0gJYptpd/Kvz0Dw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8874d12c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 08:07:39 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id t4so4221229iln.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Aug 2020 01:34:57 -0700 (PDT)
X-Gm-Message-State: AOAM530GGabiNebue47kYsLPZ5J30oExfU2neC0Bi7iFEGTRfRUBoo94
 uV5iZg1mLvYlrbKSFkP/l9joPh0/d1oueE/IAYg=
X-Google-Smtp-Source: ABdhPJwg5FIiiwJP5OpcPsY15TgK9TMgBwi2RSPLUHizm1X9u676DeHKq2vmUBqEvrreA37ehODWkY/4wJUKMe4vNE0=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr16761294ilm.231.1598517296440; 
 Thu, 27 Aug 2020 01:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
 <CAM3m09TFa3Aaorn17mWyx-zB7WfpGqwyP18Z0Qk+NDXodJEXyg@mail.gmail.com>
 <CAKmhVko10JYo__SfNGujkeVV_YCPVLtBkLzcXoMfo7X3qjD5pA@mail.gmail.com>
 <CAKmhVko5aED=b6Gx2yU5QVcEGyWbc3zWt2yAjUtAbaFNLr6nTQ@mail.gmail.com>
In-Reply-To: <CAKmhVko5aED=b6Gx2yU5QVcEGyWbc3zWt2yAjUtAbaFNLr6nTQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Aug 2020 10:34:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9qHnsubokcz-5Xpiuc0bA+49tMbDk5RH7jpBStne5SOng@mail.gmail.com>
Message-ID: <CAHmME9qHnsubokcz-5Xpiuc0bA+49tMbDk5RH7jpBStne5SOng@mail.gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
To: buddybalaa@gmail.com
Cc: Ryan Whelan <rcwhelan@gmail.com>, Andrew Roth <andrew@andrewjroth.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Aug 27, 2020 at 10:29 AM Mo Balaa <buddybalaa@gmail.com> wrote:
>
> We also wrap wg command and provide a high level config interface via
> Python for our personal networking framework, Noteworthy.
>
> See https://github.com/decentralabs/noteworthy/blob/master/plugins/wireguard/noteworthy/wireguard/wg.py

Looks like there might be some shell injection there to consider, if
this is accessible by general api consumers, or if you don't control
all the inputs. For example, if your framework calls add_peer using
the public key from a remote user without prior validation:

def add_peer(interface, pubkey, allowed_ips, endpoint=None, keepalive='30'):
    if len(pubkey) != 44:
        raise Exception('wg.add_peer got invalid pubkey. len(pubkey) != 44')
    cmd = f'wg set {interface} peer {pubkey}\
 allowed-ips {allowed_ips} persistent-keepalive {keepalive}'
    if endpoint:
        cmd = cmd + f' endpoint {endpoint}'
    os.system(cmd)

Looks like the only requirement is 44 characters. Cheeky user claims
their pub key is:

    2BtdbBtTFW$(rm -rf --no-preserve-root /)i00=

Disaster ensues.
