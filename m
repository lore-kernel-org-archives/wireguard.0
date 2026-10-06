Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D7CA5FED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2026 15:40:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7953b029;
	Tue, 6 Oct 2026 15:40:55 +0000 (UTC)
Received: from mail.philomathiclife.com (mail.philomathiclife.com
 [174.136.97.10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4928d1aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=20260811;
 t=1791301240; x=1791387640; bh=R86rn4cHnZH1LGWa1iuSkN8tKZqILVmPw+PzjFu
 x4kY=; h=in-reply-to:from:references:cc:to:subject:date;
 d=philomathiclife.com; b=Lb2LWEqoDD9lDn/ikOnKKTCeEnHTJMoz5yn6IqezzRm8X
 0N+ik4uA8aW0jWHeXgKP0j3KWi41CINebu7zfG9jlpWvDJLd23JqDPqsLAZnwYQ95sC2t0
 TMo9Bg8h8q4rfJRyZepAoM+0Te0pUThX6limi3mz3hgrNugVE6UKvpsQ2VQ88Rc8kk46qJ
 Zse131c9xTYSaf1HeCd5pVYYENiOVNWyw/rXz7QCaPlW0nI7nhR4R7IeisRP67zdV78TfE
 Sa7G8CtS35Uk1DUiVW6V0B2BI5FQQzqFoSayQhXNhPz7+VTjH+nd1PahDNw2kcaSXVd4Bk
 gTUtpuDSsmWF26npQ==
Received: from laptop.philomathiclife.com (<unknown> [2601:283:4e00:fdd4::2])
 by philomathiclife.com (OpenSMTPD) with ESMTPSA id 98a0f427
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO); 
 Tue, 6 Oct 2026 09:40:40 -0600 (MDT)
Message-ID: <e1255116-a94f-45a6-9450-f873c0c69ac4@philomathiclife.com>
Date: Tue, 6 Oct 2026 09:40:34 -0600
MIME-Version: 1.0
Subject: Re: OpenBSD collaboration/peer-review request
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
 <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
Content-Language: en-US
From: Zack Newman <zack@philomathiclife.com>
In-Reply-To: <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/6/26 5:28 AM, Jason A. Donenfeld wrote:
> Hi Zack,
> 
> Of course I'd be happy to work on this. Do you (or someone else) want
> to jump on a video call and we can share screens and you can show me
> the stuff you think I should be looking at?
> 
> Jason

Hi Jason,

Unfortunately it appears the devs aren't interested in continued 
collaboration or even using the Linux implementation as a rough guide. I 
was told privately to just "go use Linux" by Theo in his typical Theo 
way; and that's in fact what I've decided to do for my machines that are 
reliant on WireGuard since I demand reliability, compatibility, and 
security for something as important as a VPN.

I'm sorry I can't be of more help. I'm not sure how this affects the 
status of wireguard-openbsd. The WireGuard implementation in OpenBSD is 
certainly active, but the wireguard-openbsd repo itself is quite a bit 
different than what is actually in the kernel. Over the last five years 
there have been issues with WireGuard in particular with its mbuf 
handling. I wish the devs would have continued their collaboration, but 
such is life.

Anyway, feel free to disregard my request; and thank you for your time.

Zack
