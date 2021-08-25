Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FCDC4320E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:02:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAC760F25
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCAC760F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47d43c10;
	Fri, 27 Aug 2021 14:02:04 +0000 (UTC)
Received: from mail1.tootai.net (<unknown> [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de9c427f
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Aug 2021 15:25:54 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 7FAFC60817DE
 for <wireguard@lists.zx2c4.com>; Wed, 25 Aug 2021 17:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1629905154; bh=LJeudx+G2Cp7Dmxa9b1Uq149H81/5mLQauCr5stL+mA=;
 h=To:From:Subject:Date:From;
 b=CCSVzCpfNVMIGp2AmCGCGeEXZG20nGtrBtUNfQNRcMYXM9qjJ7HOWYIckkWaTgRGg
 coRsOLqWWKC7u0okta2e74eMNaxuPn/OyESeZA6vkSlxoEYHdtEzJNdLesz1QLrBpx
 0nwyuuIY5dq1nJVRD4F5+RGgD9B5bG77s8bhDUbE=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 50CA46081880
 for <wireguard@lists.zx2c4.com>; Wed, 25 Aug 2021 17:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1629905154; bh=LJeudx+G2Cp7Dmxa9b1Uq149H81/5mLQauCr5stL+mA=;
 h=To:From:Subject:Date:From;
 b=CCSVzCpfNVMIGp2AmCGCGeEXZG20nGtrBtUNfQNRcMYXM9qjJ7HOWYIckkWaTgRGg
 coRsOLqWWKC7u0okta2e74eMNaxuPn/OyESeZA6vkSlxoEYHdtEzJNdLesz1QLrBpx
 0nwyuuIY5dq1nJVRD4F5+RGgD9B5bG77s8bhDUbE=
To: wireguard@lists.zx2c4.com
From: Daniel <tech@tootai.net>
Subject: ipv6 connexion fail - ipv4 OK
Message-ID: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
Date: Wed, 25 Aug 2021 17:25:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 7bit
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

Hi list,

I setup wireguard on a server running Debian 11 and get it to work with 
2 clients (Debian 11 and Ubuntu 20.04). Clients and server are on 
separate networks, one client behind a FW the other direct on Internet, 
no FW at all (VPS).

With this setup and ipv4 connection to the public IP of the server, 
everything is working as expected, ipv4 as well as ipv6 are passing 
smoothly.

Now I want to connect using the ipv6 address of the wg interface as both 
clients and server have ULA ipv6. This fail, wg show that connection is 
established but VPN is not usable. It's not a FW problem as I can ssh to 
the ipv6 address, as well as a netcat test from/to server IP -from each 
client- on an UDP port is working properly. Also, 
net.ipv6.conf.all.forwarding=1 is activated in sysctl.conf

All network stuff is done in /etc/network/interfaces which call the 
config file. The ipv6 address of the server is affected _to the 
wireguard interface_ (in ipv4 it's another interface who take care of 
the public address)

Server version is wireguard-tools v1.0.20210223.

If someone have any hint, thanks to share ;)
-- 
Daniel
