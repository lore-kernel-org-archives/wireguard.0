Return-Path: <SRS0=I5vT=PG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82161C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 13:50:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A686E21019
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 13:50:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="IgC/stvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A686E21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05093a06;
	Sat, 29 Dec 2018 13:48:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6b7ebeb
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 13:48:11 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d8093e4
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=Dafn3yH+bJastzHSP5axH1TWioqCKag3XqMp/15ppmE=; b=IgC/stvieW2Qd9MR8+5JVkQpUP
 3yEKws1O9pZOOJcnNy1J7DW9bqaVwHdmnwDCKbBvKtZ9hBO8jI59yb0tM3P/ySsc7DAdVOLxLmp4D
 XvUQzVnXk//JbxxrwaJM0+xGLhWQ6IZ9v+iR7loHx4zPPzMRXLSauSF3/IclCTOInBnBs2Yr7zbYm
 luTRm/HFe3eTiYAzHUM6lQkG+o5nhsQu6dx1qIgjv3S4Yv8O/MhsOl4z8phsANZ1dRCNzTA6Yonz+
 pqIB34i51JigDGEZ8XomUzWNmb1a5KeaCxzdRPvLtrumjfLHU5JWTWb51m2OPa2OLk00Q5o7Uw0Y6
 ENSzvPj6MOH5P7tSFikNfQuTJhrRUgm0G2gQHXtunXB6R5nWAt0zOszZKKoL5MPDCIKLgSe550faO
 sMvm6yNtja22CjyjLRHS1cVGRTp0UKsXzURtjuhN+MOWht38Lvw/3+YZBEFOWh2CD+qZ3ZjnBnpci
 7P85pZ4JjlPq3JKUgAJm6J3g0FcPvbyFXwWzpVfGrb1vIjCP5tM+l12baolXXZvC1mZdCJggoTeS3
 w4NflO/9esY2k3tck1uUv/0Oyh9y04gbz6oz3OdLB1xRa4zYkfcBvsvyIdr+ytwmxFFlZlQ7veIr+
 9Y49Lyk3EaJx8uMbKQnlCcDvPQMyiXcutyPcJYZao=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gdF03-0001v0-3b
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sat, 29 Dec 2018 14:50:01 +0100
Subject: Re: Android and Manjaro road warriors behind dynamic IP
 addresses/Carrier Grade NAT?
To: wireguard@lists.zx2c4.com
References: <52b0449f-930a-87b0-e3f2-42d3f251e9cf@bartschnet.de>
 <d00751e2-569b-f1fb-a4dc-6cd9000c8269@activezone.de>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <fb40366a-6e67-e155-48a8-89a8714dff19@bartschnet.de>
Date: Sat, 29 Dec 2018 14:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <d00751e2-569b-f1fb-a4dc-6cd9000c8269@activezone.de>
Content-Language: en-US
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

Hi Markus,

that's what I thought about, too. It means to add another authentication system (SSH) and fiddle around on Android smartphones.

Is there any way for Wireguard peers with static IP addresses to push endpoint information of all connected peers to all other peers?
Or at least a hook which allows to dump changing endpoints into a file in real-time?

The optimal solution would be to integrate something like https://github.com/manuels/wireguard-p2p (DHT + hole punching techniques) into Wireguard itself.

Addressing by public keys and resolving IP-addresses/ports by a DHT would even make Wireguard John-Doe-compatible. ;-)

Regards,

Renne



Am 29.12.18 um 13:53 schrieb Markus Grundmann:
> Hi Renne,
> 
> for this reason I use a jump server based on SSH in the middle of the
> nodes.
> 
> <snip>
> [authorized_keys]
> no-port-forwarding,no-X11-forwarding,command="~/bin/poll .my-ip ; cat
> ~/.remote-ip" ssh-rsa AAAAB3N ...
> </snap>
> 
> After you have received the IP addresses you can use "wg" to set the new
> endpoint address on both nodes. The small script named "/bin/poll" uses
> the environment variables of SSH to wrote the current IP into a file.
> 
> Best regards,
> Markus
> 
> On 29.12.18 13:16, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
>> Hi,
>>
>> we have Android and Manjaro road warriors which are often behind
>> internet sockets with dynamic IP addresses AND Carrier Grade NAT.
>>
>> Does anyone know a trick how to initiate a direct Wireguard connection
>> between to road warriors without knowing their endpoint IP addresses/ports?
>>
>> Regards,
>>
>> Renne
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
