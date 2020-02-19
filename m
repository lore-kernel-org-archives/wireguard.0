Return-Path: <SRS0=OdKV=4H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0384C3404D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Feb 2020 10:23:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CBB24658
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Feb 2020 10:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="k3QbIX6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CBB24658
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2f74a65;
	Wed, 19 Feb 2020 10:20:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 728a13de
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 10:20:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b14e1b32
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 10:20:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 246bfe20
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ZCPT+ZMcds8PREOtUbxRL6XjK/M=; b=k3QbIX
 6WVwRNHUu/tNFoCc4IW4LuWjnKJDU2BOomBRxUPzqLKyfvCwybxDy3+0au872Z93
 Na5nfOYHEu3jKCtUm0gWxPuMdCyYxRJKyi6UHpYAMURQdRDRiT4Asj3SVN35LUJO
 E6N48o4yR/6EHm2sWrCSfPK1cnQYrsyI96gcgy7PJLrwj3mENlyU0mdYHlCPihtg
 yCOnCPdh9jDfQ9pW6biHr6r4AkFUwkGw2s8Xwo6M8BagVXIkvbeJrULsaTrBYHz7
 4Wv7iZv4Fi1XqmDrxsKh35kJG9qDQuKB+ogdqZjUI2vYXahKI6XezdnIuEE+gcgp
 i+GtTgZmXU7U6ZxA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0fa9b65a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 10:20:17 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id r16so22643481otd.2
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2020 02:23:01 -0800 (PST)
X-Gm-Message-State: APjAAAXoxaeYrvGcRhFjK3imTcsBPekX0Zqq5fuhaDANLR5VrMu5G0eL
 aVqE3GMs9iPWmIJQQIV8gNLbCLmPxnZVlg+7BLw=
X-Google-Smtp-Source: APXvYqw5kcDza6fr8VtyYwTuw85PxRZOmQqC5NnQoMtaWTpFs5uQVk0NP3nmiMvn2lVCeV97cT1XgJ60QCw4J9lWCVY=
X-Received: by 2002:a9d:811:: with SMTP id 17mr19738264oty.369.1582107780436; 
 Wed, 19 Feb 2020 02:23:00 -0800 (PST)
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
In-Reply-To: <CACT4Y+bUXAstk41RPSF-EQDh7A8-XkTbc53nQTHt4DS5AUhr-A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Feb 2020 11:22:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9pr4=cn5ijSNs05=fjdfQon49kyEzymkUREJ=xzTZ7Q7w@mail.gmail.com>
Message-ID: <CAHmME9pr4=cn5ijSNs05=fjdfQon49kyEzymkUREJ=xzTZ7Q7w@mail.gmail.com>
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

On Tue, Feb 18, 2020 at 11:00 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> I've added descriptions for wireguard packets:
> https://github.com/google/syzkaller/commit/012fbc3229ebef871a201ea431b16610e6e0d345
> It gives all reachable coverage (without breaking crypto).

Oh, great, that looks really good. It now fails at the index match,
which is basically trying to brute force a 32-bit integer that's
changing every 3 minutes, which syzkaller is probably too slow to do
on it's own. But that's fine.

Your commit has some questions in it, like "# Not clear if these
indexes are also generated randomly and we need to guess them or
not.". Here's what's up with those indices:

Message message_handshake_initiation: the sender picks a random 32-bit
number, and places it in the "sender_index" field.
Message message_handshake_response: the sender picks a random 32-bit
number, and places it in the "sender_index" field. It places the
32-bit number that it received from message_handshake_initiation into
the "receiver_index" field.
Message message_handshake_cookie: the sender places the 32-bit number
that it received from message_handshake_initiation or
message_handshake_response into the "receive_index" field.
Message message_data: the sender places the 32-bit number that it
picked for the  message_handshake_initiation or
message_handshake_response into the "key_idx" field.

I'm not sure it'll be too feasible to correlate these relations via
fuzzing. And either way, I think we've got decent enough non-crypto
coverage now on the receive path.

I noticed a small seemingly insignificant function with low coverage
that's on the rtnl path that might benefit from some attention and
also help find bugs in other devices: wg_netdevice_notification. This
triggers on various things, but the only case it really cares about is
NETDEV_REGISTER, which happens when the interface changes network
namespaces. WireGuard holds a reference to its underlying creating
namespace, and in order to avoid circular reference counting or UaF it
needs to either relinquish or get a reference. There are other drivers
with similar type of reference counting management, I would assume.
This sort of thing seems up the ally of the types of bugs and races
syzkaller likes to find. The way to trigger it is with `ip link set
dev wg0 netns blah`, and then back to its original netns. That's this
code in net/core/rtnetlink.c:

       if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] ||
tb[IFLA_TARGET_NETNSID]) {
               struct net *net = rtnl_link_get_net_capable(skb, dev_net(dev),
                                                           tb, CAP_NET_ADMIN);
               if (IS_ERR(net)) {
                       err = PTR_ERR(net);
                       goto errout;
               }

               err = dev_change_net_namespace(dev, net, ifname);
               put_net(net);
               if (err)
                       goto errout;
               status |= DO_SETLINK_MODIFIED;
       }

That seems to have decent coverage, but not over wireguard. Is that
just a result of the syzkaller @devname not yet being expanded to
wg{0,1,2}, and it'll take a few more weeks for it to learn that?
@netns_id seems probably good, being restricted to 0:4; is it possible
these weren't created though a priori?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
