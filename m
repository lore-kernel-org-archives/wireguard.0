Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91018C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:49:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B863204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE622I5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B863204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26b4971f;
	Mon, 29 Jun 2020 18:30:04 +0000 (UTC)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [2607:f8b0:4864:20::1044])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad14dee8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 18:30:01 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id cv18so3341192pjb.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0TqVDo7Scf3zMjLB/4NkkrNtpc5MiwaQ7FE8AIQUCg0=;
 b=RE622I5w0qbMww2edBz5TxnjBnLToOQoBaMdyIKlceSp1fFok2tfOv8YzNBp1YevLp
 vYdR5mhj+CvQHBb+0PXwRwahLkP9g/k6ZDzrH19e2RyZXjSkPTnteEsis8GrJiijfOzB
 zmf1fgpOmdqIhscKYO+2Z8wpIt4iEqkV7Fu8aA20H4y/iVTg3CH14tzzHNAMcUhrRP93
 qEtJsVDxcgXOI02HlSX3lOT4lhDgYSwCV06EDE8/I61q4VzqCZuue4i8KZ5Q4wmC7Kl+
 aZoSqNA4WQpW4cD0gM3tqAdv4fZ91x9HkHlBPrPsI1DQe7izmL2Rz/+9PTYetBJi1emS
 1muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TqVDo7Scf3zMjLB/4NkkrNtpc5MiwaQ7FE8AIQUCg0=;
 b=fXtZ/RIY2sHHp8+5NLndH/H6Hhh22+Xpb7HMc5z/thdShkCgp5qLcZIAHNzydqN3cu
 B8IlVqlZleMKtpK2R6C/FBa9nsL0WgWiFyPY0r3Ci67yFRLmi4XLrNSjl87ZVdviIhSu
 gsXpUmaa5JjFkNStdUH1nEyZ2eJLOnkkvdArYAH1pLJ5Wu7Pzfy3TyrYp5STFFL+CFLq
 qeNTOARsO7Hrh/bAgDPa20+1DVVNsQWsTM6BIanevBOXUnwzylmaS3nxoJGKcvHrIlin
 DKaBEsxRXB5w0e/+urA088cDTkaFsnj9bw/5SYYkGq4T8UvhT0q9IlL8jtKjm34oTl/f
 pueg==
X-Gm-Message-State: AOAM533AZSObjX8myB6vMrqzFULCZCMlfxNDZ+9sAhIsAeMeS4di4jx6
 HBo32/ufECRySQgCWBMU0SgdtqcLJ/cxdtivnhKIskY/V7g=
X-Google-Smtp-Source: ABdhPJzzdouo9wjO3XBojpE4vsJm5/kwGHEEoKShV8hKip/sBqXUZlAX6XoVL5yHKj7zYki5QePtyzzRR/j4R/IFZeg=
X-Received: by 2002:a17:90a:930b:: with SMTP id
 p11mr18614175pjo.230.1593456581951; 
 Mon, 29 Jun 2020 11:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk>
 <20200629163851.41d6d755@natsu> <87lfk6gjax.fsf@toke.dk>
In-Reply-To: <87lfk6gjax.fsf@toke.dk>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 29 Jun 2020 15:49:30 -0300
Message-ID: <CAJq09z7NoX6f+MzYgvhQkZ7oe8aR8_AMqX+YWZn1MHSUArybPA@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Roman Mamedov <rm@romanrm.net>, Reid Rankin <reidrankin@gmail.com>,
 ch@ntrv.dk, WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

It simply does not make sense to set ULA automatically. ULA fc00::/7
is subdivided in fc00::/8 and fd00::/8. The former would use some
global registry while the second one
uses a random 40-bit subnet prefix (to avoid conflicts). You would
need to share this 40-bit random value with every node in order to
have a common /48 prefix. Besides that,
It would not make sense to have a full /48 for a single VPN network.
It should be subdivided into common /64 appending another 16-bit
subnet id. So, in the end, you would
need a way to pass the ULA prefix (40-bit + 16-bit). ULA should be
configured just like any other global address.

If ULA is not the topic, we might need to change the thread name. The
issue here is really about having Link Local Address automatically
set.

I know that Wireguard wants to be as clean as possible not including
any automatic setup logic. However, most protocols that would do that
job, at least, expect LL to be present (DHCPv6).
LL is set by the kernel for ethernet devices but not for TUN
interfaces, probably because there is simply no "link" on a L3
interface. There is, for example, a request to have it set for OpenVPN
(https://community.openvpn.net/openvpn/ticket/415). I would expect
IPv6 LL address to be present in any default scenario. I just don't
know what would be the one to set it up. For ethernet
devices, it is the kernel itself. For wireguard, there is a shared
responsibility between userland (wg and wg-quick) and kernel. However,
as a required feature, I would not depend on any software
that is not required. If wg-quick is optional, it would not be the
place to set the LL address. Maybe wg would be the one to set it as
soon as a IPv6 stack is up for a wireguard interface, even when there
is
no intention to use IPv6. However, if wg is also "optional", it would
be nice if the kernel API could require the userland code to inform
the interface-id (or set a link local address) before IPv6 is up.
For wireguard, LL address setup also means to set allowed IPs automatically.

Regarding what interface id should be used, even random value is
acceptable but not ideal for management as it could be used as part of
device ID.
Wireguard could use a simple algorithm to map pubkey 256-bit into a
64-bit value, just like ethernet 48-bit is mapped to a 64-bit value.
It can be as
simple as getting the last 64-bit from pubkey or any already in use
form of hash. Keep it as simple as possible. It is not expected to be
secret.
The privacy extension, if used, is for automatically generated global
addresses, not link-local one.

Keep in mind that LL is not expected to be a replacement for any
global address (ULA or Internet one). They should still be set. At
least for Linux, no
"normal" process would really use LL addresses without specifying the
outgoing interface ("fe80::...%interface"), which might limit what you
can do with it.

In summary, my suggestions:

1) LL address should be set automatically by wg, better if required by
kernel interface or even set up by kernel module.
2) interface identification can be derived from pubkey with a simple
algorithm. It does not need to be a secure hash.

Regards,
---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com
