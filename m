Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B0DC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Apr 2022 07:46:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b4fcc5ed;
	Thu, 14 Apr 2022 07:46:48 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [2607:f8b0:4864:20::542])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8a6ccfcd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 07:46:46 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id q12so4077420pgj.13
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=UZZKp/Sicw9+n5gNdMqScWpKCpGcGbPgJMoj+qcK4/Q=;
 b=kzsD+81k9OvmR+jrQNvqg9EBH/ykXG9OYn6987xXRge+YLn6lwgVjI73qmMPU0lXZg
 0WJzYlMKylq+z4EB1h5ibCWPkmPHAG9U3663cx5EXEzxq4IROhDlek1LmMV8LLOjEqer
 mn/z84bzBuj7TWCPXQfgQuqQZwtfifksGtS9cfkjJvIIuSZdUQmTGzKob8o8DR2Rp8W5
 y7JC9Hx32VVxn3z59Tlkywi1gGldnN2B0o95Gl8dccjWHXddCONosEAevCThEYNqKVYw
 cfn0NcUU4kDjIm/lZmAyMenF/EhFC685SwH+noHryPWlTkeu0P44loKMP4LVGJMhHbyf
 HuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UZZKp/Sicw9+n5gNdMqScWpKCpGcGbPgJMoj+qcK4/Q=;
 b=nOFYg1CfaeGn69vPq0oUeYYv5up0tvcIVAu4Iiqrb4xcSgHuVHwaDxXXITPYgia7C5
 j1Q9Coo1Lwu0vvZczm9px+n8h/exZcS6bvJdVsTP8VIxfbE/qKqD71yZfS7AuzEjLiNp
 VX461fDMi1rAeOQN+myCeXpP2sRAPOu0gbNpW0Ng2PnCCPh5VLWgqXR5+Pl4CDnQBed6
 ExiPqR5G/Wkh6AKKPh9joaYNM2YbaAaEJLXgP4GA6vjJRPCuqRIhafP4ww8bnWWiCuTz
 1axvMpJ+gWXIZvwOdCsdQq1ncjlnwHbLYjfWbO41cSnPKe1U79HvRrbw5oxJdes7TknK
 6Kxw==
X-Gm-Message-State: AOAM533JXi2LF26hlK1UhiY917mOvTtoTf2dRxCi/LiU0+nD8MOhHL7z
 urEnmjPrnoNM7G/FDnouNB8g0c7x+dHg5up+OqEigzFM
X-Google-Smtp-Source: ABdhPJyX57xIy51wjtxGqWUaayIrbg26wi2caKnuVABa5gBOtBI/5SHEmSrD3kwwA2NX/FSGyauhL0kcBKxnGGpWC4A=
X-Received: by 2002:a63:4862:0:b0:385:fb1d:fc54 with SMTP id
 x34-20020a634862000000b00385fb1dfc54mr1320375pgk.57.1649922404657; Thu, 14
 Apr 2022 00:46:44 -0700 (PDT)
MIME-Version: 1.0
From: Dan George <dgeor8@gmail.com>
Date: Thu, 14 Apr 2022 17:46:33 +1000
Message-ID: <CAMTegST6Q826cFt8m5wWeFNQGK5tqvVPQSaB8WBO9+7naHfFjQ@mail.gmail.com>
Subject: [wireguard-apple] Reresolving DNS on device wake/network
 change/interval
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hello,

Is there any way when using the macOS WG apps to reresolve DNS for an
endpoint on device wake, a network change event, or at a regular
interval?

Two options I've come across:
- there's a TODO (B.4) to integrate the App Store app with wg(8) which
would potentially allow the use of reresolve-dns.sh (but not yet).
- scutil --nc can bounce the VPN interface in Network Preferences,
which reresolves DNS, but this is disruptive to traffic. Perhaps a
launchd script to run this on device wake/network change would be a
good-enough solution.

Any other options out there?

Thanks,
Dan.
