Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C5AC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Nov 2021 09:22:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7725daa0;
	Tue, 30 Nov 2021 09:22:42 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b0204e0b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Nov 2021 09:22:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o20so83542302eds.10
 for <wireguard@lists.zx2c4.com>; Tue, 30 Nov 2021 01:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjybnMadbLpri/v8WdQiCFUE9CUKXguyzU80wy2j2oU=;
 b=nyzUrKSdc7WYmsXAQ6/iM301N+FDrgFNwmo+7Wmj1pz5xiRfXNAR6O0eD2u6VtjGxM
 6Z9xa08d2R9d/rjaucjvAYXwhrhisQb9sGbSFKfAxDJykVbDa9RWMmD0CXPVEMqHoemY
 4DEc5wihH7wQfCZrPNbEKz3q50rKuUDlUpdQ1iifB6qGd6Mnby/sZgvUqVmvEN7Y6mcQ
 EtRk2MYBakc57CJ+kR1DhMzIu6Mek3IA4+gFUwQycdf1IV88uxCFzgxi1FmtYp2wLT+B
 AnMzVsGOZifYHiJresYapDqvphToRnIH7kn+W3oaTtp9scXjAN/eS+5pXWH7gdKAyiYU
 mrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjybnMadbLpri/v8WdQiCFUE9CUKXguyzU80wy2j2oU=;
 b=pxg9VATA+6sC1wEUtW/GpCmmCZA3D/PDNdbZkWBYxIlQJVcdY1daIbW5RlxRXtoEWb
 w1U1yvYx1L/jFZ4zzfrjUofWgaBzsBOeYLDBmOQZuRmYHZ+P+lxAvWhsfWS7b+jpfmx+
 1XcPaJC+9Qg/V6Cdu5zgGk6aM/Z1JdotaLeV6LDXVpZ891TAd6u93JpEZ2PWjCznyPou
 oMQi0irlk6AHUmf01HWAEwoK0bSN33zKRIPdWnAvAjfSWkStYTcEFQu1wC5881hCF9uD
 JEZL2hbEs0GX5t9lWIVYDq1eNa+BaqPLfBplF/MCYcYILnol4zZt/OMmzMd9xGK6Wpz3
 ZcFA==
X-Gm-Message-State: AOAM533IYTVjRnAgg6+LDzPN5rZWPNAIa2w7CWrkv5ufB8rLXy/mlkGD
 kZXEph/9jY/GrgLSp2L8c99QfZX4IC6FMdHegInsXPZFYB0=
X-Google-Smtp-Source: ABdhPJz25jGU13bsu6kDkfAG3zVsi1+gBzyrLLSUifxQEUPTTm00NCiC92az23+ToKRF9Gm5hWuNB7OeWEeXHiqdhQM=
X-Received: by 2002:a17:906:730f:: with SMTP id
 di15mr65780902ejc.22.1638264160773; 
 Tue, 30 Nov 2021 01:22:40 -0800 (PST)
MIME-Version: 1.0
References: <d83162a4-05bf-22f1-f8de-7ec183ed9173@ceidem.com>
In-Reply-To: <d83162a4-05bf-22f1-f8de-7ec183ed9173@ceidem.com>
From: Marios Makassikis <mmakassikis@freebox.fr>
Date: Tue, 30 Nov 2021 10:22:29 +0100
Message-ID: <CAF6XXKWbYasBFCp5-Fyqp_g-13sXbZvRmVfvve7nKwi7vH60Ng@mail.gmail.com>
Subject: Re: Ubuntu client OpenBSD server
To: Chris Eidem <ceidem@ceidem.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Nov 29, 2021 at 4:45 PM Chris Eidem <ceidem@ceidem.com> wrote:
>
> I have a Wireguard server set up on an OpenBSD 6.9 server with OpenBSD,
> Android, iOS and Ubuntu clients. All clients are connecting, although
> the Ubuntu clients only work when the PSK is not enabled in the wg0.conf
> file. Has anyone else seen this behavior? Is there any information I
> could provide to help figure out why the PSK isn't working on my Linux
> clients?
>
> I don't know if wg uses the system's TLS libraries, but if so, I suspect
> that the fact gnutls and libressl don't play well together may have
> something to do with it. But, that is a guess pulled from my fundament...
>
>    - chris
>

wg doesn't use TLS libraries at all, so the issue is somewhere else.
Have you checked that the PSK is the same on both ends ?

Which kernel version are you using ?

Enabling debug logs on both ends may shed some light on what is
going on. On OpenBSD, enable using the command:
  ifconfig wgX debug
To disable:
  ifconfig wgX -debug

On Ubuntu, enable using:
  echo 'module wireguard +p' > /sys/kernel/debug/dynamic_debug/control

and disable with:
  echo 'module wireguard -p' > /sys/kernel/debug/dynamic_debug/control
