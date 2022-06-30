Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEABBCCA47B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 04:25:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 77952dda;
	Thu, 30 Jun 2022 04:25:45 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7a434a40
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 04:25:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so847796wme.5
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 21:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XF5+1TpNEHAiXDfVWQuBqZGuz8O67KY9U2sjyk0++xA=;
 b=J/ogTuEcBjzc2rb/AX+pBYkVOtdqmFsidowp9idjspZWWtBCu0QpR9Omff+s+WRE4J
 JQqudj/2Cr2qfjcFMt/rm61kR9b0uS6bBZ9XePjS6rge69pJNaxwG4FsPwBmcjgahoIT
 zZ7xrswxi9aUQCIcykenow5cV1Jz6mOyIW2DJheISuKWr7KK/QYsFfFUTz46tTEUfApa
 IsdiNxH21cVIcqCO/V4VZhpjVPJEdc87M9ji/eiTZcXPmWU0DsAVN72/jxdKBCH3gL1n
 EWu/46jkA03D7DfT6mJU1cICL9/sZULYP1olO9hZtpAZ0rLsl247j0otusmUTpKjqAdj
 5pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XF5+1TpNEHAiXDfVWQuBqZGuz8O67KY9U2sjyk0++xA=;
 b=JM4MOHQlYoEGQVvI3uSzxBDRe+m4+iBY+xGX4+mSzj7qZe2+39vz20P3SwjX2iyT5T
 d4rTYt/vlsS0sF/xFIpC1crSQozQCD+10/0+9WEXhTNjQCAY/IqMqMAmRE6NGZFW9lz9
 LcXNM80KDFogXlaxLVlWnmwpOEueK99VMGdIvPpXIrZ+/6vNxLOJxPyxEbf+h5DrS1FT
 XlM2lDjo4ne7YaImGXXrVHLJvVjmljAy6tR419fZ7zequr1h5OlQhMBtxjTI1hD/u+WH
 JCTSk25upPJfO1+KAWBjMREG2FwrilhOSmeoq36sQ+LoReM+IqOahvFQbclvS/0TKyV1
 7otw==
X-Gm-Message-State: AJIora8eCwuItJHsnu1ULXY31DHuq5vhNzGCn/1T0hkWTDC3i5L4QMFI
 BillfVT2tC656Mwx5gJW64O548z9UGOGQcuX1FyAzQ==
X-Google-Smtp-Source: AGRyM1uujfLK/yIN8VLByYx5OAyz3aygJHVOScpq0uxooZ08lDRQ3geR/QBC9YsnqM9Hy0OG7EskPqyOaUSnSkkqoHQ=
X-Received: by 2002:a05:600c:3553:b0:3a0:519b:4b96 with SMTP id
 i19-20020a05600c355300b003a0519b4b96mr7335634wmq.61.1656563143223; Wed, 29
 Jun 2022 21:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <Yrx8/Fyx15CTi2zq@zx2c4.com> <20220629163007.GA25279@lst.de>
 <Yrx/8UOY+J8Ao3Bd@zx2c4.com> <YryNQvWGVwCjJYmB@zx2c4.com>
 <Yryic4YG9X2/DJiX@google.com> <Yry6XvOGge2xKx/n@zx2c4.com>
 <CAC_TJve_Jk0+XD7VeSJVvJq4D9ZofnH69B4QZv2LPT4X3KNfeg@mail.gmail.com>
 <YrzaCRl9rwy9DgOC@zx2c4.com>
 <CANDhNCpRzzULaGmEGCbbJgVinA0pJJB-gOP9AY0Hy488n9ZStA@mail.gmail.com>
 <YrztOqBBll66C2/n@zx2c4.com> <YrzujZuJyfymC0LP@zx2c4.com>
In-Reply-To: <YrzujZuJyfymC0LP@zx2c4.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 29 Jun 2022 21:25:32 -0700
Message-ID: <CAC_TJvcNOx1C5csdkMCAPVmX4gLcRWkxKO8Vm=isgjgM-MowwA@mail.gmail.com>
Subject: Re: [PATCH] remove CONFIG_ANDROID
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: John Stultz <jstultz@google.com>, Christoph Hellwig <hch@lst.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 "Theodore Ts'o" <tytso@mit.edu>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, rcu <rcu@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sultan@kerneltoast.com, 
 android-kernel-team <android-kernel-team@google.com>,
 Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Jun 29, 2022 at 5:30 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey again,
>
> On Thu, Jun 30, 2022 at 2:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > 1) Introduce a simple CONFIG_PM_CONTINUOUS_AUTOSLEEPING Kconfig thing
> >    with lots of discouraging help text.
> >
> > 2) Go with the /sys/power tunable and bikeshed the naming of that a bit
> >    to get it to something that reflects this better, and document it as
> >    being undesirable except for Android phones.
>
> One other quick thought, which I had mentioned earlier to Kalesh:
>
> 3) Make the semantics a process holding open a file descriptor, rather
>    than writing 0/1 into a file. It'd be called /sys/power/
>    userspace_autosleep_ctrl, or something, and it'd enable this behavior
>    while it's opened. And maybe down the line somebody will want to add
>    ioctls to it for a different purpose. This way it's less of a tunable
>    and more of an indication that there's a userspace app doing/controlling
>    something.
>
> This idea (3) may be a lot of added complexity for basically nothing,
> but it might fit the usage semantics concerns a bit better than (2). But
> anyway, just an idea. Any one of those three are fine with me.

Two concerns John raised:
  1) Adding new ABI we need to maintain
  2) Having unclear config options

Another idea, I think, is to add the Kconfig option as
CONFIG_SUSPEND_SKIP_RNG_RESEED? Similar to existing
CONFIG_SUSPEND_SKIP_SYNC and I think it would address those concerns.

--Kalesh

> Jason
