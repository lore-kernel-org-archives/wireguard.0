Return-Path: <SRS0=rqdY=NZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3CDC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 13:59:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B3761059
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 13:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77B3761059
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfd31b61;
	Fri, 3 Sep 2021 13:59:35 +0000 (UTC)
Received: from mail1.tootai.net (<unknown> [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aac586db
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 13:59:34 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id BA9956081A17
 for <wireguard@lists.zx2c4.com>; Fri,  3 Sep 2021 15:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630677573; bh=uckmG2Kdjz3NkgW0PySvVUhemBgO575qHXsb3yxLsgo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=POxii/6f46QwBmuFWw7moPPaF0on87wQjfXA0nvPM/FgGpUG3Ns45pO5gygKbL2iy
 U2OxK31UaeNCT24URZwDLK+2E/ocn0FO1jyT9Y/r15SAFK//zdbMX0RV1YZKQeCZVc
 E8g2VO5z+8ASMDStujqcRwx0EsIzVrUwiwOfR/mE=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 865596081880
 for <wireguard@lists.zx2c4.com>; Fri,  3 Sep 2021 15:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630677573; bh=uckmG2Kdjz3NkgW0PySvVUhemBgO575qHXsb3yxLsgo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=POxii/6f46QwBmuFWw7moPPaF0on87wQjfXA0nvPM/FgGpUG3Ns45pO5gygKbL2iy
 U2OxK31UaeNCT24URZwDLK+2E/ocn0FO1jyT9Y/r15SAFK//zdbMX0RV1YZKQeCZVc
 E8g2VO5z+8ASMDStujqcRwx0EsIzVrUwiwOfR/mE=
Subject: Re: ipv6 connexion fail - ipv4 OK (SOLVED)
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
Message-ID: <461a963d-c216-b3fc-521d-e45e89ac1191@tootai.net>
Date: Fri, 3 Sep 2021 15:59:32 +0200
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

Hello

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

I got it.

1. you can't use ipv6 IP from the range of /64 (or other) that you 
connect to. As workaround, I build an ULA/64 network to connect both 
ends using one ipv6 from the /64 range of the server to connect
2. once the tunnel is up nothing is shown on wg show until first packet 
arrive. If you try to ping from server to client -which was my case- you 
get an error destination address has to be specified. But as soon as the 
client has send a packet (ping or keepalive), tunnel is open both ways
3. the MTU I have to use is 1436

Thanks all for your help.

-- 
Daniel
