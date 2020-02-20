Return-Path: <SRS0=ftKT=4I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41E8C11D0F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:45:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A873207FD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Feb 2020 16:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="PikFMO+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A873207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf3140aa;
	Thu, 20 Feb 2020 16:42:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0584c5b9
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:42:12 +0000 (UTC)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bc19db9
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 16:42:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a141so4154188qkg.6
 for <wireguard@lists.zx2c4.com>; Thu, 20 Feb 2020 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGm+UKWx6ZF2qNYZ46/Lq5NNTT/chvIPYcorvsXdNuU=;
 b=PikFMO+0eiRF3K1xcv/08g+Zu7hxosSNnpCQQ0556QO0UO/RQJmOcH35kMc8Dr8kvh
 VICtlz8PT29aaFB9ASgwemvgzhOeuDsWTpi8cTuoNx1uNejeB6BNz3IAMXzfWCQiPkYi
 t5GvKuiAjhsNs62ZM9Q8vohsA8tEf4bCOKKwmFUkcu2KfOiVVxR4Qn6pUC1IzDZpH6Fm
 uvgHinxW9Ifq371RINhqO7BqiJFVBfJq7sTpOPK3vtvAgIFHHK9N82DYzQdTPvzTdaX5
 Op5L9yqRKGLqPrmQL3x4+fRGmsvitWFtMAnmujx5/HPQGabJlxRd8f+SwTemukDeJ3Yf
 WBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGm+UKWx6ZF2qNYZ46/Lq5NNTT/chvIPYcorvsXdNuU=;
 b=mQyIt7s6dvwOZAXPixcfY+WyBWHrFqqUXnXdgq29dyh8sp4OihZodsqV6bX+bztUy4
 UFiDQUXU/dLANad5684x5q08TDCDdksx4CS7T4+BUGP6vQ6Bb0x2bDco7XfQmM1IPo0a
 x8I8E/kdR+Hg+nI6BzgGMwaw/GyU3mGn+y5lje6k8U0xSWnbP8BHIchUK//VG+KNeVaW
 F4rk2LdPbuFMzSGFS+VPAznbsb9JL01uWiaZs8get2WvD2nQK/aFtaZiUcjh1ohya67G
 ysUvA3Mz5mSr36UCYetrDtKUSS/LHDl3AeqkSdiMETxz4mP31VtLvb5rgBaw8jbm4mtx
 lFBg==
X-Gm-Message-State: APjAAAUWksJ76eLN9/nBYE6HZwKbwArP3+I+4O7aPlkjLvziR/UK/Txw
 j/qPKNP3JpvV0Y/B7P8zvELC0O7jOEbbID+RhbHiANqqR9g=
X-Google-Smtp-Source: APXvYqzM8HDfBAB2xZqnGvzOg2b9sY1jGLIVJKJiXzpptOYMkx0twIr+yw/ee8edtEpULxErHHiPBY3txfmStT/BoyY=
X-Received: by 2002:ae9:e003:: with SMTP id m3mr8593858qkk.250.1582217105020; 
 Thu, 20 Feb 2020 08:45:05 -0800 (PST)
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
In-Reply-To: <CAHmME9pSWRe8k3+4G45tWE9V+N3A9APN5KFq65S5D0JNvR2xxQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 20 Feb 2020 17:44:53 +0100
Message-ID: <CACT4Y+ZZM-nW--q6kzKpw4tJ+tmsS=SK13SChtD__r5-k5hH_Q@mail.gmail.com>
Subject: Re: syzkaller wireguard key situation [was: Re: [PATCH net-next v2]
 net: WireGuard secure network tunnel]
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Thu, Feb 20, 2020 at 5:34 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Dmitry,
>
> On Thu, Feb 20, 2020 at 5:14 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > I got some coverage in wg_netdevice_notification:
> > https://imgur.com/a/1sJZKtp
> >
> > Or you mean the parts that are still red?
>
> Yes, it's the red parts that interest me. Intermixing those with
> various wireguard-specific netlink calls and setting devices up and
> down and putting traffic through those sockets, in weird ways, could
> dig up bugs.
>
> > I think theoretically these parts should be reachable too because
> > syzkaller can do unshare and obtain net ns fd's.
> >
> > It's quite hard to test because it just crashes all the time on known bugs.
> > So maybe the most profitable way to get more coverage throughout the
> > networking subsystem now is to fix the top layer of crashers ;)
>
> Ahhh, interesting, so the issue is that syzkaller is finding too many
> other networking stack bugs before it gets to being able to play with
> wireguard. Shucks.


If it's aimed only at, say, wireguard netlink interface, then it's not
distracted by bugs in other parts. But as you add some ipv4/6 tcp/udp
sockets, more netlink to change these net namespaces, namespaces
related syscalls, packet injection, etc, in the end it covers quite a
significant part of kernel. You know how fuzzing works, right. You
really need to fix the current layer of bugs to get to the next one.
And we accumulated 600+ open bugs. It still finds some new ones, but I
guess these are really primitive ones (as compared to its full bug
finding potential).
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
