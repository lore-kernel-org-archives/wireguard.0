Return-Path: <SRS0=215W=DT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A96C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 19:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B260C20878
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 19:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="RuAn0YxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B260C20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8c33573;
	Mon, 12 Oct 2020 19:21:35 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d895ef70
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 19:21:33 +0000 (UTC)
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4C98XS3Sz8zFfWB;
 Mon, 12 Oct 2020 12:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1602532488; bh=RUOtAZq5niqXL/d0SaYWErHAiIEXdLWsorJjUb3NtbA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RuAn0YxKqQwAb/OdbtbdYLNSWfWSv8DP8YEqm6syPoQLBBa3DZgCJW6aYfDzjwklt
 B/s4sVDLXGNUxpI/dShnfGH4/J8lZAqQp+u6e32xXb4ENp14AFbVGEW87mISUqvSXt
 bUv918XiVI9q78lHazLOu7NM5Wfz+19Zyj3ohVic=
X-Riseup-User-ID: 9364832F56243EB680B19931BBE6723A08F3C7CAEBF47417F75037E47C559EBE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 4C98XP4nlGzJqp1;
 Mon, 12 Oct 2020 12:54:40 -0700 (PDT)
Subject: Re: [PATCH] wg-quick linux: Add strip-and-eval cmd to extract keys
 from PostUp
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
 <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
 <b1955eb8-bc38-770c-848d-540c6c13bfbc@riseup.net>
 <CAHmME9q0WPQYavB7cnJCcTfYYTafnJ3WxsswP33tv27C7+BMZw@mail.gmail.com>
From: Robin Schneider <ypid@riseup.net>
Message-ID: <4870a998-bab9-14a7-0447-29f74322eca6@riseup.net>
Date: Mon, 12 Oct 2020 21:54:35 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0WPQYavB7cnJCcTfYYTafnJ3WxsswP33tv27C7+BMZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2020-10-12 17:01, Jason A. Donenfeld wrote:
> On Sat, Oct 10, 2020 at 5:58 PM Robin Schneider <ypid@riseup.net> wrote:
>> The proposed workaround has two issues:
>>
>> 1. It does not allow to replace the PrivateKey or PresharedKey using the `syncconf` now from the config file which is what I want to have.
>> 2. It only outputs the PrivateKey and not the PresharedKey for each peer. Sure, this could be done with a for loop.
> 
> Sounds like something easily achievable with scripting.
> 

So you suggest to write a 3party script instead of putting it into wg-quick? Because a inline script with support for all of this wound not exactly be a one-liner :) Could such a script be included in the wireguard-tools?

-- 
Live long and prosper
Robin `ypid` Schneider -- https://me.ypid.de/
