Return-Path: <SRS0=mzR4=ED=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E90C388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACD62223C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pregonetwork.net header.i=@pregonetwork.net header.b="NfAl0dee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ACD62223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d73aa8f3;
	Wed, 28 Oct 2020 00:02:51 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6e9a873
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Oct 2020 15:11:45 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id 55bf3297
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Oct 2020 17:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=postfix;
 bh=kpbSEvZczqsp/VdO2bny6FdQ0HI=; b=NfAl0deeTp1dBM0BNc5fNTbHq+A0
 yBtLuz+YZWV+Av0b5jjSF26dLmQzP9wy6jb7FGb97puRxXBfMyIvnY8o1pwan3BT
 4jl7Zt6Dq9qSHidcmRhF7p5XoSYIaUuOwhx6Zg5YAy1rc8pLHoEtzS1RSwj6dTh8
 yEwpTOEl2k3uZYaLXL5nT7enzvom9d0TqfK3xSPwGNZofYsaT9wd4xKWHTNffr3n
 ePdDc3KRrvCUr03IVPs1jOhR6xzb7hpxXbW732QrDXjXwm71ALZE/AOA5QQfhEnU
 3cEh73PZE/d/1crfj8bb+FbI4TgCmTGmjXt6i665sHK/uoBIkvYrPyReHA==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=subject
 :to:references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=postfix; b=ndC
 8QFSi+frlljC4ODMxOoxrT2ngPqVfhQZloifnsfi8e+1LcdH7UaVRgEwC+dqA5rX
 KTqktMoMOqOt6iUhrlYlOJV7XM1aXYMdy00dF4jK1Ft+LYksH0MxG8nWRFXF+e70
 I/bgG0b5EpSrF8s2KSozbe1XzDpndDHYeoxf8nH+YZbJ6LZRPPdWPpNTnidhgifI
 BpTuf2WSdJzX7gtfsmgwopB6oQuNj5DMBtue+EFfftkJ/BTpJ5gyu65uyGkPfOOf
 ZY6J7cQtihLBhf37tWGaOSRg6cB0m1Gm9ose3lToIZu/WqWaAvm6ILN+U/rPhm9r
 XzWDJiBKKy6B1Pz9yXw==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id 0ac2236d
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Oct 2020 17:12:12 +0200 (CEST)
Subject: Re: Weird behavior with IPv6 on Windows
To: wireguard@lists.zx2c4.com
References: <CAC=m+TjA+J8RqsiLwJWXtNoFvPUJ0xVHS=UKVUUeh=2yRz8yqA@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
Message-ID: <bb45a39b-4408-4a99-dc45-b29ddaec2f58@pregonetwork.net>
Date: Fri, 16 Oct 2020 17:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAC=m+TjA+J8RqsiLwJWXtNoFvPUJ0xVHS=UKVUUeh=2yRz8yqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
X-Mailman-Approved-At: Wed, 28 Oct 2020 01:02:50 +0100
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

hello,

this is because you are using an ip in fdXX: XX: XX. this kind of IPV6
has a lower priority than IPV4. suddenly, if there is an A record, it
will have priority over AAAA. it does not come from wireguard.

Jerem
Le 15/10/2020 à 14:04, Enzo A a écrit :
> Hello everyone,
>
> First of all, thanks a lot for developing and maintaining Wireguard.
> It really is an amazing product!
> I am running with a strange issue with Wireguard on Windows. When my
> tunnel is enabled, DNS-resolving hosts that are in AllowedIPs results
> in the A (IPv4) record of the (sub)domain being resolved over the AAAA
> (IPv6) record, which gets ignored when wireguard is enabled.
> The intended behavior is that the AAAA record always gets resolved in priority.
>
> Here is my client config: https://del.dog/easocerran.txt, and here are
> also some screenshots of an example ping showing the issue:
> https://imgur.com/a/dnlg6nd
>
> Thanks!

