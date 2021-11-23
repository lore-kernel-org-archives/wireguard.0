Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60175C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 13:27:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id af3a990a;
	Tue, 23 Nov 2021 13:27:33 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d11e310f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=TjIhDD45HwLDGFHK4S9zOIRkN0qRdMgiYw+FsCe2OWM=; 
 b=0AK7rtYpFSnxkil9rC2FSvHBkV0ceUQl+vPm0+ECe6NOB9vdt4g9bqwP540drro533Tu73MGawgonQzBmRheEYaE++N+zzlbu76wnFYqgaVXWF8Aaf8DZC2VRhEKa/1BZ8H6vWAXvDGH085p5bV272fHiydZ0yHse7IbyENSmzM=;
Received: from [10.5.44.225] (port=47588 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1mpVpV-0008LT-1k
 for wireguard@lists.zx2c4.com; Tue, 23 Nov 2021 14:27:25 +0100
Received: from [172.22.0.123] (193.238.156.229) by mail.onetrix.net
 (10.5.44.225) with Microsoft SMTP Server (TLS) id 14.1.438.0; Tue, 23 Nov
 2021 14:27:24 +0100
X-CTCH-RefID: str=0001.0A682F1A.619CEC3D.004D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <20c5ff86-be75-b9e2-8dda-0dc5b0ec8f17@chil.at>
Date: Tue, 23 Nov 2021 14:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] wireguard-tools: contrib/reresolve-dns script for
 Windows Powershell
Content-Language: de-AT
To: <wireguard@lists.zx2c4.com>
References: <68de8cb8-81ce-1f51-22fd-9ef20b24f693@online.de>
 <a0506608-2797-7bc2-8786-97678d01832a@online.de>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <a0506608-2797-7bc2-8786-97678d01832a@online.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.238.156.229]
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

Am 23.11.2021 um 11:14 schrieb Max Schulze:
> NB: Why the limit to 15 chars in the Interface name? Mine had more, thus setting the arbitrary (?) limit to 18 chars.

as Aaron Jones pointed out in my thread "Android app: length of name":

on Linux, the length of an interface name (e.g. "eth0") is limited to 15 characters

Kind regards,
Christoph

