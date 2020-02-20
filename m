Return-Path: <SRS0=ftKT=4I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB70C11D05
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:34:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85902206F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qrOCKkX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85902206F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1ffdfcc;
	Thu, 20 Feb 2020 16:31:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8606fb23
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:31:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c14dd74
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:31:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02de916c
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=yVRwtw6kJ2XMj4V4P4PtGVoDGHo=; b=qrOCKk
 X43atkuXWccjJkbr1AotsRzCugYKFhmNCFSaq4qcA2vly9ebxRoldh8h494xJqgd
 Q9CoLl/rnxqa9+sOw9KsEfvIzGLPRlL3hUVQsazYzIVjU7sZj2FctYXeKFeqdw/4
 DI23z6ZAMW9Zd/etZ8PyeQFT72wGiloRZYyL/MXMySEQ7QgrwlpYvCPKyPWWNn12
 48w7XGIp9+3WC2cMoQWTVudEptypFmuInX2Y/EJdyd8E6yxyHIR49ppr5Hv0I+vP
 dKWODFPM5LRYqO7ZO3gVKKOnfQeuXnmBlwpXeUqHg2SpawJvXziOTMuwP8pexmDY
 HA2qitAmXOJJcg+A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 635874bc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:31:08 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 59so4194027otp.12
 for <wireguard@lists.zx2c4.com>; Thu, 20 Feb 2020 08:34:02 -0800 (PST)
X-Gm-Message-State: APjAAAXFsMzsiE7ZUYJZAnSA/uEdCZrsGGZVd5dr4zND1bKOf0f/L4I9
 W813MIt5df67XLPxHLxpKGN7QQQPx5aKi/tJJkw=
X-Google-Smtp-Source: APXvYqx67ijbk1qY5//CpLPjuvRXVaxderY03uVmgvQgZGG1qigqoqpBarBdWMHoaZ6HYLw8NP1LifBzpfirR9gbJZQ=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr24978732otm.179.1582216442024; 
 Thu, 20 Feb 2020 08:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20191208232734.225161-1-Jason@zx2c4.com>
 <CACT4Y+bsJVmgbD-WogwU=LfWiPN1JgjBrwx4s8Y14hDd7vqqhQ@mail.gmail.com>
 <CAHmME9o0AparjaaOSoZD14RAW8_AJTfKfcx3Y2ndDAPFNC-MeQ@mail.gmail.com>
 <CACT4Y+Zssd6OZ2-U4kjw18mNthQyzPWZV_gkH3uATnSv1SVDfA@mail.gmail.com>
 <CAHmME9oM=YHMZyg23WEzmZAof=7iv-A01VazB3ihhR99f6X1cg@mail.gmail.com>
 <CACT4Y+aCEZm_BA5mmVTnK2cR8CQUky5w1qvmb2KpSR4-Pzp4Ow@mail.gmail.com>
 <CAHmME9rYstVLCBOgdMLqMeVDrX1V-f92vRKDqWsREROWdPbb6g@mail.gmail.com>
 <CAHmME9qUWr69o0r+Mtm8tRSeQq3P780DhWAhpJkNWBfZ+J5OYA@mail.gmail.com>
 <CACT4Y+YfBDvQHdK24ybyyy5p07MXNMnLA7+gq9axq-EizN6jhA@mail.gmail.com>
 <CAHmME9qcv5izLz-_Z2fQefhgxDKwgVU=MkkJmAkAn3O_dXs5fA@mail.gmail.com>
 <CACT4Y+arVNCYpJZsY7vMhBEKQsaig_o6j7E=ib4tF5d25c-cjw@mail.gmail.com>
 <CAHmME9ofmwig2=G+8vc1fbOCawuRzv+CcAE=85spadtbneqGag@mail.gmail.com>
 <CACT4Y+awD47=Q3taT_-yQPfQ4uyW-DRpeWBbSHcG6_=b20PPwg@mail.gmail.com>
 <CAHmME9q3_p_BX0BC6=urj4KeWLN2PvPgvGy3vQLFmd=qkNEkpQ@mail.gmail.com>
 <CACT4Y+bSBD_=rmGCF3mngiRKOfa7cv0odFaadF1wyEV9NVhQcg@mail.gmail.com>
 <CAHmME9pQQhQtg8JymxMbSMgnhZ9BpjEoTb=sSNndjp1rXnzi_Q@mail.gmail.com>
 <CAHmME9or-Wwx63ZtwYzOWV9KQJY1aarx2Eh8iF2P--BXfz6u+g@mail.gmail.com>
 <CACT4Y+a8N7_n4t_vxezKJVkd1+gDHaMzpeG18MuDE04+r3341A@mail.gmail.com>
 <CACT4Y+atqrSfZuquPZcRUKNtVbLdu+B5YN3=YmDb38Ruzj3Pzw@mail.gmail.com>
 <CACT4Y+bMzYZeMvv2DdTuTKtJFzTcHhinp7N7VmSiXqSBDyj8Ug@mail.gmail.com>
 <CACT4Y+bUXAstk41RPSF-EQDh7A8-XkTbc53nQTHt4DS5AUhr-A@mail.gmail.com>
 <CAHmME9pr4=cn5ijSNs05=fjdfQon49kyEzymkUREJ=xzTZ7Q7w@mail.gmail.com>
 <CACT4Y+aTBNZAekX_D+QdofqBdUuG9BkzLq+TFDxr8-sSqL9hdQ@mail.gmail.com>
In-Reply-To: <CACT4Y+aTBNZAekX_D+QdofqBdUuG9BkzLq+TFDxr8-sSqL9hdQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Feb 2020 17:33:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9pSWRe8k3+4G45tWE9V+N3A9APN5KFq65S5D0JNvR2xxQ@mail.gmail.com>
Message-ID: <CAHmME9pSWRe8k3+4G45tWE9V+N3A9APN5KFq65S5D0JNvR2xxQ@mail.gmail.com>
Subject: Re: syzkaller wireguard key situation [was: Re: [PATCH net-next v2]
 net: WireGuard secure network tunnel]
To: Dmitry Vyukov <dvyukov@google.com>
Cc: netdev <netdev@vger.kernel.org>, syzbot <syzkaller@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Dmitry,

On Thu, Feb 20, 2020 at 5:14 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> I got some coverage in wg_netdevice_notification:
> https://imgur.com/a/1sJZKtp
>
> Or you mean the parts that are still red?

Yes, it's the red parts that interest me. Intermixing those with
various wireguard-specific netlink calls and setting devices up and
down and putting traffic through those sockets, in weird ways, could
dig up bugs.

> I think theoretically these parts should be reachable too because
> syzkaller can do unshare and obtain net ns fd's.
>
> It's quite hard to test because it just crashes all the time on known bugs.
> So maybe the most profitable way to get more coverage throughout the
> networking subsystem now is to fix the top layer of crashers ;)

Ahhh, interesting, so the issue is that syzkaller is finding too many
other networking stack bugs before it gets to being able to play with
wireguard. Shucks.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
