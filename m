Return-Path: <SRS0=xOZE=4G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042C5C34026
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Feb 2020 10:00:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6E520659
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Feb 2020 10:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="e9hBWxop"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6E520659
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91c0f8ea;
	Tue, 18 Feb 2020 09:57:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1f5e478
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Feb 2020 09:57:43 +0000 (UTC)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 534f6de1
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Feb 2020 09:57:42 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c188so18909727qkg.4
 for <wireguard@lists.zx2c4.com>; Tue, 18 Feb 2020 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1r+LsWOb2AmE1u/gMvHdqR1rXomzL+PpjbvPFDdPEE=;
 b=e9hBWxopHFK0jPOPiWZfyppwvSzbv6U1cGvaZYTveag0nnDgwlr2Hxlp3QytNijDw0
 ZNj1W/cDf57c7Tz6Ya5As1Valur+2V15hYSl8MqJF3NsNrHlhlDos8WQ1WFe2vVZ91xQ
 FrpuK1p47Kuue0w+988x5yRSiJ4Xm08Pp5G02TyBokiZu5BbExdAqvNQKMHroc1yDd5n
 hySQtiAPH0sUdgIQNXd8NfnW8L2puIOd7qwU5750+l26YG2e3+08UpvUBSykjIqJL44e
 w4S6JEf+vcWxWujELiuSsZmxPAMfVAW0padwUP6B21mB16EyRvOqHTwH7E+T7yA11mnd
 4VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1r+LsWOb2AmE1u/gMvHdqR1rXomzL+PpjbvPFDdPEE=;
 b=c3yoCufzOzWeEmGez19e4PRHXRGSJmQfqmE42CW9/kQNLCaIeWQn3KtmRhmgkD4f3i
 6YaXxB+C7yZXsS60NA9PaFkdWEbFWLU3escAb7iiSotoB92Mpgxc9id+onOv2u09Fdrt
 iZo2riqaB1bc96ELMBIVNYV9odhae4PKtAsY/OVFl1H11XSn8WE7gn/J9EeK+5mPy8Ee
 2FGOZQKl/gEaj9+A4MQwMU6MGsKGx82pmcXUKRItCWRLogU/l73FFTKELaIlw1waLlMT
 A4M5SSEMaAh2NNZdOlckHR9zvBRRJgKmqGzyWAKDpSymklS33c/0VpcOM+3tYM4Af7Yx
 YQ3g==
X-Gm-Message-State: APjAAAVpxG3xia/ymJIiwZ11eZ9nQhLsD+J+/XD1ZvNr74amQiObIZx1
 eduUu/YyD8AUU1r0WRdD0+M8W9Lt3MasAs7nNakqdg==
X-Google-Smtp-Source: APXvYqxxr7CNmWczhCqSO2HneSo/ObH+uGo2aundzGwuSDWUBnJ7lUHocIXMpy5s6B0ppyEwyUEIRGpo0OKKSFn/Nu4=
X-Received: by 2002:a37:5686:: with SMTP id k128mr14509523qkb.8.1582020018519; 
 Tue, 18 Feb 2020 02:00:18 -0800 (PST)
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
In-Reply-To: <CACT4Y+bMzYZeMvv2DdTuTKtJFzTcHhinp7N7VmSiXqSBDyj8Ug@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 18 Feb 2020 11:00:07 +0100
Message-ID: <CACT4Y+bUXAstk41RPSF-EQDh7A8-XkTbc53nQTHt4DS5AUhr-A@mail.gmail.com>
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

