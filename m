Return-Path: <SRS0=Gm1R=NW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A141CC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Aug 2021 17:52:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7597B60698
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Aug 2021 17:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7597B60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3c59c33;
	Tue, 31 Aug 2021 17:50:21 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28cd5910
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Aug 2021 17:50:17 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id E5B0560818BE
 for <wireguard@lists.zx2c4.com>; Tue, 31 Aug 2021 19:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630432217; bh=eVOTqlvcYl/4Pc6Oss5RjkZBQlWUO+WACs2j9xIhtUU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=HGnqqYVgKaI2AYBfQ6mPUodqE88XxqYHbNL4gtohHHubfEJ2hX+5k0ztMNn3t9ABo
 fZoqMu1/Pym/2FKKhBDlQwCAxstWggBvTqKDqOsGg8nljqTd02LonS8vbPUgfC6IGP
 cWlYpcE/8/NdElvrs3QRzvlwnfeusHDbC//J2bbQ=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id B76326081880
 for <wireguard@lists.zx2c4.com>; Tue, 31 Aug 2021 19:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630432216; bh=eVOTqlvcYl/4Pc6Oss5RjkZBQlWUO+WACs2j9xIhtUU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=i4fvrElHBTRK5VT2dHCrS+sCZD5rORYmBINF0GY7tDAW4PLgnyaAcid4osp/5+VOz
 eR5Q8ub5Zqkmrbkfizo3+iyt+mbL5rD82VBmaPsdy98V1CWb/qx4603wXO5PiY28oN
 PKfesAePsSGtKTtIDhkeOAtAJyv0aq/GeIJDRqbU=
Subject: Re: ipv6 connexion fail - ipv4 OK
To: wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
 <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
 <20210830214312.6a332333@natsu>
 <e620ed11-2664-fa06-1497-a0f18facac7e@tootai.net>
 <20210830223836.5384badd@natsu>
 <e949b3e2-eab7-fc4c-2b15-8820a2c17374@tootai.net>
 <20210830225927.6df90edb@natsu>
From: Daniel <tech@tootai.net>
Message-ID: <d7095107-050f-2075-00cb-fdaa86d6daf5@tootai.net>
Date: Tue, 31 Aug 2021 19:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830225927.6df90edb@natsu>
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

Le 30/08/2021 à 19:59, Roman Mamedov a écrit :
> On Mon, 30 Aug 2021 19:44:21 +0200
> Daniel <tech@tootai.net> wrote:
>
>>> Do you get WG working at all, between some other two hosts (not involving this
>>> particular server for now)?
>> Yes. Clients are shown on both sides as connected, trafic seems to go
>> out on each side but other one as received near to nothing.
> I mean not just "shown as connected", but have you got actual traffic working
> between any two hosts. Even just forgetting this server for a while. So that
> you can rule out some general issue and concentrate on just the particular
> machine setup.

I went a step further. Server has a /64 on eth0, his address being .1/64 
Interface I gave to wireguard is called wigserver and get .a2/64 as 
address when up. Now I start the client which is a .24/64 while tcpdump 
-ni any udp and port 38194 is running on the server. Output is

19:28:45.790295 eth0  In  IP6 2001:db8:16e:10::24.50012 > 
2001:db8:c2c:7c50::a2.38194: UDP, length 148
19:28:45.790629 eth0  Out IP6 2001:db8:c2c:7c50::a2.38194 > 
2001:db8:16e:10::24.50012: UDP, length 92
19:29:06.572059 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
2001:db8:16e:10::24.50012: UDP, length 148
19:29:11.947969 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
2001:db8:16e:10::24.50012: UDP, length 148
19:29:17.324065 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
2001:db8:16e:10::24.50012: UDP, length 148

As you can see, the original request is going to the right IP which 
respond with the right source IP (line 1 and 2) From here, all packets 
are going out with the IP of eth0 not the one from wigserver which is 
.a2/64. The client has "allowed ips = 10.99.98.0/27, ::/0"

Remember, no FW involved. Before this test I bring up interfaces without 
wireguard configuration and did server/client test like nc -lu IP PORT 
on the server while on the client I used nc -u IP PORT Everything worked 
well. I also started the client while server was not running and got the 
ICMP6 respons "unreachable port" sended to the client. I also tried to 
tell to the client to connect to the .1/64 insteed of the .a2/64, didn't 
work

If someone had an idea on what's going on here, would be helpful ;)

-- 
Daniel
