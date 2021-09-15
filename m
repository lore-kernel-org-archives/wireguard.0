Return-Path: <SRS0=hlHF=OF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BE2C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Sep 2021 08:13:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94CF9610FF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Sep 2021 08:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94CF9610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e4da41c;
	Wed, 15 Sep 2021 08:13:39 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5641f470
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Sep 2021 08:13:35 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id A4C7B60818A8
 for <wireguard@lists.zx2c4.com>; Wed, 15 Sep 2021 10:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1631693614; bh=Xk3met+MbSyR7OSgFIvseT9P4g1o2aPcG/82GTTBdnM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ibr8r4jjDzswocyCWWKqdcmdWHxmWY1UuVN2xt6vNq/tTc6Zqaapz6RZMNqfagTpE
 RysCC9Du2Tinh5gZGgQmKoemIGc7e/vJJg7CpZbVqdPdxCmmtjwykDl/Sp4HMkVD3m
 DQASyCJ6zvB8gUP8uRAhCUDDxMPJmL9GPjf698pc=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 6D5136081880
 for <wireguard@lists.zx2c4.com>; Wed, 15 Sep 2021 10:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1631693614; bh=Xk3met+MbSyR7OSgFIvseT9P4g1o2aPcG/82GTTBdnM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ibr8r4jjDzswocyCWWKqdcmdWHxmWY1UuVN2xt6vNq/tTc6Zqaapz6RZMNqfagTpE
 RysCC9Du2Tinh5gZGgQmKoemIGc7e/vJJg7CpZbVqdPdxCmmtjwykDl/Sp4HMkVD3m
 DQASyCJ6zvB8gUP8uRAhCUDDxMPJmL9GPjf698pc=
Subject: Re: icmp6 on wireguard iface responded by iface lo
To: wireguard@lists.zx2c4.com
References: <3c3e142f-99b2-732b-2912-2889d6c09a69@tootai.net>
From: Daniel <tech@tootai.net>
Message-ID: <db59a485-c736-9750-9b6b-773b43fa4325@tootai.net>
Date: Wed, 15 Sep 2021 10:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3c3e142f-99b2-732b-2912-2889d6c09a69@tootai.net>
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

Le 14/09/2021 à 18:45, Daniel a écrit :
> Hi all,
>
> I use wireguard between 2 Debian11 and face a problem: traffic goes in 
> to wireguard interface/ip address but goes out with lo as interface 
> with the right ip address
>
> 19:23:50.287492 wig0 In IP6 fd99:1234:beef:cafe:fade::7000 > 
> fd99:1234:beef:cafe:fade::7fff: ICMP6, echo request, id 18272, seq 5, 
> length 64
>
> 19:23:50.287509 lo In IP6 fd99:1234:beef:cafe:fade::7fff > 
> fd99:1234:beef:cafe:fade::7000: ICMP6, echo reply, id 18272, seq 5, 
> length 64
>
> Any clue on this ?

Problem is in kernel vue of routing

ip route get fd99:1234:beef:cafe:fade::7000 from 
fd99:1234:beef:cafe:fade::7fff
anycast fd99:1234:beef:cafe:fade::7000 from 
fd99:1234:beef:cafe:fade::7fff dev lo table local proto kernel src 
fd99:1234:beef:cafe:fade::7fff metric 0 pref medium

After

ip route replace fd99:1234:beef:cafe:fade::7000 from 
fd99:1234:beef:cafe:fade::7fff dev wig0 table local

evrything is going back to normal behavior.

Thanks for your support

-- 
Daniel
