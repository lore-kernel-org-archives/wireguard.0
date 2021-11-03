Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73601C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 20:55:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B82F6109F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 20:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B82F6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=deze.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e202bec9;
	Wed, 3 Nov 2021 20:52:43 +0000 (UTC)
Received: from tampoco.espindola.nl (tampoco.espindola.nl [149.210.133.191])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f6d542b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 20:52:41 +0000 (UTC)
Received: from [192.168.68.249] (drawbridge.espindola.nl [62.251.122.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: frank-deze)
 by tampoco.espindola.nl (Postfix) with ESMTPSA id 2C4E33C01A5;
 Wed,  3 Nov 2021 21:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deze.org; s=default;
 t=1635972761; bh=0NdtzNeCVvt9q1JezqoATHKikCmDn4VwMnrHISJC1VQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rsoQGOPDAXOl/l4wdqdc89x6jY2np/zeGKxXl4j7uTqKlVzsb1TH2mahGL83qf9cl
 97p5PRPUNd/1yXeq9KWeddSHur/udmVlX5piV35F3aoxBmkdLXb0hc1Cx7IrNPPJy+
 tGhrgPWyLy4gZ1BhJ9eUvRKQJuXvscvuPWnMT1XTPurMiFqtFC4auFZBFPQczsaw8P
 dCqJmjP0D5aARFK+tshxnqCcMPMu4kzDVry1z1XoTa91sytRERb8QLpafcFY0d07rx
 d79SSI84g3gghAIi+sC6AnGQcpAa2d51i4hAuL1d7qT9JKHDkhJ+WZq7RJhEaO0JFo
 1RvGKqffHCiFQ==
Message-ID: <3b364170-7a7e-d9aa-d365-fe0ce3390acd@deze.org>
Date: Wed, 3 Nov 2021 21:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Wireguard on FreeBSD - a few questions
Content-Language: en-US
To: Kyle Evans <kevans@freebsd.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <cfddc41d-0768-af1a-d527-d2bccd5cfd56@deze.org>
 <CACNAnaE8DrntMR0RifxNzijLWfBXNHxm2poSY-DewOQszP-XqQ@mail.gmail.com>
From: Frank Volf <frank@deze.org>
In-Reply-To: <CACNAnaE8DrntMR0RifxNzijLWfBXNHxm2poSY-DewOQszP-XqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hi Kyle,
>> 1) Is it possible on FreeBSD to enable some kind of logging? I did made
>> a small configuration error with my first client and it was hard to find
>> the error, because there does not seem to be any logging at all.  Some
>> logging information would be appreciated and probably wold have pointed
>> me faster to the fact that I needed to switch two keys in my config.
>>
> If you set 'debug' on the interface (`ifconfig wg0 debug`) then it'll
> write some useful bits to syslog for your perusal.

O.k. good to know this. It would be even better if this was documented, 
I think a if_wg manual page for FreeBSD would be appropriate.

>> 2) I noticed that Wireguard uses a wildcard to listen to all IP
>> addresses on my multi-homed machine on his dedicated UDP port. I would
>> prefer if Wireguard would only bind to the specific IP address on the
>> outside interface that is designated for that use. Is this possible?

I think it is useful if you could bind Wireguard  to use/listen on a 
specific IP address, instead of the wildcard.
For example, for my tests I used a secondary (alias) IP address on a 
server as the entry point for Wireguard tunnels.
However, if the server starts a session to the client (or tries to check 
if the client is still alive), it uses the primary interface address 
instead.
Binding it to a specific IP address would solve this.

Kind regards,

Frank

