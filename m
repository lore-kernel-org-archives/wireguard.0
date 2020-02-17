Return-Path: <SRS0=qhAm=4F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D9EC34021
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 15:42:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579F922B48
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Feb 2020 15:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="m8lSm5L9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 579F922B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05cae33c;
	Mon, 17 Feb 2020 15:40:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20f145cd
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 15:40:21 +0000 (UTC)
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 809c3366
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 15:40:21 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id dc14so7745901qvb.9
 for <wireguard@lists.zx2c4.com>; Mon, 17 Feb 2020 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2vBeSuiRPaNapi1PlVcmXh3bJYRV5oYBhPklfX/Y49A=;
 b=m8lSm5L9Zv/xkUo9tRJLzzXO6GImg8Eup7cWVaJtjF6LV7gpXBhMIJa8psoEyDfjWM
 lfHGVxDdVJTDYJ2yaKh6ezfRAYEhxtecySWNmsEMr6AA9+FB5qjduvX5Ate4sMqJsRfd
 gOHjCEmZboIWXvpiWhjUad8k0aHGijk6SqlXKiGuVONc2/X6AtovV3rXZyhJwyg4XRyJ
 YVDhog/2F/U1gXsmnK6qVrTHdPCet+GZhPvSwfB4yk8wYV0Dt/JFaaLCA/xdF8hLcPRZ
 5BFwnz/zbjpGeKeI3p7yZFFoZzI42v5/qRm/BEEDdT0VouwAX6QG6GwDWK7c/dVkLNmb
 C6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2vBeSuiRPaNapi1PlVcmXh3bJYRV5oYBhPklfX/Y49A=;
 b=Sg13bkyedPy+Tm5yx8KrJ0I+1qJSoWBNFP1Ga6AHUjfZLkTsNsgEvXHKdhvpGRIXCM
 8CPYW+K4uzs7zZB6iEGZ43POYFHnYJ9Z8nrw/bL38wESlGC1pJRyfJHZPd+KEoscq0zX
 GQ2ej9ev8TnGGmC3qnw7RfLxO0f+MT2T8pO7q2ZF+fhMmKyS23U2zu0iJECDFOZfhTV0
 qU/bRug+sUcP+ihBE/6fBs3tTgWiJQLouoameR8wvMXPWpFjIvsnENqs+kwV8tBysbpw
 6hhDeQFwsb9ogM16I/upnukVt4QLBllUj+DqvQzuYQt5pbz5ioUdVoTbuMKWHqvxIA8q
 8kEQ==
X-Gm-Message-State: APjAAAVjkkMjceHDrRs1/ZqLgecbXQBMm8T2lURb8eC32KL2S2sVzbM+
 KCZzNc4wl5e1M3VTMiU5ePzWOjBif7HS18Ns7cHsjSNTLc+KhA==
X-Google-Smtp-Source: APXvYqzkrsEoEEvjVaDIthEE+eWPGyJt5Uba0JCNhWu/6EltGeMeoJMkuNmwyUMM+7spOH9ulxTdt21IsutXiFrxaMU=
X-Received: by 2002:a05:6214:1874:: with SMTP id
 eh20mr13353966qvb.122.1581954170809; 
 Mon, 17 Feb 2020 07:42:50 -0800 (PST)
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
In-Reply-To: <CACT4Y+a8N7_n4t_vxezKJVkd1+gDHaMzpeG18MuDE04+r3341A@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 Feb 2020 16:42:39 +0100
Message-ID: <CACT4Y+atqrSfZuquPZcRUKNtVbLdu+B5YN3=YmDb38Ruzj3Pzw@mail.gmail.com>
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

On Mon, Feb 17, 2020 at 4:19 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Feb 17, 2020 at 12:44 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Observation:
> >
> > It seems to be starting to synthesize packets sent to the wireguard
> > socket. These aren't the proper handshake packets generated internally
> > by that triangle commit, but rather ones that syzkaller creates
> > itself. That's why we have coverage on wg_receive, which otherwise
> > wouldn't be called from a userspace process, since syzbot is sending
> > its own packets to that function.
> >
> > However, the packets it generates aren't getting very far, failing all
> > of the tests in validate_header_len. None of those checks are at all
> > cryptographic, which means it should be able to hit those eventually.
> > Anything we should be doing to help it out? After it gets past that
> > check, it'll wind up in the handshake queue or the data queue, and
> > then (in theory) it should be rejected on a cryptographic basis. But
> > maybe syzbot will figure out how to crash it instead :-P.
>
> Looking into this.
>
> Found the program that gives wg_receive coverage:
>
> r0 = openat$tun(0xffffffffffffff9c,
> &(0x7f0000000080)='/dev/net/tun\x00', 0x88002, 0x0)
> ioctl$TUNSETIFF(r0, 0x400454ca, &(0x7f00000000c0)={'syzkaller1\x00',
> 0x420000015001})
> r1 = socket$netlink(0x10, 0x3, 0x0)
> ioctl$sock_inet_SIOCSIFADDR(r1, 0x8914,
> &(0x7f0000000140)={'syzkaller1\x00', {0x7, 0x0, @empty}})
> write$tun(r0, &(0x7f00000002c0)={@void, @val, @ipv4=@udp={{0x5, 0x4,
> 0x0, 0x0, 0x1c, 0x0, 0x0, 0x0, 0x11, 0x0, @remote, @broadcast}, {0x0,
> 0x4e21, 0x8}}}, 0x26)
>
> Checked that doing SIOCSIFADDR is also required, otherwise the packet
> does not reach wg_receive.


All packets we inject with standard means (syz_emit_ethernet) get
rejected on the following check:

static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
{
const struct iphdr *iph;
u32 len;

/* When the interface is in promisc. mode, drop all the crap
* that it receives, do not try to analyse it.
*/
if (skb->pkt_type == PACKET_OTHERHOST)
goto drop;

Even if we drop IFF_NAPI_FRAGS which diverges packets who-knows-where.

Somehow we need to get something other than PACKET_OTHERHOST...
Why is it dropping all remote packets?...
How do remote packets get into stack then?...
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
