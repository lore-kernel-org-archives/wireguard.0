Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6556C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 22:05:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 371e26d8;
	Thu, 30 Jun 2022 22:02:59 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6b990240
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 22:02:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so132560wme.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmR9nWCJRvx1cVbS1nar4zM5LTb6LzpRfeA+XNWCvW8=;
 b=QSw7SI9wt9Ou0H5un+bB9AHgyuHX8JxAHbkNA1K26di0ntxBw6Xh4YdBBEwuPN+uOp
 4Q80EvkVM/QeoNHGstVX4oPFRbPcow/2G6Pu6ngi8xs01rlf7Gs+k2f8EJRDQdfNNbcK
 usp6CgCfeNS/6kwbmcwHdxxV1p3e6RfKXQC1fvidPTu7gY3Sq9bWFe42WNNPEzVULZUA
 wSYVms5JDpLU4vrP87qMeJu2neN6zTfyYoSQbYwnX2F58WJPIGY/Qc87chpZMQpBcbfm
 pb4qjQyaISQD/THWBzEUir9KzhWQSYqYYHMFyhKXE/fLlEX6IpeygbAj+w6s7sTKQ+1m
 dk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmR9nWCJRvx1cVbS1nar4zM5LTb6LzpRfeA+XNWCvW8=;
 b=m7NiYANR8U/dWHWm1GQ00UuLfP3BJU0CBvdt11RqQuiCDAEH6iX1k9+dOnXtaSuRIG
 +n9hIqEYdBtOzdC37I/1YMgPP2I3LQFXaQuQw4niYsTzxoUqAcZRZxN4gP/GYJ0T3xIV
 tN1xq406AVk6YQeFz3lYzEgA7+hfj2bRfQGLHER+OuZnn7NmwyzUq/Xof73bxtuirC9+
 xMxkLJmSVgagQ+qB+hp6zo3LYc0Nhu7cJ2W5+YTweKiGEsIU/FD4xaqi1YeFoOLZh3pZ
 fhkgDo5ljEMBvCQbI6uDK9sjUC4hbP3BcwZEE8ZxeGikweTN+ft+TowWk1lODsuJmExZ
 N5aw==
X-Gm-Message-State: AJIora8sw3kzfGHgiAhdXlOoQyDrI8q02wSBKgLTqcY8oaRAINRw/ta4
 VxuRD0fV9Ph0xVgN8BjTUHJPV/dMbtUN36/s4y/wdg==
X-Google-Smtp-Source: AGRyM1u72PEELgjnPjS+eqrC3Qje60s8cQXcX86vetUYMQl4XRktkox5UWMrrrm/BS2ATFCsX7adbrMcoP2yK6u7RIg=
X-Received: by 2002:a05:600c:4081:b0:3a0:47c4:8dd0 with SMTP id
 k1-20020a05600c408100b003a047c48dd0mr11967073wmh.178.1656626577281; Thu, 30
 Jun 2022 15:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220630191230.235306-1-kaleshsingh@google.com>
 <Yr3+RLhpp3g9A7vb@zx2c4.com>
 <CAC_TJvdV9bU2xWpbgrQuyrr6ens9gzDnZT2UzAY6Q6ZN9p7aEw@mail.gmail.com>
 <Yr4SQVjBCilyV1na@zx2c4.com>
In-Reply-To: <Yr4SQVjBCilyV1na@zx2c4.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 30 Jun 2022 15:02:46 -0700
Message-ID: <CAC_TJvdZMr7KyUe7ro7jmFT1z5Gs3YbM9dhbL5Yp-weLvd0T3g@mail.gmail.com>
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

On Thu, Jun 30, 2022 at 2:14 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Jun 30, 2022 at 01:41:40PM -0700, Kalesh Singh wrote:
> > Our latest supported kernels in Android are based on 5.15 so the
> > config change isn't yet needed. Once there are newer versions with the
> > CONFIG_ANDROID removed I will add this to the defconfig.
>
> Okay. It might be still worth getting something uploaded to gerrit so
> that it's easy to remember and submit whenever the time comes.
>
> Also, what about android running on mainline? Where does that base
> config live?

I've uploaded the changes on android-mainline [1]. We'll submit there
once the upstream changes are finalized.

[1] https://android-review.googlesource.com/c/kernel/common/+/2142693/1

Thanks,
Kalesh
>
> Jason
