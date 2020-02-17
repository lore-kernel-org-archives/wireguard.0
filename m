Return-Path: <SRS0=qhAm=4F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4A0C35254
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:20:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E052070B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 11:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="cQkWCF67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E052070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43b6db16;
	Mon, 17 Feb 2020 11:18:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 757a971c
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:18:24 +0000 (UTC)
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a639893d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 11:18:24 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w25so15829018qki.3
 for <wireguard@lists.zx2c4.com>; Mon, 17 Feb 2020 03:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vtEk6BMoDOa75uZF2dvETTN9doXpY8S/B4QNBM97qI=;
 b=cQkWCF67mFeGPyI18GnFrdj5zLeLRCMoD40S62zrimZx5w6WvXfCIIuuOLIQXpjIl2
 284Tlth7A/xFYQf894Dm/q2j1ZIN9dcab7l4/0MW1lcikMu0qyZ9chGRnTrED7rkXCLg
 Quw59wdq9/O52BIaMak2NmczzLLdiB67OzG3byRW5o2XtcAGyi3AcqaEq2HrXmW3htWO
 xliJllSvYCiZx9Ru+7reT5v33QbuqqxGl6feXDPWSEh0NJ4Akm4XsWUgs4f/bjSfy7bv
 D7KU8gNWjqGkWhWJ2ua2UXBoOybFxbFlpN0HcLdGr351mZ/ICi0UvmunOPWBcp4YPxe/
 Qqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vtEk6BMoDOa75uZF2dvETTN9doXpY8S/B4QNBM97qI=;
 b=BWd2kvpEnULMper5+7dwnBgHfAH6SIfY7xKLL6T2s0g9xmC0uSbihBKAXXTprmILGV
 PBGHR17t/cw7Y/wI3qa12ILK3k0wuK3RqHEli1IETQLOeiwV2dVccn+EIyOSR5rpNFh3
 ZIiSEch5YEGZFlxHsnQMzwXFGvStZzsIX98T84vHXC0XgpWjD8rO8gUzcqt5fcf8N4wl
 8/xX4ZydP6mxlKDWRRVm4WQxuzxe16+D07ZEeUP71Ju8B3CzkWIEZdXw3ckeAbn3dcak
 /UOO158y9F8TsnLpmqiF0GSDlhHskEB7nPeeAzPZgCKiFNVuFoAlH9uoKf7xFeaiOfkm
 MczA==
X-Gm-Message-State: APjAAAWtytKfk55CmzWFVhxT+B/ldaAfY8bzm7z74TnXdIYLcNYh8AhB
 YLRKNESiAdPd3b0xYThXVLdq9M4s9WmVoGAAOYzpPw==
X-Google-Smtp-Source: APXvYqyb0+vEBMZCzQWxoQ6Z12kWwkzmtrl2Ff+3PTHzPxn4VXstK81K7woVmWJatThIe8h1qHDCZJv6rIq4r+/FpNY=
X-Received: by 2002:a37:9d95:: with SMTP id
 g143mr13331274qke.256.1581938451698; 
 Mon, 17 Feb 2020 03:20:51 -0800 (PST)
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
In-Reply-To: <CAHmME9q3_p_BX0BC6=urj4KeWLN2PvPgvGy3vQLFmd=qkNEkpQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 Feb 2020 12:20:40 +0100
Message-ID: <CACT4Y+bSBD_=rmGCF3mngiRKOfa7cv0odFaadF1wyEV9NVhQcg@mail.gmail.com>
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

On Tue, Feb 4, 2020 at 10:39 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Dmitry,
>
> I see you got wireguard's netlink stuff hooked up to syzkaller.
> Excellent work, and thanks! It's already finding bugs.
>
> Right now it seems to know about 5 different keys you've come up with,
> and not much in the way of endpoints. I think we can improve this.
>
> For keys, there are a few cases we care about:
>
> 1) Low order keys
> 2) Negative keys
> 3) Normal keys
> 4) Keys that correspond to other keys (private ==> public)
>
> For this last point, if we just have a few with that correspondance
> quality in there, syzkaller will eventually wind up configuring two
> interfaces that can talk to each other, which is good. Here's a
> collection of keys you can use, in base64, that will cover those
> cases, if you want to add these instead of the current ones in there:
>
> 1)
> AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
> 4Ot6fDtBuK4WVuP68Z/EatoJjeucMrH9hmIFFl9JuAA=
>
> 2)
> 2/////////////////////////////////////////8=
> TJyVvKNQjCSx0LFVnIPvWwREXMRYHI6G2CJO3dCfEdc=
>
> 3,4)
> oFyoT2ycjjhT4v16cK4Psg+hUmAMsAhFF08IB2+NeEM=
> l1ydgcmDyCCe54ElS4mfjtklrp8JI8I8YvU8V82/aRw=
> sIBz6NROkePakiwiQ4JEu4hcaeJpyOnYNbEUKTpN3G4=
> 0XMomfYRzYmUA01/QT3JV2MOVJPChaykAGXLYxG+aWs=
> oMuHmkf1vGRMDmk/ptAxx0oVU7bpAbn/L1GMeAQvtUI=
> 9E2jZ6iO5lZPAgIRRWcnCC9c6+6LG/Xrczc0G0WbOSI=
>
> That's 10 keys total, which should be a decent collection to replace
> your current set of hard coded keys in there. You can unbase64 these
> into C format with commands like:
>
> $ echo '2/////////////////////////////////////////8=' | base64 -d | xxd -i
>   0xdb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
>
> The second thing is getting two wireguard interfaces to talk to each
> other. This probably should happen over localhost. That means the
> listen port of one should be the endpoint of the other. So maybe you
> can get away fuzzing these with:
>
> Listen ports:
> 51820
> 51821
> 51822
> [randomly selected]
>
> and
>
> Endpoints:
> 127.0.0.1:51820
> 127.0.0.1:51821
> 127.0.0.1:51822
> [::1]:51820
> [::1]:51821
> [::1]:51822
> [randomly selected]
>
> Finally the "allowed ips" for a peer, the routing table entry that
> points to wireguard, and the packet that's being sent, should all
> somehow correspond. But probably an allowed ips of 0.0.0.0/0 will
> eventually be fuzzed to, which covers everything for the first part,
> so let's see if the rest falls into place on its own.
>
> What do you think of all that?
>
> Jason

Hi Jason,

[getting through backlog after a tip...]

I think you addressed all of this by now, right? And we got decent
coverage of wireguard. Anything else low hanging left?

https://github.com/google/syzkaller/commit/2c71f1a9122cc3cb0abacbbec6359c40db02be35
https://github.com/google/syzkaller/commit/4d1ab643be2091f794ec55d83ec8acf7b0a60be3
https://github.com/google/syzkaller/commit/c5ed587f4af5e639f7373d8ebf10ac049cb9c71b

Thanks!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
