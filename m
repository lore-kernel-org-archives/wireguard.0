Return-Path: <SRS0=/ntC=GS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9845C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 14:24:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8565623772
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 14:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8565623772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e14fc483;
	Fri, 15 Jan 2021 14:21:56 +0000 (UTC)
Received: from mx1.de-vri.es (mx1.de-vri.es [2a01:7c8:aab4:33e::4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03d6fba2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de-vri.es; s=voyager; 
 t=1610720512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/luu9YSYiu5fOVw4OlUzx5K/uV5wcQiAdnLe+RVry4=;
 b=EsHnXdShBdSEs03Loit9tbnaA7z2gY5RUsECr5k/eEBW80BtU417KA29bH0t/Ph+LIk1cl
 LhJXJeOW7qTS7PCR/4Euz7S76Wj257USKz/4srS5TFWJS0APyynwSbc2T+bcEfsxjigCv7
 6lSBs6OiYmpjLf5ACep/kroP4JQAGejYfcpW5UW3fzPE58kcSCBcUyFMIoO68ytIQB0S13
 baC1tGz/sywi7Kv7x8IHT7c8dmQvWVNcJ9JFXBnS+6q9gG1eN+ONm3lz6b2S0PhSdciRc1
 PgSKp9FvaUUaePJtBMKukwHkPvQxbYGFE8a0LQWJylYrKmFp+Ylpb1OxTxzUlt7UG1ZPGb
 fWrpB5k6a70WMLTQ/RG6lz95x/KdO/Esicx8ik77V2o66IixuMLKwNNdVoptZknLm9CQXK
 QuWyTAtbiIEntkBd+D5dbi00qeNkbKnGp857/PDdnbxXEzZdZfhTbMNCdFD8wioSwVmcu9
 LAuncuzs2gocduo/xtWe40hDDUag/bg08/3nU1ZYplohLt7nahgByFdCa8TTM5BPzYOjM4
 oHw0m0osOP0htIhBWyTOjfQ73m2Wy7iQh2p8Psk6CxeB8O5W9YxKy+L3VgPgg9ybV+TVli
 J2lJbyj/C3PHtC7LuNdE67alBTtdBP046KJVVSZtmWTcN2J6J4oW4=
Received: from [10.13.1.1] (83-86-162-32.cable.dynamic.v4.ziggo.nl
 [83.86.162.32]) by voyager (OpenSMTPD) with ESMTPSA id afc5b53e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 15 Jan 2021 14:21:52 +0000 (UTC)
Subject: Re: Multiple Clients behind NAT
To: Riccardo Paolo Bestetti <pbl@bestov.io>,
 "Posegga, Joachim" <jp@sec.uni-passau.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <C8J1PKLM140S.1TQXP9KUN0QDH@enhorning>
From: Maarten de Vries <maarten@de-vri.es>
Message-ID: <275695ad-bc63-01a6-18d0-6e9f410ec352@de-vri.es>
Date: Fri, 15 Jan 2021 15:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <C8J1PKLM140S.1TQXP9KUN0QDH@enhorning>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 14-01-2021 18:09, Riccardo Paolo Bestetti wrote:
> On Wed Jan 13, 2021 at 9:14 PM CET, Posegga, Joachim wrote:
>> I am trying to connect multiple wireguard clients behind the same
>> NAT-Gateway to a Mikrotik server with a public IP. I am not yet sure
>> where exactly the problem is, but it seems that only one client at a
>> time can establish a tunnel.
> I don't know much about Mikrotik, but my guess is that it's not
> randomizing source ports for packets egressing the NAT.
>
> If that's the case, since WireGuard uses the same port for both source
> and destination, and since your clients are all connecting to the same
> server (and thus port), then your NAT can't demux incoming packets, and
> it just sends them all to the same client. (It probably picks the first
> one that sends egress packets, until it hits some inactivity time-out).

WireGuard doesn't have to use the same local port for all clients. In 
fact, if you don't give a ListenPort explicitly, an ephemeral port is 
assigned. This could theoretically still conflict between clients on 
different machines, but it is unlikely to happen in practice.

If NAT is broken, it should be fixed anyway, but letting WireGuard use 
ephemeral ports would also likely solve the problem in practice.


Kind regards,

Maarten

