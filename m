Return-Path: <SRS0=oAv7=3Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1004FC35247
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:40:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3ADA2084E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3F+wGaXX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3ADA2084E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 245c0a50;
	Tue, 4 Feb 2020 21:38:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ebf3a41
 for <wireguard@lists.zx2c4.com>; Tue, 4 Feb 2020 21:38:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4300c7b2
 for <wireguard@lists.zx2c4.com>; Tue, 4 Feb 2020 21:38:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29b4cb48
 for <wireguard@lists.zx2c4.com>; Tue, 4 Feb 2020 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=IA9BgkXO4y1tj4ir/uT+L2i2M1Y=; b=3F+wGa
 XXKEaSC3rxCiikRLwYrLGz2HVfKcRFAtSpmC/EE2tIUCvw6Jt/3VgHlacgfoEgiq
 cdoIEXBCTMOjDumWyO4IG5fkM4tYFhenl8e8hrzl1OVzCeL7vmaM+FvfudV6iCdm
 ZhoJ3Mb6RI1cMLKVQh0AKk0xudQ7CNxwExkn8CHpqQZeYJB0g23WPlqdTTsCaZr9
 25qt/F+VLG1nl1BHWLr7SCtxJhyGMIjONRzBy8UgWeN27ytKsxBtskbqvKO0/5sB
 yponmDA5bfukZiHbKA2Y4z6hmxOsGx4giiy/UXHIp0qK+mRI6vDaK9wYEQGZA10o
 ipjFHW+52k8te/8A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6f1057c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Feb 2020 21:38:53 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 59so18644079otp.12
 for <wireguard@lists.zx2c4.com>; Tue, 04 Feb 2020 13:39:44 -0800 (PST)
X-Gm-Message-State: APjAAAVyBnNS8nJ/Z0fTFzQmo6QDuUclmBsx5B2NLUEP/pILAbCaTwyE
 z3MU0njCKjX10BwghNNkzRFG+4nEIddRoftNZ7c=
X-Google-Smtp-Source: APXvYqyGam5KOWJSNtBSP5oVex1+DDBSldrjXTPvSbLwRn/WfIFo0yyZdSaxizLyfaNE/aV0+bPOpFVUxYmcYWpcpB4=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr24023954otm.52.1580852384144; 
 Tue, 04 Feb 2020 13:39:44 -0800 (PST)
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
In-Reply-To: <CACT4Y+awD47=Q3taT_-yQPfQ4uyW-DRpeWBbSHcG6_=b20PPwg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Feb 2020 22:39:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9q3_p_BX0BC6=urj4KeWLN2PvPgvGy3vQLFmd=qkNEkpQ@mail.gmail.com>
Message-ID: <CAHmME9q3_p_BX0BC6=urj4KeWLN2PvPgvGy3vQLFmd=qkNEkpQ@mail.gmail.com>
Subject: syzkaller wireguard key situation [was: Re: [PATCH net-next v2] net:
 WireGuard secure network tunnel]
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

I see you got wireguard's netlink stuff hooked up to syzkaller.
Excellent work, and thanks! It's already finding bugs.

Right now it seems to know about 5 different keys you've come up with,
and not much in the way of endpoints. I think we can improve this.

For keys, there are a few cases we care about:

1) Low order keys
2) Negative keys
3) Normal keys
4) Keys that correspond to other keys (private ==> public)

For this last point, if we just have a few with that correspondance
quality in there, syzkaller will eventually wind up configuring two
interfaces that can talk to each other, which is good. Here's a
collection of keys you can use, in base64, that will cover those
cases, if you want to add these instead of the current ones in there:

1)
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
4Ot6fDtBuK4WVuP68Z/EatoJjeucMrH9hmIFFl9JuAA=

2)
2/////////////////////////////////////////8=
TJyVvKNQjCSx0LFVnIPvWwREXMRYHI6G2CJO3dCfEdc=

3,4)
oFyoT2ycjjhT4v16cK4Psg+hUmAMsAhFF08IB2+NeEM=
l1ydgcmDyCCe54ElS4mfjtklrp8JI8I8YvU8V82/aRw=
sIBz6NROkePakiwiQ4JEu4hcaeJpyOnYNbEUKTpN3G4=
0XMomfYRzYmUA01/QT3JV2MOVJPChaykAGXLYxG+aWs=
oMuHmkf1vGRMDmk/ptAxx0oVU7bpAbn/L1GMeAQvtUI=
9E2jZ6iO5lZPAgIRRWcnCC9c6+6LG/Xrczc0G0WbOSI=

That's 10 keys total, which should be a decent collection to replace
your current set of hard coded keys in there. You can unbase64 these
into C format with commands like:

$ echo '2/////////////////////////////////////////8=' | base64 -d | xxd -i
  0xdb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff

The second thing is getting two wireguard interfaces to talk to each
other. This probably should happen over localhost. That means the
listen port of one should be the endpoint of the other. So maybe you
can get away fuzzing these with:

Listen ports:
51820
51821
51822
[randomly selected]

and

Endpoints:
127.0.0.1:51820
127.0.0.1:51821
127.0.0.1:51822
[::1]:51820
[::1]:51821
[::1]:51822
[randomly selected]

Finally the "allowed ips" for a peer, the routing table entry that
points to wireguard, and the packet that's being sent, should all
somehow correspond. But probably an allowed ips of 0.0.0.0/0 will
eventually be fuzzed to, which covers everything for the first part,
so let's see if the rest falls into place on its own.

What do you think of all that?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
