Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED43C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 20:41:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 98c397ea;
	Thu, 30 Jun 2022 20:41:54 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 745508b3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 20:41:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id cl1so277915wrb.4
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6sxgvUgX/lE05DRaRDrj2PDjJhleRoRRDvjJlfkAEzg=;
 b=GZYjjHKfVCa+9zANi+gEoiM5SSOKOGDkVkDe96gkOxIAHoB7CZIO/YgR4LY48B9PT6
 ZYIxvmRzX9/oZ9OVThsoJ3x6/jtWmvKCmj55r7O9XNary8Z+YA71JG1/7w2y1jswy8Fa
 DUNp5eCuf3t1wycrDiBa8yTy/Qluga4rZcDmiX8XJi/PepFFuBWfc0HRW1jeSfA7pTiy
 1fHCyUP398gvCkEE1aqi0roDUYpIMNQrTPjMwCLMvEvJU5WtHddYn0FmQwrd1coZiTCd
 843Vj2wDV01tIemZ6LaCV8aXVHynHFeU90CWZmsrm2zQTvIE8/lsZPr7gcUPBKWd6isB
 rdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sxgvUgX/lE05DRaRDrj2PDjJhleRoRRDvjJlfkAEzg=;
 b=penAaGdqxMsXt9EAspV4oGHGzTVZxzALKAn6PZpf3AH7vOcVBWYiBVaKHjTTrzOMo/
 fBwVf7WgxiB+mAcSsL3IxnM3jsaIiNW1q/A4v9YSosJ+yuQMEKzBHD3qXGS69rVoPco5
 Oj1zLLxAgYmw9jzh4Y2t4zn/OiK+QDjw4utwBPLMp7gyK8BwjZn0e1Y5p2tvDlZFI4Br
 GSo5uUZ4TCJsM7CYCLR07OhvKu6fqxKzkMxkOdf+XQDYgJGqLuvR3VPqto0Ovd5Czm64
 Em4Dtof+pdFY8aB8wXXJz7LsRXBIUF0WQehEbu2unNPEt3Y2AgGzbX7F49a5BiXcJSZe
 GwOQ==
X-Gm-Message-State: AJIora9kf4qB3btNfbduEEoHNYId4WTxmZCoNtiWFf8gED/yK6Efgt1k
 yrJIqOL/PgiJWMthOsW4Zv9ScPX9YSgtFR/SVAD4Bg==
X-Google-Smtp-Source: AGRyM1tPLbfsN2BJnOcFOWFvfQT8AJ8Pw9fqyeaUEOZa832kPW4lB+7bPTChF3jB0KOvv6fyB662Q1iQc2L8Imbuj7A=
X-Received: by 2002:a05:6000:508:b0:21d:4105:caf9 with SMTP id
 a8-20020a056000050800b0021d4105caf9mr3367565wrf.699.1656621711704; Thu, 30
 Jun 2022 13:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220630191230.235306-1-kaleshsingh@google.com>
 <Yr3+RLhpp3g9A7vb@zx2c4.com>
In-Reply-To: <Yr3+RLhpp3g9A7vb@zx2c4.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 30 Jun 2022 13:41:40 -0700
Message-ID: <CAC_TJvdV9bU2xWpbgrQuyrr6ens9gzDnZT2UzAY6Q6ZN9p7aEw@mail.gmail.com>
Subject: Re: [PATCH] pm/sleep: Add PM_USERSPACE_AUTOSLEEP Kconfig
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: John Stultz <jstultz@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Saravana Kannan <saravanak@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 "Cc: Android Kernel" <kernel-team@android.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Len Brown <len.brown@intel.com>, 
 Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-pm@vger.kernel.org
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

On Thu, Jun 30, 2022 at 12:49 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Kalesh,
>
> On Thu, Jun 30, 2022 at 07:12:29PM +0000, Kalesh Singh wrote:
> > Systems that initiate frequent suspend/resume from userspace
> > can make the kernel aware by enabling PM_USERSPACE_AUTOSLEEP
> > config.
> >
> > This allows for certain sleep-sensitive code (wireguard/rng) to
> > decide on what preparatory work should be performed (or not) in
> > their pm_notification callbacks.
> >
> > This patch was prompted by the discussion at [1] which attempts
> > to remove CONFIG_ANDROID that currently guards these code paths.
> >
> > [1] https://lore.kernel.org/r/20220629150102.1582425-1-hch@lst.de/
> >
> > Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
>
> Thanks, looks good to me. Do you have a corresponding Gerrit link to the
> change adding this to the base Android kernel config? If so, have my
> Ack:
>
>     Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Hi Jason,

Our latest supported kernels in Android are based on 5.15 so the
config change isn't yet needed. Once there are newer versions with the
CONFIG_ANDROID removed I will add this to the defconfig.

Thanks,
Kalesh

>
> Jason
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
