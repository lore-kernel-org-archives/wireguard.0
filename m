Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E36EC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 10:24:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64C860524
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 10:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D64C860524
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 935f50ee;
	Mon, 30 Aug 2021 10:24:07 +0000 (UTC)
Received: from mail1.tootai.net (<unknown> [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b632158
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 10:24:02 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 4D7FB60818AC
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 12:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630319042; bh=fIiL23dzWhlDlsDcZXwByVMtMYsQ6/TxUSJS3at8nqI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bi4W4m3GssJPCJda5BVnrY/awO3QzMWcd4ht1QaLj9GYpsJXpE9RBrDc0fZzEbVSD
 J4Ncy9jgwzp0dYTXoMWnkHnKcp88l9KiIp7w2Do7s/d8YkSEVxenLLq5iPo10OyaIX
 9lLuy6rtT7aIdfyjMLN9tcjkU0jUsEXAWdLRJarQ=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 169326081880
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 12:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630319042; bh=fIiL23dzWhlDlsDcZXwByVMtMYsQ6/TxUSJS3at8nqI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bi4W4m3GssJPCJda5BVnrY/awO3QzMWcd4ht1QaLj9GYpsJXpE9RBrDc0fZzEbVSD
 J4Ncy9jgwzp0dYTXoMWnkHnKcp88l9KiIp7w2Do7s/d8YkSEVxenLLq5iPo10OyaIX
 9lLuy6rtT7aIdfyjMLN9tcjkU0jUsEXAWdLRJarQ=
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
To: wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
From: Daniel <tech@tootai.net>
Message-ID: <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
Date: Mon, 30 Aug 2021 12:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828024454.1766744f@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hi

Le 27/08/2021 à 23:44, Roman Mamedov a écrit :
> On Sat, 28 Aug 2021 07:05:45 +0930
> Mike O'Connor <mike@pineview.net> wrote:
>
>> On a 1500 link I'm having to use 1280 to get ipv6 to successfully go
>> over a wireguard link.
> Then it is not a true 1500 MTU link, something in-between drops packets at a
> lower bar. Or maybe not all of them, but just UDP, for example.
>
> But yeah, 1280 is worth trying as well, maybe Daniel has a similar issue.
>
> As for me I am using MTU 1412 WG over IPv6 on a 1492 MTU underlying link just
> fine.

After lot of few testings, I think the problem is elsewhere. Setup of 
the server:

. eth0 with one public ipv4 IP and ipv6 /64

. 2 tunnels (one gre, one sit), each of them having one ipv4 and one 
ipv6 /64. They take care on trafic from/to our /48 ipv6 range

. 2 tun openvpn interfaces for customers with ipv6 address from our /48 
range

. wireguard interface with ipv6 address from our /48 range

Using tcpdump -i any I see the trafic coming to the gre interface and 
that's all. But netstat show

udp6       0      0 :::12345 :::*                                
0          125391     -

and ps aux output is

dh@peech:~$ ps ax|grep wg
    6969 ?        I<     0:00 [wg-crypt-wig4to]
    7026 ?        I      0:00 [kworker/1:2-wg-kex-wig4tootai]

Question: is wireguard really listening on all ipv6 addresses ? If not, 
how is the address choosen ?

[...]

Thanks for your help

-- 
Daniel