On Mon, Feb 17, 2020 at 8:24 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Feb 17, 2020 at 4:42 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > >
> > > > Observation:
> > > >
> > > > It seems to be starting to synthesize packets sent to the wireguard
> > > > socket. These aren't the proper handshake packets generated internally
> > > > by that triangle commit, but rather ones that syzkaller creates
> > > > itself. That's why we have coverage on wg_receive, which otherwise
> > > > wouldn't be called from a userspace process, since syzbot is sending
> > > > its own packets to that function.
> > > >
> > > > However, the packets it generates aren't getting very far, failing all
> > > > of the tests in validate_header_len. None of those checks are at all
> > > > cryptographic, which means it should be able to hit those eventually.
> > > > Anything we should be doing to help it out? After it gets past that
> > > > check, it'll wind up in the handshake queue or the data queue, and
> > > > then (in theory) it should be rejected on a cryptographic basis. But
> > > > maybe syzbot will figure out how to crash it instead :-P.
> > >
> > > Looking into this.
> > >
> > > Found the program that gives wg_receive coverage:
> > >
> > > r0 = openat$tun(0xffffffffffffff9c,
> > > &(0x7f0000000080)='/dev/net/tun\x00', 0x88002, 0x0)
> > > ioctl$TUNSETIFF(r0, 0x400454ca, &(0x7f00000000c0)={'syzkaller1\x00',
> > > 0x420000015001})
> > > r1 = socket$netlink(0x10, 0x3, 0x0)
> > > ioctl$sock_inet_SIOCSIFADDR(r1, 0x8914,
> > > &(0x7f0000000140)={'syzkaller1\x00', {0x7, 0x0, @empty}})
> > > write$tun(r0, &(0x7f00000002c0)={@void, @val, @ipv4=@udp={{0x5, 0x4,
> > > 0x0, 0x0, 0x1c, 0x0, 0x0, 0x0, 0x11, 0x0, @remote, @broadcast}, {0x0,
> > > 0x4e21, 0x8}}}, 0x26)
> > >
> > > Checked that doing SIOCSIFADDR is also required, otherwise the packet
> > > does not reach wg_receive.
> >
> >
> > All packets we inject with standard means (syz_emit_ethernet) get
> > rejected on the following check:
> >
> > static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
> > {
> > const struct iphdr *iph;
> > u32 len;
> >
> > /* When the interface is in promisc. mode, drop all the crap
> > * that it receives, do not try to analyse it.
> > */
> > if (skb->pkt_type == PACKET_OTHERHOST)
> > goto drop;
> >
> > Even if we drop IFF_NAPI_FRAGS which diverges packets who-knows-where.
> >
> > Somehow we need to get something other than PACKET_OTHERHOST...
> > Why is it dropping all remote packets?...
> > How do remote packets get into stack then?...
>
> I've managed to create a packet that reaches wg_receive, that is:
>
> syz_emit_ethernet(AUTO, &AUTO={@local, @empty, @void, {@ipv4={AUTO,
> @udp={{AUTO, AUTO, 0x0, 0x0, AUTO, 0x0, 0x0, 0x0, AUTO, 0x0, @empty,
> @empty, {[]}}, {0x0, 0x4e22, AUTO, 0x0, [], ""/10}}}}}, 0x0)
>
> Had to enumerate all possible combinations of local/remote mac,
> local/report ip, local/remote port.
>
> However, this is only without IFF_NAPI_FRAGS. With IFF_NAPI_FRAGS it
> reaches udp_gro_receive, but does not get past:
>
> if (!sk || NAPI_GRO_CB(skb)->encap_mark ||
>     (skb->ip_summed != CHECKSUM_PARTIAL &&
>      NAPI_GRO_CB(skb)->csum_cnt == 0 &&
>      !NAPI_GRO_CB(skb)->csum_valid) ||
>     !udp_sk(sk)->gro_receive)
>     goto out;


I've added descriptions for wireguard packets:
https://github.com/google/syzkaller/commit/012fbc3229ebef871a201ea431b16610e6e0d345
It gives all reachable coverage (without breaking crypto).

Strictly saying, for tcp we experimented with receiving ACKs back from
tun and exposing them to fuzzer to form proper SYNACKs:
https://github.com/google/syzkaller/blob/012fbc3229ebef871a201ea431b16610e6e0d345/executor/common_linux.h#L1390-L1441
https://github.com/google/syzkaller/blob/012fbc3229ebef871a201ea431b16610e6e0d345/sys/linux/vnet.txt#L24-L27

Theoretically, it could receive wireguard handshakes and form proper
replies with valid signatures and stuff.

I disabled IFF_NAPI_FRAGS entirely, it seems to prevent from getting
any meaningful coverage:
https://github.com/google/syzkaller/commit/39cd0f85a1ac60b88c793bd8f4a981227614da88
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
