Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AA7C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 17:47:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D0D60698
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 17:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47D0D60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baf2e79f;
	Mon, 30 Aug 2021 17:44:25 +0000 (UTC)
Received: from mail1.tootai.net (<unknown> [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 574a4734
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 17:44:21 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 86E1660818A8
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 19:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630345461; bh=9cEiBNlh7CdeZ63G3YhlcVBzG6I665noIjYkf/tmJN4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=EFBdg+nT+D1D4mIcbkWTYoWRDEECplMlinbxofq+7QJrso3M9FaXq/vk83aZd4Tys
 v2Sp9lH1RNqcPXJ9hZVK+CU7jZ7i1S14dBmjlvTtkepY6g+NMD4DnQ81Knp8yFZBvy
 OnUOmwvGMWDUJcIaU8Ax6JlShL4Q28bpGmeRWjP4=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 5B2136081880
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 19:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630345461; bh=9cEiBNlh7CdeZ63G3YhlcVBzG6I665noIjYkf/tmJN4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=EFBdg+nT+D1D4mIcbkWTYoWRDEECplMlinbxofq+7QJrso3M9FaXq/vk83aZd4Tys
 v2Sp9lH1RNqcPXJ9hZVK+CU7jZ7i1S14dBmjlvTtkepY6g+NMD4DnQ81Knp8yFZBvy
 OnUOmwvGMWDUJcIaU8Ax6JlShL4Q28bpGmeRWjP4=
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
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
From: Daniel <tech@tootai.net>
Message-ID: <e949b3e2-eab7-fc4c-2b15-8820a2c17374@tootai.net>
Date: Mon, 30 Aug 2021 19:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830223836.5384badd@natsu>
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


Le 30/08/2021 à 19:38, Roman Mamedov a écrit :
> On Mon, 30 Aug 2021 19:28:11 +0200
> Daniel <tech@tootai.net> wrote:
>
>> To be sure (and I think it is as I have no problem with ipv4):
>>
>> . my interfaces are named wig4tootai our wigserver Nothing wrong here ?
>>
>> . conf file are not named <interface name>.conf but server.conf or
>> anyname.conf Nothing wrong here too ?
> Interface names are arbitrary. As for proper .conf filenames on your system, I
> am not sure, but you can simply check whether everything looks fine by running
> the "wg" tool.
>
>> Conserning the setup, I made another one using one VPS (one public ipv4 and
>> one ipv6 /64 range) but get the same result. No FW involved at all :(
> Do you get WG working at all, between some other two hosts (not involving this
> particular server for now)?
Yes. Clients are shown on both sides as connected, trafic seems to go 
out on each side but other one as received near to nothing.

-- 
Daniel
