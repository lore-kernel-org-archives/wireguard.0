Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CD6C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:54:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63EC32084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=weiti.org header.i=@weiti.org header.b="otbXarZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63EC32084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=weiti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8a97ee1;
	Mon, 17 Dec 2018 07:54:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f3db263
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:54:13 +0000 (UTC)
Received: from hub02.weiti.org (hub02.weiti.org [5.45.104.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 538eb969
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:54:13 +0000 (UTC)
Received: from mail02.weiti.home (mail02.weiti.home [172.18.20.20])
 by hub02.weiti.org (Postfix) with ESMTPS id 67CC95F734;
 Mon, 17 Dec 2018 08:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weiti.org;
 s=mail201701; t=1545033270;
 bh=klEqPlV35HvDxrPFIylmgfYlb6NjCxb71c+QlQM0KfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=otbXarZrpbH6jloFIhiArVTyInbtREA9JNEevniTgywOVAXYt4s0QbwP9aJm6iP8g
 sYjoEIjiJ4qAuOXdBZJhrZVysUA5XdkvuivOWQwBu8GPEuNKODnihi/3iQ0L5kNIP3
 qwsyc4XLWy2jvxc3pmXC0ttNfccnYOd5s+PhSm/g=
Received: from arch01.localdomain (arch01.weiti.home [172.18.20.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail02.weiti.home (Postfix) with ESMTPSA id D30FF22276;
 Mon, 17 Dec 2018 08:54:29 +0100 (CET)
Date: Mon, 17 Dec 2018 08:54:28 +0100
From: Tim Weippert <weiti@weiti.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
Message-ID: <20181217075428.GB18720@arch01.localdomain>
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <20181217074423.GA18720@arch01.localdomain>
 <CAHmME9pyAt=+DpZH1zmpLh7wJFCDf=ZmX_JrvYsXEy-+zZS1Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9pyAt=+DpZH1zmpLh7wJFCDf=ZmX_JrvYsXEy-+zZS1Xg@mail.gmail.com>
Priority: normal
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spamd-Bar: -
Authentication-Results: mail02.weiti.home;
 auth=pass smtp.auth=weiti@weiti.org smtp.mailfrom=weiti@weiti.org
X-Rspamd-Server: mail02
X-Rspamd-Queue-Id: D30FF22276
X-Spamd-Result: default: False [-1.90 / 23.00]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-2.80)[99.15%];
 TO_DN_ALL(0.00)[]; SUBJECT_ENDS_QUESTION(1.00)[];
 RCVD_COUNT_ZERO(0.00)[0]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi, 

On Mon, Dec 17, 2018 at 08:50:28AM +0100, Jason A. Donenfeld wrote:
> On Mon, Dec 17, 2018 at 8:44 AM Tim Weippert <weiti@weiti.org> wrote:
> > This should normally do what you expected, but i think as stated above
> > the /24 routing is "disabling" the correct behaviour.
> 
> False. The /24 routing won't disable anything having to do with
> allowedips. And some people like to route larger masks than their
> peers, so that they can support multiple peers with a single route.

Oh, right. Therefore i woul prefer to add 10.x.x.1/24 on the WG Interface and not 
add a special routing, but i get it wrong. Thanks for correct me!

regards, 
tim
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
