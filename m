Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC18C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 23:37:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 974d6f09;
	Fri, 10 Dec 2021 23:33:50 +0000 (UTC)
Received: from quad.pendre.co.uk (quad.pendre.co.uk [92.27.241.245])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e413de41
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 23:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTP id BC5D69600F8
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 23:33:48 +0000 (GMT)
Received: from quad.pendre.co.uk ([127.0.0.1])
 by localhost (quad.pendre.co.uk [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Xi8nG3eWwYRq; Fri, 10 Dec 2021 23:33:48 +0000 (GMT)
Received: from [192.168.0.1] (quad.pendre.co.uk [192.168.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTPS id 345969600DA
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 23:33:48 +0000 (GMT)
Message-ID: <46de3fe6-b355-41c3-d92e-dfdffb163dd9@elrepo.org>
Date: Fri, 10 Dec 2021 23:33:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Cannot add wg0 on CentOS 8
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <1877736804.292900.1639046846065.ref@mail.yahoo.com>
 <1877736804.292900.1639046846065@mail.yahoo.com>
From: Phil Perry <pperry@elrepo.org>
In-Reply-To: <1877736804.292900.1639046846065@mail.yahoo.com>
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

On 09/12/2021 10:47, Mehdi Haghgoo wrote:
> Hi,
> 
> I'm trying to add  a wireguard device on CentOS Stream (was Linux just converted to Stream).
> When I enter "ip link add wg0 type wireguard" or try it using wg-quick wg0 up, I get the following error:
> 
> RTNETLINK answers: Operation not supported
> 
> I have wireguard-tools and kmod-wireguard installed.
> Additional information:
> 
> uname -r: 4.18.0-147.8.1.el8_1.x86_64
> 
> wg --version: wireguard-tools v1.0.20210914 - https://git.zx2c4.com/wireguard-tools/
> 
> kmod-wireguard version: 1.0.20211208
> 
> 
> Best regards,
> Mehdi

Is the wireguard module loaded? I doubt it.

You are running a *very* old kernel, and I suspect the version of 
kmod-wireguard you are running does not support that kernel. Why are you 
running a kernel that is two years out of date and full of unpatched 
security holes? Updating your system is probably the first step to 
fixing your issue.

