Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E5FC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 13:32:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A4E2208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 13:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A4E2208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=med.uni-frankfurt.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34c01a0c;
	Thu, 28 Nov 2019 13:32:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be660686
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 13:32:29 +0000 (UTC)
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
 [141.2.22.206])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a22ccd83
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 13:32:29 +0000 (UTC)
Received: from smtpauth.cluster.uni-frankfurt.de ([10.1.1.214])
 by mailout.rz.uni-frankfurt.de with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sattler@med.uni-frankfurt.de>)
 id 1iaJuG-0002hQ-1V; Thu, 28 Nov 2019 14:32:28 +0100
Received: from p5b05545f.dip0.t-ipconnect.de ([91.5.84.95] helo=[192.168.2.17])
 by smtpauth.cluster.uni-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 (envelope-from <sattler@med.uni-frankfurt.de>)
 id 1iaJuF-0002xc-F6; Thu, 28 Nov 2019 14:32:27 +0100
Subject: Re: PostDown 0.0.20191127
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
 <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
Message-ID: <cc88dffc-8940-64c9-f339-0a158fb87967@med.uni-frankfurt.de>
Date: Thu, 28 Nov 2019 14:32:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Am 28.11.19 um 13:51 schrieb Jason A. Donenfeld:
> Thanks. Fixed this way:
> https://git.zx2c4.com/WireGuard/commit/?id=57854fb710160f567cf776b65080a9ce5afdf02c
> 
> But: why is your remove_iptables failing in the first place?
> 

If I understand correctly, the implicit return value of remove_iptables()
is the return value of its last command, which is the included for-loop.

And the implicit return value of the for loop is the return value of the
last command run inside the for-loop. Which is the test whether $found
is one. On my system $found is zero.

So the test "fails" and remove_iptables() returns non-zero.

Thomas
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
