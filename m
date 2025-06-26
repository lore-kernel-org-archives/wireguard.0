Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD43C77B7F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Jun 2025 03:38:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 721fb047;
	Thu, 26 Jun 2025 03:38:05 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ed7d1be
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jun 2025 03:38:02 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R10" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4bSPXR16W9z3TFM;
 Thu, 26 Jun 2025 03:37:59 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R11" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4bSPXQ0t8Dz3ls1;
 Thu, 26 Jun 2025 03:37:58 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1750909078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1tKoSwrJQsbcYq+qY9jWj6OI+RYMT06LdinvFds3WU=;
 b=JyUFICjq9YUgpNaDXmZvlypC2S9PQta5kN/lC5idotuefEpjxoNwJBzJcqz+ajBUfe58pZ
 +HijlwwKWuC4sqNPK7cG88S+cnF0rYTsSVuQeThYxujssK8Ev9v73SnJN+EHOsOzeI8c7F
 CzR+Ix/1SUffe/fzc3vQ3RJ+eXS5O87dmiGdIkvw+IADrBO8QZsRLNZirIGXNPQsU/zuK2
 ijtSgCOv1gU252yBwxSxlm/3VCqKogRPgQ25wV8YEwKvLG1HaOfX4U5QMcdf7qC7pqEOPW
 44aOWKz9/qFFP2ohywaIQ6cQjFA6JwaeCQ1KRHuCpQZolr1vmAvjn71pRhIPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1750909078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1tKoSwrJQsbcYq+qY9jWj6OI+RYMT06LdinvFds3WU=;
 b=vxm0w4ASr8djym2evkXidfdpOMAyXDzaQih5K109swUSaWYfLZMJLukahRGaOBU86q8rMy
 jSkW9bJZe76ZzgSXggSR/Khv0S6FTmyhBXtau1U/1FN0nlhEWkra7ESVaIxKws96L4OdEK
 O45eRB0ZI3ZB3rhjZybgSGc+KJElgc+tZ6CwVtK3TXjnexqHYLzJeoP75rsjxfvqqBHyUA
 ijIDj+NHH/FqBHGNRPvWW5vRrYWN89ZoWfzoaVs13YmjzqXzPvP7i2AAy5bVwD1ldW3t/u
 df77sU7m0XNVafN4rEIGEd2mdzyXytzu8o/5YeXRH3jO9Ep+zVhjC802XeljKw==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1750909078; a=rsa-sha256; cv=none;
 b=Imgy1gWmIix4nziuxiVOvDcZdxRBxBGIfTb0BEDscIA4uwG54yuok0h8GxPblgbDoA97vX
 pwDj+I8bALVoYaEv/gfnCceX7ukiu8Q7TdyFXoD+/FiJUReUWolei2Qheg5xFt1UEprUAa
 MNRCb5DV/ehW7AgJtBLGl1wcz0qZXT+mnqeuJb4/9oy4111FXrdITRCgrdU9sBJxf5lgTk
 YQAcov7txBwOjuTcqETpEBOv+Zyp62HkNxoryS8FCCc+wJbgG53cvMX3JiBxN12jtJXSKx
 w/i9wUe3yEVshNjBrdn49P2TTuT2c004GBxV4pErk6z1MjbMnrBkYJEG/kwjlQ==
Received: from [10.9.4.95] (unknown [209.182.120.176])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: kevans/mail)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4bSPXP0sXSzJJj;
 Thu, 26 Jun 2025 03:37:57 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
Message-ID: <d309fd3a-daf1-4fd5-98aa-2920f50146fd@FreeBSD.org>
Date: Wed, 25 Jun 2025 22:37:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support incremental
 allowed ips updates
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
References: <20250517192955.594735-1-jordan@jrife.io>
 <aCzirk7xt3K-5_ql@zx2c4.com> <aCzvxmD5eHRTIoAF@zx2c4.com>
 <vq4hbaffjqdgdvzszf5j56mikssy2v2qtqn2s5vxap3q5gi4kz@ydrbhsdfeocr>
 <CAHmME9rbRpNZ1pP-y_=EzPxRMqBbPobjpBazec+swr+2wwDCWg@mail.gmail.com>
Content-Language: en-US
From: Kyle Evans <kevans@FreeBSD.org>
In-Reply-To: <CAHmME9rbRpNZ1pP-y_=EzPxRMqBbPobjpBazec+swr+2wwDCWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 5/21/25 18:51, Jason A. Donenfeld wrote:
> On Thu, May 22, 2025 at 1:02 AM Jordan Rife <jordan@jrife.io> wrote:
>>>> Merged here:
>>>> https://git.zx2c4.com/wireguard-tools/commit/?id=0788f90810efde88cfa07ed96e7eca77c7f2eedd
>>>>
>>>> With a followup here:
>>>> https://git.zx2c4.com/wireguard-tools/commit/?id=dce8ac6e2fa30f8b07e84859f244f81b3c6b2353
>>>
>>> Also,
>>> https://git.zx2c4.com/wireguard-go/commit/?id=256bcbd70d5b4eaae2a9f21a9889498c0f89041c
>>
>> Nice, cool to see this extended to wireguard-go as well. As a follow up,
>> I was planning to also create a patch for golang.zx2c4.com/wireguard/wgctrl
>> so the feature can be used from there too.
> 
> Wonderful, please do! Looking forward to merging that.
> 
> There's already an open PR in FreeBSD too.

FreeBSD support landed as of:

https://cgit.freebsd.org/src/commit/?id=f6d9e22982a

It will be available in FreeBSD 15.0 and probably 14.4 (to be released 
next year) as well.  I have pushed a branch, ke/fbsd_aip, to the 
wireguard-tools repository for your consideration.

Aside: this is a really neat feature.

Thanks!

Kyle Evans
