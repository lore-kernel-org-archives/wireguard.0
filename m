Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53994C48BD1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 08:42:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C84A613B3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 08:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C84A613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b2fdae;
	Fri, 11 Jun 2021 08:42:19 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ebf0454
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 08:42:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id g20so3474274ejt.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jun 2021 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3TcFLzWpXVIyoCFs6Wpjira2vZFodwsYJjyASy22VUk=;
 b=PqTxsQbbgp3frxQsvkQl8IjimhfqyzraahHe5brLVlUBVUaYGFfyTFKcJzZnugYj8v
 7Ctfjt5qkVik6BRzxBUthoAq9rCKlj22+wWe3IHTUAZiwpYBXilD2NFFKkad6VIRtYCp
 ciiF/xubSFzIjbI3Sn181Okv21M6sQPOOYFWWgnx48cRB/20xPmAjbjZzPjy8VYV4nAQ
 iOhCx6CPNRe2u1+2+4Vpsn+GTli+v/A1BUW4ULlqnLPxoIUzI7iWIkWwziyCy5yGvlXr
 EuRfSfN0WAhHejq1MAfFMSfkVfc9eTIkU2pRYhkGjWFED1TGkKIEe0RxDIeXZfLroopH
 179w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3TcFLzWpXVIyoCFs6Wpjira2vZFodwsYJjyASy22VUk=;
 b=Jt0xltu/FthXzmKLnijXUqFJTAf/S9HsPpjNrsIra20RmYcFgkLOTkK41JVwYhFSIS
 kEIqMzwsTQHzG0OFLCFAqQccpLN5LsbGhJ1LreTjAMlCwupNV4wmr9pEW0ucU26U9r0+
 bBZroezwSNQg9BQngqfj2SD2KUrUcJ76bO0QQ86lyJ+QRedR5oX+HiXJvui71gho+C7w
 So80oq8clXN3qradpO5FB5fKfs4hUGxolA615Q/TmY9rppQOOIag2v+F9NQmOwCTkX7b
 Vvlqd+bwr8dMkP5D+XNS39WhhEVVMQrxGOZwbrun0L3MaaqXNq4xMXvhuS4+ZFi9jymx
 U/FQ==
X-Gm-Message-State: AOAM532U6PtOFZ8CDvMj8eKSe10s/YsZX9tB1B00tQOFaxooCC57+ghL
 rd2MI1MB2OuU/omE+1MpzTsITg==
X-Google-Smtp-Source: ABdhPJz08r9T7xxVbCb2Ec7OPpAaPA56hl1UkJ735BjmB3dyN4S0dLPURz9IQ4ChSF7bQ6X4B68pnA==
X-Received: by 2002:a17:907:c0d:: with SMTP id
 ga13mr2710909ejc.325.1623400936386; 
 Fri, 11 Jun 2021 01:42:16 -0700 (PDT)
Received: from smtpclient.apple (87.119.154.76.ipv4.telemach.net.
 [87.119.154.76])
 by smtp.gmail.com with ESMTPSA id a2sm1892842ejp.1.2021.06.11.01.42.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jun 2021 01:42:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: WireGuard is broken on iOS 15 beta
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
Date: Fri, 11 Jun 2021 10:42:14 +0200
Cc: David Crawshaw <crawshaw@tailscale.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BD85DF3-A8B2-45BF-A78C-D03524A226DC@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
 <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
 <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
 <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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

Jason,

My bad, you=E2=80=99re right regarding the Personal VPN.

I just ran your patch and it works great. As David pointed out, the call =
to valueForKeyPath should be guarded because it throws exception if the =
given key path does not exist. I use the availability check to =
bruteforce utun on iOS 15, macOS 12 and onwards while keeping the Key =
value coding approach on older iOS and macOS as we know that it works =
great on iOS < 15 and macOS < 12. Just ran the app on macOS 11.4 and =
it=E2=80=99s still working and using the old code path.

I took a liberty to refactor the proposed solution (see: =
https://git.zx2c4.com/wireguard-apple/commit/?id=3Da7ccc8e3031f3502ea4b53a=
914d37589186e40f8)

Cheers,
Andrej

> On 11 Jun 2021, at 09:53, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On 6/11/21, Andrej Mihajlov <and@mullvad.net> wrote:
>> IIRC one thing to consider with that lookup: iOS enables users to run
>> Personal VPN and Custom VPN (aka WireGuard) side-by-side so there is =
a
>> chance you may pick the wrong utun.
>=20
> That doesn't make any sense. File descriptors are not OS-global;
> they're process-local. That's how Unix FDs have worked since forever.
> Unless you're suggesting "personal VPN" is somehow resident in the
> same network extension process as WireGuard's "custom VPN"?
>=20
> By the way, did the experiment in your branch work? I'd prefer a
> direct route to brute forcing FDs, if possible. But if not, seems like
> my kludge might ultimately do the trick.

