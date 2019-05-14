Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52062C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 20:52:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEAA20879
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 20:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABEAA20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7880d216;
	Tue, 14 May 2019 20:52:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 616543ea
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 20:52:38 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id a0cd4e44
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 20:52:38 +0000 (UTC)
Received: (qmail 961 invoked by uid 500); 14 May 2019 20:50:16 -0000
Date: Tue, 14 May 2019 15:50:16 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Working on change for: genetlink: make policy common to family
Message-ID: <20190514205016.GA920@wolff.to>
References: <20190513195213.GA30315@wolff.to> <20190513202453.GA30656@wolff.to>
 <20190513212110.GA31106@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513212110.GA31106@wolff.to>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

On Mon, May 13, 2019 at 16:21:10 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>On Mon, May 13, 2019 at 15:24:53 -0500,
> Bruno Wolff III <bruno@wolff.to> wrote:
>>On Mon, May 13, 2019 at 14:52:13 -0500,
>>Bruno Wolff III <bruno@wolff.to> wrote:
>>>Wireguard isn't building on 5.2 right now because of commit:
>>>3b0f31f2b8c9fb348e4530b88f6b64f9621f83d6 genetlink: make policy common to family
>>>

I'm slowly trying to work on this, but if someone who knows what they are 
doing wants to just get it done, feel free.

The commit that breaks things was developed on an old enough kernel that 
it was a problem with the compat stuff being out of sync. I'm trying various 
merge points to try to find a good place to test if there is a separate 
problem or if my change for that one is bad. The builds take a while so 
this hasn't been happening quickly.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
