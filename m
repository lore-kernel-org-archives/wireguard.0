Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jan 2022 09:02:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 15f29d5f;
	Fri, 28 Jan 2022 09:02:49 +0000 (UTC)
Received: from mail.aixigo.de (mail.aixigo.de [2001:67c:13b0:ffff::60])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id db7ad331
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jan 2022 09:02:47 +0000 (UTC)
Received: from mailhost.ac.aixigo.de (mailhost.ac.aixigo.de [172.19.96.11])
 by mail.aixigo.de (OpenSMTPD) with ESMTPS id 5da10eb2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jan 2022 10:02:47 +0100 (CET)
Received: from [172.19.97.128] (dpcl082.ac.aixigo.de [172.19.97.128])
 by mailhost.ac.aixigo.de (8.15.2/8.15.2/Debian-22) with ESMTP id
 20S92kj03054353; Fri, 28 Jan 2022 10:02:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aixigo.com;
 s=default; t=1643360566;
 bh=JzWMpioDyG+dX1SHrcgiuK36Mg0vltc3vUPiQhtE4cs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EEqiehUN43tNYo0eVjdf1Q/83VG68n9lniDX53M2YNcjPZXl3sQc84LfaS4qsKgxn
 77fzk3PRutxosmwoWbS6RXL0RBTAUGYOqKDvJnaFp2sbMdpMA1Ba2HML2kJM29dpz7
 eOWuQOrAkRkuAtKaGSlLPf3YCAJZDio5Xh0hyAuE=
Message-ID: <5210b28a-2912-d1ec-457b-7fd88f480241@aixigo.com>
Date: Fri, 28 Jan 2022 10:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Split DNS for macOS
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <20211028071638.88001-1-stephen@slarew.net>
 <16E7589D-F36A-4CCD-A388-EA435C8A8D95@slarew.net>
From: Harald Dunkel <harald.dunkel@aixigo.com>
In-Reply-To: <16E7589D-F36A-4CCD-A388-EA435C8A8D95@slarew.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
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

On 2022-01-28 06:23:29, Stephen Larew wrote:
> 
> I would appreciate some feedback from the WireGuard maintainers on next steps. Thanks ahead.
> 

Metoo. Testers wanted?


Regards
Harri
