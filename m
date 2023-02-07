Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9A5C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 22:10:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88d259aa;
	Tue, 7 Feb 2023 22:10:42 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8de36b71
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:10:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CB1FB81AB4;
 Tue,  7 Feb 2023 22:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9B0C433D2;
 Tue,  7 Feb 2023 22:10:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="k3x+gCPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675807834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KnqJ3oUjWQ4xlI0LNEuPaPwxG0kBK51vaYrn8rQd9E=;
 b=k3x+gCPlu3tViRC3bnUyoYwqrTDJX7R669Wc8iqcLctaX00M9GXGeRZkGSNjYvAqvPJoOD
 q+EsaYy5RaAH3NTgeee9kbn6CRFkAts3wBEJj324QozSNpHw6IbTZHab+UH3fgdYfII3Hz
 QN7vcm4bRo1qllr11ZInrVGnm/0iJfI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b6276f4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 22:10:33 +0000 (UTC)
Date: Tue, 7 Feb 2023 19:10:29 -0300
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christoph Loesch <wireguard-mail@chil.at>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: User on mailinglist that collects addresses to send spam?
Message-ID: <Y+LMVUb1fe6C4uwU@zx2c4.com>
References: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
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

On Tue, Jan 17, 2023 at 12:45:48AM +0100, Christoph Loesch wrote:
> Hi,
> 
> sorry for this unrelated mail.
> 
> I use a separate mail-address for every site/contact who wants my mail-address.
> Just checked my spam-folder and what do I see? a mail from janisa@onertronics.com to my wireguard mail-address which I use only for this mailinglist.
> So I guess janisa@onertronics.com is collecting mail-addresses here and then sending unwanted spam-mails.
> 
> If this user is on this list, I would recommend to remove this address.
> 
> proof: (on request I can also provide full mail headers)

lore.kernel.org archives the mailing list, which preserves full headers:
https://lore.kernel.org/wireguard/5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at/raw

Anybody could subscribe and set up such a thing.

Jason
