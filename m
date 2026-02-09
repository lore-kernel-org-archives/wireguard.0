Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C5EA8118
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Feb 2026 13:49:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b668df9;
	Tue, 10 Feb 2026 13:49:40 +0000 (UTC)
Received: from ojstrica.amebis.si (ojstrica.amebis.si [2a01:260:4101:1464::8])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dbfbd110
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Feb 2026 10:33:06 +0000 (UTC)
Received: from ojstrica.amebis.doma (localhost [IPv6:::1])
 by ojstrica.amebis.si (Postfix) with ESMTP id AE1A630F5F4D
 for <wireguard@lists.zx2c4.com>; Mon, 09 Feb 2026 11:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amebis.si; s=mail;
 t=1770633185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lj7UJzH/rAkCaDY5NLimgwMfJZHvL5TETWnc/kqxYhQ=;
 b=VTBCMTVdDqmm3iErBNkBdtcmwDwZuqpej9iinAZLlQgZImn8ttelzyzgdBMnY0rMfIO3No
 gPzZ9M+JLXRcZmTqYvbvugQ4/rXcmLcHe1cWeybZNs7dT065bbW9p1/4EdQxiFOnOqAyn6
 wqcU2m3KlubnFMCVAhaDyNH8A8xuzuM=
Received: from [IPV6:2a01:260:4101:1464:b1f6:258:7cda:4522]
 ([2a01:260:4101:1464:b1f6:258:7cda:4522])
 by ojstrica.amebis.doma with ESMTPSA id qnFLKOG3iWmnSTcAkOztjA
 (envelope-from <simon.rozman@amebis.si>)
 for <wireguard@lists.zx2c4.com>; Mon, 09 Feb 2026 11:33:05 +0100
Message-ID: <36bfb316-20b0-453e-9a20-e1fc7f8d42c4@amebis.si>
Date: Mon, 9 Feb 2026 11:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: Crash on log save for Windows wireguard-arm64-0.5.3.msi
Content-Language: en-US, sl
To: wireguard@lists.zx2c4.com
References: <CACsAZRTV=nb6fkGS2_=-xBskt0KY6w5bLiXnN4P8RASyhWu9RQ@mail.gmail.com>
From: Simon Rozman <simon.rozman@amebis.si>
Organization: Amebis
In-Reply-To: <CACsAZRTV=nb6fkGS2_=-xBskt0KY6w5bLiXnN4P8RASyhWu9RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Feb 2026 13:49:38 +0000
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

Hi!

This was fixed in 
https://git.zx2c4.com/wireguard-windows/commit/?id=8e6558eba6665b51de35779bffa46803dbc4c10d 
and is pending a release.

Meanwhile, you can `git clone https://git.zx2c4.com/wireguard-windows` 
and run build.bat on any Windows 10+ x64 PC and build it yourself. It is 
super-easy. The installation files will be marked as unofficial and not 
code-signed, but the rest should work.

Lep pozdrav | Best regards,
Simon Rozman
Amebis, d. o. o., Kamnik

On 11. 8. 2025 10.43, George wrote:
> When I click the "Save" button or try to "Save to file" the contents
> of the Log tab in Windows 11 the File Explorer window very briefly
> pops up and then the app crashes entirely.
> 
> I'm not seeing anything in the Event Viewer as far as a log goes for the app.
> 
> Would appreciate any help isolating what may be causing this issue -
> or determining if it's actually a bug that needs to be fixed.
> 
> 
> Appreciate your help!
> 
> -George

