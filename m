Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9392C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 13:05:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1FD2176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 13:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="KLw5Wh7L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1FD2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 837d6d68;
	Thu, 28 Nov 2019 13:05:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82709b12
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 13:05:25 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33b3ef5c
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 13:05:25 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id C84422010D;
 Thu, 28 Nov 2019 14:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1574946323; bh=aWik7wFDlvC9KBbc2xxaQzN7mtjMh0PS20Z7D9gynB8=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=KLw5Wh7LNkhkkmoMY7wo0g5ikhAXBuwaHnvrKfsK1lWClf6o0RzrR45uOGCz0gt9X
 O0TetBmg1aStIXyg+1aZt0+oEkHHK5fNEGh+y1n6SzfS5YD6bG+BQ+aWMadBE2Mvwl
 Zt5+Ea+t9+HWBB2O5o/suwWfzev5OzVDuiEAf0X7wnvOcURS4vdprT2ExHNNLuQAgs
 Gkz33aJ4BHE7Behys+jiS9Y6DXzuISmS/tjVM0GKZI8SMOWj2h3wCjioI+RGqlTmh8
 34cQWgilVXTgRRdMYHyifuPXuUSbmu/m7/XnbY8WNHtw8f+HA7+LCxUS6oSDg2HwAY
 JY1Ht/j4eq6tA==
Received: by diamond.localdomain (Postfix, from userid 1000)
 id 8B8C013E35FF; Thu, 28 Nov 2019 14:07:00 +0100 (CET)
References: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
 <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Re: PostDown 0.0.20191127
In-reply-to: <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
Date: Thu, 28 Nov 2019 14:07:00 +0100
Message-ID: <87tv6o5evf.fsf@ungleich.ch>
MIME-Version: 1.0
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


Follow up question from my side Jason: what do you think about replacing
"$2" in the script with a shifted "$@" and allowing multiple devices to
be specified?

i.e. wg-quick up wgungleich wgplace4 wgplace11

is something I would like to do in one call and it would potentially be
easy to just loop around it as follows:

...
elif [[ $# -ge 2 && $1 == up ]]; then
	auto_su
    shift # kick out "up" from the list
    while [ $# -ge 1 ]; do
        name=$1; shift
	    parse_options "$name"
        cmd_up
    done
...


Jason A. Donenfeld <Jason@zx2c4.com> writes:

> Thanks. Fixed this way:
> https://git.zx2c4.com/WireGuard/commit/?id=57854fb710160f567cf776b65080a9ce5afdf02c
>
> But: why is your remove_iptables failing in the first place?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
