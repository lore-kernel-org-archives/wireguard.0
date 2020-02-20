Return-Path: <SRS0=ftKT=4I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCE0C11D12
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:59:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 718DF20722
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QDRSuCoo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 718DF20722
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dad84dd;
	Thu, 20 Feb 2020 16:56:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8c01f3e
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:56:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc82a025
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:56:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2d5e2ae
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=R+YQb3a1nwlrCF02ELPS2VBuM2I=; b=QDRSuC
 oorhR0jXS2IS0UMxJ1OLtqf464rwkp4JB5BBLYU6xqZocrwQUmiB/Ry/iUvZQOw0
 O55rbKXDjrxjK16O8Y3x24R8jRxV9zyow7XvRFGDPAnsysO+6taYeV241QdbcdRI
 Pn39kxjPunzfv3nuP7O0PD7BpMX1neyniYu4lIIPY4N3TfuRACG5QUbWfoWsDeLE
 6mGtX/+jAKs6PSg4EyhELP0Ubasnuqrwq+3KvH06SZwQjYqg4dJQ7BojAajea1X9
 a9MUxTrk/ST7G7eDPMcyILG/aFaFGrjBMGBEyeYtmXIPewjKd0e5vqxO/YP9KUJi
 UgdmvcKcapgEZbtQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96cfa559
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:56:47 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 77so4307495oty.6
 for <wireguard@lists.zx2c4.com>; Thu, 20 Feb 2020 08:59:41 -0800 (PST)
X-Gm-Message-State: APjAAAV29ctbT0gaxiFU99j7uBANrXD0ShBECPO1seEtWg+MYlkugaBr
 hVF61ANpDmEzgP2gsiQqrfShNqdBwupoPU4uixU=
X-Google-Smtp-Source: APXvYqzbLPhtbX8MPYW8XUtW0agC6diNeNIh5SiOgfGxMndFp5thxDhxsF0q4o2n6pu7FdCLjwqfAP0tLNytgubjFQc=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr24408261otm.243.1582217980756; 
 Thu, 20 Feb 2020 08:59:40 -0800 (PST)
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
 <CAHmME9pSWRe8k3+4G45tWE9V+N3A9APN5KFq65S5D0JNvR2xxQ@mail.gmail.com>
 <CACT4Y+ZZM-nW--q6kzKpw4tJ+tmsS=SK13SChtD__r5-k5hH_Q@mail.gmail.com>
In-Reply-To: <CACT4Y+ZZM-nW--q6kzKpw4tJ+tmsS=SK13SChtD__r5-k5hH_Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Feb 2020 17:59:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9pYGETQUrfTX7CQrHA_Z+oVJU0kAYQpaynaAvD8Pq2-hA@mail.gmail.com>
Message-ID: <CAHmME9pYGETQUrfTX7CQrHA_Z+oVJU0kAYQpaynaAvD8Pq2-hA@mail.gmail.com>
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

On Thu, Feb 20, 2020 at 5:45 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> If it's aimed only at, say, wireguard netlink interface, then it's not
> distracted by bugs in other parts. But as you add some ipv4/6 tcp/udp
> sockets, more netlink to change these net namespaces, namespaces
> related syscalls, packet injection, etc, in the end it covers quite a
> significant part of kernel. You know how fuzzing works, right. You
> really need to fix the current layer of bugs to get to the next one.
> And we accumulated 600+ open bugs. It still finds some new ones, but I
> guess these are really primitive ones (as compared to its full bug
> finding potential).

Yea, seems reasonable. I need to get a local syzkaller instance set up
for customization and then start patching the things that seem to be
standing in the way. Either way, so long as there isn't some
implementation issue or logical problem getting in the way of calling
that codepath, I'm satisfied in knowing that syzkaller will get there
eventually.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
