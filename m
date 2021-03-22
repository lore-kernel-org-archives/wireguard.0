Return-Path: <SRS0=HpKU=IU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B407C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 17:44:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2EB26023B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 17:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2EB26023B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3b80861;
	Mon, 22 Mar 2021 17:44:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 041287fb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Mar 2021 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616435047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yyOUFmLi1W94h2rcwz0pfhCHOaGVdHdSY+yWR7Y39Bs=;
 b=bS9uydZNOUUiF7RcOMRnj7NaRK6UoDnJrjLn8dc+K8f88g+6fedoRrGgp641q3Hg5DflEm
 IgWNlgyJZ5mDfgz7py33Uj2f/MM3EGJ+pyTX9lwLajsvylZ9MjNxfJEflyrJil9RsIDUKT
 USTaom1+tc65gH8NicqVk1X0Fm8L9PM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7550b283
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Mar 2021 17:44:07 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id g38so7461748ybi.12
 for <wireguard@lists.zx2c4.com>; Mon, 22 Mar 2021 10:44:07 -0700 (PDT)
X-Gm-Message-State: AOAM533pOn+z2TH91BLu7J30vfurq0Yop4325ZznVyffRi807A4aaq/w
 XPrKH69uh4gGu3C5RrhjPnndCW0e7ROZc5UBzOI=
X-Google-Smtp-Source: ABdhPJzJPPpZ0rb5mpSomszyZkKZxgxB6valQyrpd7gTtt+okKTTBirPgxSdpOYYTDlrbH31qI836D//DXZMawFh3Ik=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr833762ybo.279.1616435047110;
 Mon, 22 Mar 2021 10:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
In-Reply-To: <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Mar 2021 11:43:56 -0600
X-Gmail-Original-Message-ID: <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
Message-ID: <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Mar 2021 17:44:20 +0000
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

Hi Frank,

On Sat, Mar 20, 2021 at 11:15 AM Frank Behrens <frank@harz.behrens.de> wrote:
>
> Hi Jason,
>
> thanks for your response.
>
> Am 19.03.2021 schrieb Jason A. Donenfeld:
> > In other words, you have push access to all branches beginning with fb/ .
> That works, thanks. Meanwhile I pushed my branch to fb/fib.
>
> > Right now we have the `wg set wg0 fwmark ...` mapped to
> > SO_USER_COOKIE, as I'm sure you saw there. But maybe FIB would be a
> > better thing to use for that? We could adjust wireguard-go to do the
> > same with the tuntap ioctl.
> I believe we have different, orthogonal things:
>
> 1. The selection of routing table (fib) for received, decrypted packets.
> -> Already implemented in wg_deliver_in() #2098 and controlled
> by "ifconfig wg0 fib 1"
>
> 2. The selection of routing table for outgoing, encrypted packets.
> -> That is addressed by my patch and controlled by
> "ifconfig wg0 tunnelfib 1". Maybe wg(8) should receive also
> an option for that purpose, if other OS use equivalent functions.
>
> 3. The setting of special marks, useable in packet filter/firewall
> processing. I guess, that is the meaning for "wg.. fwmark". I'm not
> sure, how best to implement that for FreeBSD. For ipfw(4) there is some
> functionality using socket cookies, as already implemented. For pf(4)
> packet filter the documentation mentions mbuf_tags(9). Apparently
> we need some input from a FreeBSD packet filter developer.

It looks like user_cookie is independently useful for use in ipfw, so
I'll keep fwmark mapped to that. But your tunnelfib patch is _also_
useful, so I'll apply this patch.

Some bugs/questions, though:

+static void
+wg_socket_setfib(struct wg_softc *sc)
+{
+ struct wg_socket *so = &sc->sc_socket;
+ struct socket *so4, *so6;
+ struct sockopt sopt;
+ int rc;
+
+ so4 = atomic_load_ptr(&so->so_so4);
+ so6 = atomic_load_ptr(&so->so_so6);

These are epoch-protected members. So the line above that should have
NET_EPOCH_ASSERT().

+ if (so4) {
+ rc = sosetopt(so4, &sopt);
+ MPASS(rc == 0);
+ }
+ if (so6) {
+ rc = sosetopt(so6, &sopt);
+ MPASS(rc == 0);
+ }

Rather than MPASS, this error should be passed back to the caller and
reported back to userspace, in the same way that we account for errors
with socket binding.

+ case SIOCSTUNFIB:
+ if ((ret = priv_check(curthread, PRIV_NET_SETIFFIB)) != 0)
+ break;

This priv check should be relative to our stored creds that control
the socket right? There are some jail considerations to think about
here.

+ if (ifr->ifr_fib >= rt_numfibs) {
+ ret = EINVAL;
+ } else {
+ sc->sc_fibnum = ifr->ifr_fib;
+ wg_socket_setfib(sc);
+ }

There are two ways to implement this. Either we check for 0 <= ifr_fib
< rt_numfibs, and then directly assign it to so->so_fibnum, like we do
for user_cookie, and avoid sosockopt. This sounds simplest and I
wouldn't mind doing that. Or we use sosockopt, but the bounds testing
remains in sosockopt and not duplicated here, and we rely on
wg_socket_setfib bubbling the error back up. Let's pick one of these
approaches, rather than combining them.


struct wg_softc {
LIST_ENTRY(wg_softc) sc_entry;
struct ifnet *sc_ifp;
int sc_flags;
+ u_int sc_fibnum;

Shouldn't this be added to `struct wg_socket`, alongside the
so_user_cookie member there, and managed in the same way?

Jason
