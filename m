Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC9FC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 14:39:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f225f8d;
	Sun, 19 Feb 2023 14:39:53 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e3d4d9d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vy9AZ9TP7k6Ky83hDI2uR9VCD1VUj+295RVGhF5LCTc=; b=WUSb2s3+zqSI+TmjJuSn84W+cU
 xjJOjPgUdMy9PHEjSzNxjcMb6HtssLSMcpAwnQF/IZze1XPC7tSgPTYuYm2bDEOShclaGUYO6cOz0
 djHbSBT/KL3fIFkD1zah/GOG1xJbdMvDWu/ZIBjQkEQbZtCWrU9rfoM2IAYETs+GN0lI=;
Received: from [10.5.44.225] (port=27936 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.96) (envelope-from <mail@chil.at>) id 1pTkqW-0000Ck-1o
 for wireguard@lists.zx2c4.com; Sun, 19 Feb 2023 15:39:40 +0100
Received: from [172.27.0.87] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Sun, 19 Feb 2023 15:39:20
 +0100
Message-ID: <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
Date: Sun, 19 Feb 2023 15:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Source IP incorrect on multi homed systems
Content-Language: de-AT
To: <wireguard@lists.zx2c4.com>
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <87ttzhc0jt.fsf@ungleich.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.44.244]
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

Hi,

I don't think no one wants to fix it, there are several users having this issue. I rather guess no one could find a suitable solution to fix it.

@Nico: did you try to delete the affected route and add it again with the correct source IP ?

as I mentioned it in https://lists.zx2c4.com/pipermail/wireguard/2021-November/007324.html

ip route del <NET>
ip route add <NET> dev <ALIAS_DEV> src <SRC_IP>

This way I was able to (at least temporary) fix this issue on multi homed systems.

Kind regards,
Christoph

Am 19.02.2023 um 13:13 schrieb Nico Schottelius:
> Hey Sebastian,
>
> Sebastian Hyrwall <sh@keff.org> writes:
>
>> It is kinda. It's been mentioned multiple times over the years but no one seems to want to fix it. Atleast you should be able to specify bind/src ip in the
>> config. I gave up WG because of it. Wasn't accepted by my projects security policy since src ip could not be configured.
>>
>> There is an unofficial patch however,
>>
>> https://github.com/torvalds/linux/commit/5fa98082093344c86345f9f63305cae9d5f9f281
> the binding is somewhat related to this issue and I was looking for that
> feature some time ago, too. While it is correlated and I would really
> appreciate binding support, I am not sure whether the linked patch does
> actually fix the problem I am seeing in multi homed devices.
>
> As long as wireguard does not reply with the same IP address it was
> contacted with, packets will get dropped on stateful firewalls, because
> the returning packet does not match the state session database.
>
> Best regards,
>
> Nico
>
> --
> Sustainable and modern Infrastructures by ungleich.ch
