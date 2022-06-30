Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C88C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 00:36:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 444eb090;
	Thu, 30 Jun 2022 00:30:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f938be47
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 00:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4743161EDA;
 Thu, 30 Jun 2022 00:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FBCC34114;
 Thu, 30 Jun 2022 00:30:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BXiVvpR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656549009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Om9TGEBMR+Wzn2zJmgsRZapqDIU0L40ndqIRFXkV40=;
 b=BXiVvpR5Pi7KTfGbJpg+nPbYbooUIVoLw8eEyN7163dOB1EbnKz7QiBOOJ7JwTc9uncem1
 T4guem7e3CfAIl48sBFQ3KFFRNvt7gnxTMMBQgp1hNBUZJmOxdyIL+L9kpq/gSuFJemdiC
 kD2mYzTnyUGC4GP1T+hK3XTWueOzYtU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 57a083cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 00:30:09 +0000 (UTC)
Date: Thu, 30 Jun 2022 02:30:05 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: John Stultz <jstultz@google.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 rcu <rcu@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sultan@kerneltoast.com,
 android-kernel-team <android-kernel-team@google.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YrzujZuJyfymC0LP@zx2c4.com>
References: <Yrx8/Fyx15CTi2zq@zx2c4.com> <20220629163007.GA25279@lst.de>
 <Yrx/8UOY+J8Ao3Bd@zx2c4.com> <YryNQvWGVwCjJYmB@zx2c4.com>
 <Yryic4YG9X2/DJiX@google.com> <Yry6XvOGge2xKx/n@zx2c4.com>
 <CAC_TJve_Jk0+XD7VeSJVvJq4D9ZofnH69B4QZv2LPT4X3KNfeg@mail.gmail.com>
 <YrzaCRl9rwy9DgOC@zx2c4.com>
 <CANDhNCpRzzULaGmEGCbbJgVinA0pJJB-gOP9AY0Hy488n9ZStA@mail.gmail.com>
 <YrztOqBBll66C2/n@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrztOqBBll66C2/n@zx2c4.com>
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

Hey again,

On Thu, Jun 30, 2022 at 2:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 1) Introduce a simple CONFIG_PM_CONTINUOUS_AUTOSLEEPING Kconfig thing
>    with lots of discouraging help text.
>
> 2) Go with the /sys/power tunable and bikeshed the naming of that a bit
>    to get it to something that reflects this better, and document it as
>    being undesirable except for Android phones.

One other quick thought, which I had mentioned earlier to Kalesh:

3) Make the semantics a process holding open a file descriptor, rather
   than writing 0/1 into a file. It'd be called /sys/power/
   userspace_autosleep_ctrl, or something, and it'd enable this behavior
   while it's opened. And maybe down the line somebody will want to add
   ioctls to it for a different purpose. This way it's less of a tunable
   and more of an indication that there's a userspace app doing/controlling
   something.

This idea (3) may be a lot of added complexity for basically nothing,
but it might fit the usage semantics concerns a bit better than (2). But
anyway, just an idea. Any one of those three are fine with me.

Jason
