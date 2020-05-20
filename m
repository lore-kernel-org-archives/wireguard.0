Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A36C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:53:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E091320709
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dd-wrt.com header.i=@dd-wrt.com header.b="XJ1CFCTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E091320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73fdbeed;
	Thu, 21 May 2020 01:38:43 +0000 (UTC)
Received: from mail.as201155.net (mail.as201155.net [185.84.6.188])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7ea5e1d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 13:07:12 +0000 (UTC)
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:46342
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1jbOfD-0004mK-05
 for wireguard@lists.zx2c4.com; Wed, 20 May 2020 15:21:39 +0200
X-CTCH-RefID: str=0001.0A782F21.5EC52E84.00B9, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=BOhTb3tWUNiYJJTyH9NqX6QMRx5QWB5evUOyvtBqfqE=; 
 b=XJ1CFCTbZJEdveuyuvA8vOf1Vp734DZGWFR929wMqlsQN9yJFt9T0v5M2PLGhPkylsjFp/tFKNiZe/7w595yMlF4mqhuSOPVQ4WhL9ROxdvkPK8rBAq8U/y7w6Lxj2foQNs0JF3nxOYDF8OgEPs4XblCqeO0O0g0q1ZGhCG41TM=;
Subject: Re: Wireguard is broken by recent ubuntu 18.04 kernel update
To: wireguard@lists.zx2c4.com
References: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <f38d592b-3ea8-91ff-99d4-63ed4f2ba1e0@dd-wrt.com>
Date: Wed, 20 May 2020 15:21:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101
 Thunderbird/77.0
MIME-Version: 1.0
In-Reply-To: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Received: from [2a01:7700:8040:4000:f846:4861:fc39:f688]
 by webmail.newmedia-net.de with esmtpa (Exim 4.72)
 (envelope-from <s.gottschall@dd-wrt.com>) id 1jbOb7-0007Tk-R8
 for wireguard@lists.zx2c4.com; Wed, 20 May 2020 15:17:25 +0200
X-Mailman-Approved-At: Thu, 21 May 2020 03:38:39 +0200
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

current kernel update today broke wireguard-compat compile due a api 
backport change. i'm sure it will be fixed soon by jason

Am 20.05.2020 um 15:14 schrieb Vasili Pupkin:
> The system is Ubuntu 18.04.4, and wireguard is broken in recent kernel 
> update "5.3.0-53.47~18.04.1"... not sure why 18.04.1 is landed on 
> 18.04.4 system
>
> # ip link add dev wg0 type wireguard
> Error: Unknown device type.
>
> And nothing is shown by "lsmod | grep wireguard' and "dmesg | grep 
> wireguard"
>
> I've tried "apt install --reinstall wireguard" and "update-initramfs 
> -u -k all" with no luck.
>
> Everything works fine with kernel 5.3.0-51
>
>
