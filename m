Return-Path: <SRS0=qhAm=4F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6ACC35254
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:32:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB92D20836
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AWhL/54l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB92D20836
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3065d73a;
	Mon, 17 Feb 2020 11:29:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 950b2f06
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:29:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 700fce66
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:29:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cc6d956
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=J1+43o37F9mhaHojBDC95OYQLFE=; b=AWhL/5
 4ld6KebozTZWRdoRVEu0a3zfnCg1VyRQDaVowvnLKIzYIdUVpWi++8/SoJTfrD3x
 4Ka/OnGR2X7IluAD5oPwnBbuFzsnWTU8/Lv1bp2/ntiamN7oEL3L59DTQxUO2Hzx
 ojwwwZRP6KPVWPMTLh6DFSM188I8mUoP1R1UBNGhXRLUyS3cEuzZ5dsIz7HptiVy
 B/Sg15R11nGW6o770kmbAHpl9MGyxxmBM4bif0BOFvRviD4LMWhf+ZvM9LpwPkMd
 uXrzkFrk8LoERBkEYLYFkDqHHJHKfqvtoq+qNSxa3yR4cTdnZyfPRUuSriqDfpWE
 53ywzfhWzLn3/K5A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c3b660d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:29:42 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id b18so16383960oie.2
 for <wireguard@lists.zx2c4.com>; Mon, 17 Feb 2020 03:32:11 -0800 (PST)
X-Gm-Message-State: APjAAAXaYuutOWGqKYek57hZKAniVZMKdInkEpGZZrscDxtLukINKXF+
 Wg5NNGhrxwYAFwzL7Oy66dWpQ8nnYEO3fJTm90M=
X-Google-Smtp-Source: APXvYqzulskY2RmmruRAShaKIMl9ybJnU+9vP+Bvo4qvdtgOkMLDMcPcvWGmqCHiDnI9gknzPXsxXLGaNWkvAksvDSc=
X-Received: by 2002:a05:6808:29a:: with SMTP id
 z26mr4057224oic.122.1581939130169; 
 Mon, 17 Feb 2020 03:32:10 -0800 (PST)
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
In-Reply-To: <CACT4Y+bSBD_=rmGCF3mngiRKOfa7cv0odFaadF1wyEV9NVhQcg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Feb 2020 12:31:58 +0100
X-Gmail-Original-Message-ID: <CAHmME9pQQhQtg8JymxMbSMgnhZ9BpjEoTb=sSNndjp1rXnzi_Q@mail.gmail.com>
Message-ID: <CAHmME9pQQhQtg8JymxMbSMgnhZ9BpjEoTb=sSNndjp1rXnzi_Q@mail.gmail.com>
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

Hey Dmitry,

Yes! Our side discussions wound up getting everything pretty squared
away, and coverage on syzkaller looks pretty good to me. By inference,
I think we're hitting most code paths in WireGuard. Syzkaller, though,
is missing non-userspace-process coverage from:

- workqueues
- napi callback
- timer callback
- udp tunnel callback

Seems like there might be some future research to be done on how we
can track these. But tracking it or not, the fact that packets are
flowing on some path implies that other code paths are being hit. So I
feel pretty good about syzkaller's ability to dig up nice wireguard
bugs.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
