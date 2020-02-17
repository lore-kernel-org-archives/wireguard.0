Return-Path: <SRS0=qhAm=4F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21BBC7619F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:44:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683A2206F4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uNiIDryE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 683A2206F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fa3fa39;
	Mon, 17 Feb 2020 11:41:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a322624
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:41:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fceab9c0
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:41:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20e21c3d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=wQXCNI9A2YUaaGUQfj7y9iUP5zk=; b=uNiIDr
 yEcK5YYCGrCJEAp+i8Pe4xhHWu90hFP00Pj1sjkRMpRpU6krYX+dvwCIBs8tjU1M
 KYz55GNxoLDsmsVzaqrOY4Dvl6v3wQkIBR/MRCvaS+IyUSaNfWpeSNUGxLXWKBcs
 07cAcSdH4DBcTzDB7T5VLvmvgkN1xtynItjPIo1qMKImgrDxeyLwEtXeZ4VROjES
 c6nl2AMO6n7TbitwwrGc0+9d3Ff1NGWngXu/IixkYyWxsxZfeQUkDMXSWQ2loJGT
 e6oaMpJpnBESzRMd8EIQ+gyZ4pPpL5gYLUeDuGECAhuCIdAHIcE7RjbYn7zqqJxd
 X7LXYjsYKgRy8X/Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73fdb72f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:41:49 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id z9so15777899oth.5
 for <wireguard@lists.zx2c4.com>; Mon, 17 Feb 2020 03:44:18 -0800 (PST)
X-Gm-Message-State: APjAAAVIMyMT8jlHBInfcU7TRBh8XB8D34kvpm3XjlTePuk5Z4GmByN8
 Jh7Ud8IcUNWS5PEYZWLU8ZI/U03o3+Y5uRgVUbM=
X-Google-Smtp-Source: APXvYqx/nE/SIdj6n88DX7WkMOWTXoc9LjwiMOkSC90rKZGFpSfr9MnZAvgN9CvPdc+XVc0yw0XHz+mACRWNCdb8yNA=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr11839173otm.243.1581939857444; 
 Mon, 17 Feb 2020 03:44:17 -0800 (PST)
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
In-Reply-To: <CAHmME9pQQhQtg8JymxMbSMgnhZ9BpjEoTb=sSNndjp1rXnzi_Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Feb 2020 12:44:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9or-Wwx63ZtwYzOWV9KQJY1aarx2Eh8iF2P--BXfz6u+g@mail.gmail.com>
Message-ID: <CAHmME9or-Wwx63ZtwYzOWV9KQJY1aarx2Eh8iF2P--BXfz6u+g@mail.gmail.com>
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

Observation:

It seems to be starting to synthesize packets sent to the wireguard
socket. These aren't the proper handshake packets generated internally
by that triangle commit, but rather ones that syzkaller creates
itself. That's why we have coverage on wg_receive, which otherwise
wouldn't be called from a userspace process, since syzbot is sending
its own packets to that function.

However, the packets it generates aren't getting very far, failing all
of the tests in validate_header_len. None of those checks are at all
cryptographic, which means it should be able to hit those eventually.
Anything we should be doing to help it out? After it gets past that
check, it'll wind up in the handshake queue or the data queue, and
then (in theory) it should be rejected on a cryptographic basis. But
maybe syzbot will figure out how to crash it instead :-P.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
