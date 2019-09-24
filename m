Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C03AC4320D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188342082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=glexia.com header.i=@glexia.com header.b="DwTUWzD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188342082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=glexia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 254436b9;
	Wed, 25 Sep 2019 08:50:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id faa3bbe1
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 11:50:30 +0000 (UTC)
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fa5920d
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 11:50:30 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 107so445217uau.5
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glexia.com; s=google;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc; bh=WW/NAJZlUhdlxul2EBB6DenZq3MXRQ+Aq1tNfsSGZXw=;
 b=DwTUWzD5j+HmtJsxniNdR4n9YpB4pWrepYb5oDD77jsnhxMo9+EtLOVOfPUgeOtwiD
 6PwAdCZFzl+dnVoJCqo4ebizqkgXEAXB8eXfV84IHx2ajwVteh4t6sl3d5yOn4JkdHJU
 WZPkHcCDyuWvc3m5vDO2zhNhfQsjV02NzGk2VZUpjFJZ+S+nutrjvlwPITgAU3G3K/NS
 ROgZtWK2rUy86SKHkKxPWOJSyiQf1N2Q3F6N7N9OAFnXWYkphYIrBOihWFOrCLQO0OBl
 NLDYKOpfQMIGOpDj7iPgB7CiZ5oIz0MgTOzHZ0Fz8ifo2132YLP5upAZrt4Gw8F5oYFn
 CDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc;
 bh=WW/NAJZlUhdlxul2EBB6DenZq3MXRQ+Aq1tNfsSGZXw=;
 b=dNwxSUS+4Ko282UFeh+AYgJLlnTGDNOqFxtBqvAdfSDA73lslcI2jSk3yOY2KN3WGY
 4iKGpgmKnS1dnSFZXN9EDThaUamRdIsj2yhgNWwXS6NHn4N9XijtvwnnkU4M03wLE0Ui
 8iBZdlxTlgrmMqHqwLz60jNoyruFnUnTP7+0AU7k7Tc/LIr634BWV8V4+QD85lI3nitd
 0d3m6VPIWFwhQF7r9oV9We4R5Y0QWhomAlIigewMhG1GPa+wzulmbZJGyD8q+ss74X34
 m5d+vesYAUXfdSIeXln8F2UdsCavYMsLTISBa+c7ZXIWG2SNaACJ7BEV/tznf21n9jS3
 HNNw==
X-Gm-Message-State: APjAAAXhv8DiIEJYSs5ubfeVLed3R6sy8wenAzwFwfANNkRUlQCuWDEl
 UQFPJjoQOsAUvl1B4Pcl/yaeNWb7mo+hcZ67FE3h7w==
X-Google-Smtp-Source: APXvYqye0TTOSIT/5I0iys6GcBjhCZ1uDUzegssa4d3t7XuHNmWRjVeNQWxWEvEDzgbjgsZ+KHVjkdJ5Q0UbkEqSiBU=
X-Received: by 2002:a9f:366a:: with SMTP id s39mr1203814uad.91.1569325829300; 
 Tue, 24 Sep 2019 04:50:29 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Tue, 24 Sep 2019 04:50:28 -0700
From: Michael Williams <michael.williams@glexia.com>
Mime-Version: 1.0 (1.0)
References: <CAHmME9qeF2ScwZwqNwZ3oVYC8zDOt5Sa4UkYsn-q+SkG7JhFcw@mail.gmail.com>
In-Reply-To: <CAHmME9qeF2ScwZwqNwZ3oVYC8zDOt5Sa4UkYsn-q+SkG7JhFcw@mail.gmail.com>
Date: Tue, 24 Sep 2019 04:50:28 -0700
Message-ID: <CAGj=18F6jFwb==AmNvCiREj3L+okhUNogx-0SPKrn4bRhGNbWw@mail.gmail.com>
Subject: Re: breakage in policy routing on 5.3 and 5.3.1
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:50:01 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thank you Jason! This makes more sense as the issue did not appear
until the system reboot which would be consistent with the kernel not
WireGuard upgrade. Much appreciate your response.

Sent from my iPhone

> On Sep 24, 2019, at 04:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi folks,
>
> FYI, upstream Linux broke aspects policy routing in 5.3. This isn't
> specific to WireGuard, but rather the policy routing engine in
> general, but users of the wg-quick(8) bash script for configuring
> networks might run into this if they're routing a default route and
> have IPv6, because the bash script makes use of policy routing.
>
> I sent two patches upstream to fix bugs introduced with 5.3:
> https://lore.kernel.org/netdev/20190923144612.29668-1-Jason@zx2c4.com/
> https://lore.kernel.org/netdev/20190924073615.31704-1-Jason@zx2c4.com/
>
> The latter one appears to mitigate the problem, as confirmed by Arch
> Linux users: https://bugs.archlinux.org/task/63870
>
> I'll update this thread when we know more from the netdev mailing list.
>
> Thanks,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
