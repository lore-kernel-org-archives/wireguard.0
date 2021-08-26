Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F222C4320E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F00660F44
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F00660F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99d464ef;
	Fri, 27 Aug 2021 14:02:08 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7866fb7e
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Aug 2021 11:14:02 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 8E84360817DE
 for <wireguard@lists.zx2c4.com>; Thu, 26 Aug 2021 13:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1629976441; bh=UcNku1piJUmP+ZlCg85t3WSgnC/2OyORFTH04cRNUEg=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=qHoFNbuS95uKNPQgvIE12wPzNamLqKaaZ3ZXpuXyDRWoiYdbIzXqBImAIi8h/2gr+
 9e2gV6B3FDNZgOiOLt39Rh2aDMCCYbMu1cCG6UQ6GxJ/YyaJOPUq4UXu87NA1vYc3h
 TJbF8onY0kgnLlEmBd4JgF5lkjtP6Oo7EOTOQHHo=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 543A76081880
 for <wireguard@lists.zx2c4.com>; Thu, 26 Aug 2021 13:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1629976441; bh=UcNku1piJUmP+ZlCg85t3WSgnC/2OyORFTH04cRNUEg=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=qHoFNbuS95uKNPQgvIE12wPzNamLqKaaZ3ZXpuXyDRWoiYdbIzXqBImAIi8h/2gr+
 9e2gV6B3FDNZgOiOLt39Rh2aDMCCYbMu1cCG6UQ6GxJ/YyaJOPUq4UXu87NA1vYc3h
 TJbF8onY0kgnLlEmBd4JgF5lkjtP6Oo7EOTOQHHo=
Subject: Re: ipv6 connexion fail - ipv4 OK
From: Daniel <tech@tootai.net>
To: wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
Message-ID: <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
Date: Thu, 26 Aug 2021 13:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 27 Aug 2021 14:01:58 +0000
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

Correction

Le 25/08/2021 à 17:25, Daniel a écrit :
> Hi list,
> 
> I setup wireguard on a server running Debian 11 and get it to work with 
> 2 clients (Debian 11 and Ubuntu 20.04). Clients and server are on 
> separate networks, one client behind a FW the other direct on Internet, 
> no FW at all (VPS).
> 
> With this setup and ipv4 connection to the public IP of the server, 
> everything is working as expected, ipv4 as well as ipv6 are passing 
> smoothly.
> 
> Now I want to connect using the ipv6 address of the wg interface as both 
> clients and server have ULA ipv6.

Here is GUA to read.

> This fail, wg show that connection is 
> established but VPN is not usable. It's not a FW problem as I can ssh to 
> the ipv6 address, as well as a netcat test from/to server IP -from each 
> client- on an UDP port is working properly. Also, 
> net.ipv6.conf.all.forwarding=1 is activated in sysctl.conf
> 
> All network stuff is done in /etc/network/interfaces which call the 
> config file. The ipv6 address of the server is affected _to the 
> wireguard interface_ (in ipv4 it's another interface who take care of 
> the public address)
> 
> Server version is wireguard-tools v1.0.20210223.
> 
> If someone have any hint, thanks to share ;)

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
