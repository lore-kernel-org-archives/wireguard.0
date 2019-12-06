Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7739CC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:24:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110AE2464E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="dQeeNn0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110AE2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a18846a;
	Fri, 6 Dec 2019 16:24:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 625d2729
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:24:04 +0000 (UTC)
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba18eb5
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:24:04 +0000 (UTC)
Date: Fri, 06 Dec 2019 16:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575649435;
 bh=OXnPNkQVjgkSKbeX7kZ303d1yannoV27flc6eJRFqY0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=dQeeNn0h4nPf87e4foJQmwLRmghIv/LfkC0eU4mR9qd/Gp82rWGuta+YJ4upy2Qex
 fgbVQPiWVgjnGK6lYoI6qCjeEh8bzEb+bKosVw3ZboB+XXJ47C3rAWGNBuYhaaculg
 n4Fw5ZjvjuQXfvAYtV13RBZT2UFIGWpdqVeLbmJM=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
Message-ID: <sUhAy9FQoNuL5pe4TIlO25pMeAUxCEvrvj9LPjQ9WauOtxLWfE3Ug9juP6RORXxjLpl6AfV7x5k9i-mkfs-OK1IYx2FcusfU7Ko3uLlcfHM=@protonmail.ch>
In-Reply-To: <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
References: <fa4b08be3b6fee08@frisell.zx2c4.com>
 <NHVyo9ngt5xOvRvbPjQgDNH8pGe-_qN2sVDvP7jv2a6ZZRWd_0Ia9q6w2ZUTEdIQ_n-U-TRDxz-92_hnUpJTx_e-XlC180z5q1wWwF9q5rs=@protonmail.ch>
 <CAHmME9qFER60XD1aVqP3cgpEHOnikMWfhC-mrxYXojWEjWcu8w@mail.gmail.com>
 <qgogeFsyHmrD5A5oDJC_2s3UznPWIP0ncQl5Co1jS5Khgl_48mDer0UJFV3r6DUKs9bJyCS2j7f8dYz9WT_3WLQEYx8v8iP9cVFXXqvojwY=@protonmail.ch>
 <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Friday, December 6, 2019 3:52 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Fri, Dec 6, 2019 at 4:36 PM Jordan Glover
> Golden_Miller83@protonmail.ch wrote:
>
> > iptables is from Arch Linux iptables-nft package:
> > $ iptables --version
> > iptables v1.8.3 (nf_tables)
>
> Does the segfault happen with the latest version in the git repo?
>
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/linux.bash

Yes, it still segfaults in the same way as before:

systemd[1]: Stopping WireGuard via wg-quick(8) for wg0...
wg-quick[6528]: [#] iptables -D OUTPUT -o wg0 -j ACCEPT
wg-quick[6528]: [#] ip -4 rule delete table 51820
wg-quick[6528]: [#] ip -4 rule delete table main suppress_prefixlength 0
wg-quick[6528]: [#] ip link delete dev wg0
wg-quick[6528]: [#] resolvconf -d wg0 -f
wg-quick[6620]: [#] iptables-restore -n
audit[6621]: ANOM_ABEND auid=4294967295 uid=0 gid=0 ses=4294967295 subj==unconfined pid=6621 comm="iptables-restor" exe="/usr/bin/xtables-nft-multi" sig=11 res=1
wg-quick[6620]: /usr/bin/wg-quick: line 29:  6621 Segmentation fault      (core dumped) "$@"
kernel: iptables-restor[6621]: segfault at 0 ip 00006e4350496cc9 sp 00007bfae0479dd0 error 4 in libnftnl.so.11.2.0[6e4350494000+18000]
kernel: Code: 15 5c 20 02 00 48 85 c0 74 07 48 89 00 48 89 40 08 48 83 c4 08 c3 66 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 53 48 83 ec 08 <48> 8b 3f 48 8b 1f 48 39 fd 74 2f 0f 1f 40 00 48 8b 47 08 48 89 43
systemd[1]: wg-quick@wg0.service: Succeeded.
systemd[1]: Stopped WireGuard via wg-quick(8) for wg0.

The "RTNETLINK answers: Address family not supported by protocol"
messages which were caused by lack of ipv6 support in kernel
(AKA weird kernels) was silenced but I think they weren't related
to this problem.

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
