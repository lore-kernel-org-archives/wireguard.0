Return-Path: <SRS0=30W4=AA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD53C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 06:59:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D282D20809
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 06:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D282D20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sysnux.pf
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba941942;
	Fri, 19 Jun 2020 06:40:24 +0000 (UTC)
Received: from smtp-pro1.mana.pf (smtp-pro1.mana.pf [202.3.225.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c64defac
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2020 06:40:21 +0000 (UTC)
Received: from tiare.sysnux.pf (103-4-75-17-dynamic.viti.pf [103.4.75.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: courrier@sysnux.pf)
 by smtp-pro1.mana.pf (Postfix) with ESMTPSA id E984D54236;
 Thu, 18 Jun 2020 20:58:36 -1000 (-10)
Received: from x220.sysnux.pf (unknown [192.168.10.11])
 by tiare.sysnux.pf (Postfix) with ESMTP id C0C7214C7C8C;
 Thu, 18 Jun 2020 20:58:36 -1000 (-10)
Subject: Re: Kernel Panic after updating Kernel
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
 <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
From: Jean-Dens Girard <jd.girard@sysnux.pf>
Message-ID: <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@sysnux.pf>
Date: Thu, 18 Jun 2020 20:58:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Le 18/06/2020 à 10:11, Jason A. Donenfeld a écrit :
> On Thu, Jun 18, 2020 at 2:10 PM Jean-Denis Girard <jd.girard@sysnux.pf> wrote:
>> I cannot reboot now, I will let you know how it goes later.

Reboot with newer kernel and latest wireguard  still hangs.

> Oh, in your case, you appear to be using the dkms package instead of
> the elrepo package.

Is that a problem?



Thanks,

-- 

Jean-Denis Girard



SysNux                   Systèmes   Linux   en   Polynésie  française

https://www.sysnux.pf/   Tél: +689 40.50.10.40 / GSM: +689 87.797.527
