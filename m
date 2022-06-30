Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DFCC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 17:12:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bbb2b6a1;
	Thu, 30 Jun 2022 17:12:43 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 75626011
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 17:12:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e28so23109864wra.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uH3u1IFiXRo5yGbXIVqL1yqXLG2H1E4UXns/GZ0BaVE=;
 b=FZwPzlvJMTMo74Fom19t74AoePXhXeGrkxqDczxBrgAmUE15h7mMgCvqS1RXp6H6dx
 AJN1eEqiyXCQcVtOdWLHOlGOIYCzX0NYupog/3JnG9A7ikhyIHZBFXZVFGEfKGdZCXeY
 zU1hnN1Wdqw7oADY6ZGrKHxwlMGT7A4lHt31aRjqd1iiC/ofThahR164aASaZMojTBSJ
 5NpYz9PQrcA4PgL8kxOVJoX6B1W4Pk4wJyUC923AhZMJ3cMtqn4TGSDOwf2374Xfwolm
 zoFBaFGsi3fEWFmXn2NQWslIpMLfYDFs4g+nzRAXD26K3skmpYuoFUlpgEIDvbWxpRWF
 dGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uH3u1IFiXRo5yGbXIVqL1yqXLG2H1E4UXns/GZ0BaVE=;
 b=NyoJVyMXVJIFsjIo3WBJmKbcoIBGRPoA7OK2GaeN6Y2YmFO4KKRtNpCAWfccNSLjI0
 4fUUAIBh0t5pjQQdNWcWraTu45pB3oX+69pINQxJ+7IsVbElnA3p2ilhrKhTnRLnorW7
 Cvqku7u1+DmFSsViPsNd30lu8Y1M140eAPNTgNPMZOLQyPNVpNyE+uHoDScw3yYzB8Du
 cX1f+3sQPVQms5S0yx9mgKvBWaJ1hadJ4mQLp+gH++7uMhUQmEOnemybMotBLYfTkYqd
 4YIChtZBx6EkVAdOunuLA//kH2xGWtP79/KjoJuxxzzsTf4K0wEZVakph/a0w+OdTJ9f
 DuUw==
X-Gm-Message-State: AJIora+REU8as3iW2nIAN5QDS1u8gGJoINiYQ++DHw3+mhloCIKMaRiX
 0vh1VXwEUlgD8Nc0klkVaQZgbvxuILC0NhiNt0Vo
X-Google-Smtp-Source: AGRyM1szn9LwRU3Nw9ZfHq8EWST1CWq46Cj3fhZE2wtVrKEw7gClyoWnhjeSGDOpCcCwvmQvyhbN8nUX3DDA/n+VcV0=
X-Received: by 2002:adf:ef10:0:b0:21b:8740:7085 with SMTP id
 e16-20020adfef10000000b0021b87407085mr9148009wro.9.1656609160637; Thu, 30 Jun
 2022 10:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <Yrx/8UOY+J8Ao3Bd@zx2c4.com> <YryNQvWGVwCjJYmB@zx2c4.com>
 <Yryic4YG9X2/DJiX@google.com> <Yry6XvOGge2xKx/n@zx2c4.com>
 <CAC_TJve_Jk0+XD7VeSJVvJq4D9ZofnH69B4QZv2LPT4X3KNfeg@mail.gmail.com>
 <YrzaCRl9rwy9DgOC@zx2c4.com>
 <CANDhNCpRzzULaGmEGCbbJgVinA0pJJB-gOP9AY0Hy488n9ZStA@mail.gmail.com>
 <YrztOqBBll66C2/n@zx2c4.com> <YrzujZuJyfymC0LP@zx2c4.com>
 <CAC_TJvcNOx1C5csdkMCAPVmX4gLcRWkxKO8Vm=isgjgM-MowwA@mail.gmail.com>
 <Yr11fp13yMRiEphS@zx2c4.com>
In-Reply-To: <Yr11fp13yMRiEphS@zx2c4.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jun 2022 10:12:30 -0700
Message-ID: <CANDhNCrcEBUUNevNyZp2qttqWssWBEcXMZ5nPO0Ntk7Vszd3bQ@mail.gmail.com>
Subject: Re: [PATCH] remove CONFIG_ANDROID
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, Christoph Hellwig <hch@lst.de>, 
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

On Thu, Jun 30, 2022 at 3:06 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Wed, Jun 29, 2022 at 09:25:32PM -0700, Kalesh Singh wrote:
> > Two concerns John raised:
> >   1) Adding new ABI we need to maintain
> >   2) Having unclear config options
> >
> > Another idea, I think, is to add the Kconfig option as
> > CONFIG_SUSPEND_SKIP_RNG_RESEED? Similar to existing
> > CONFIG_SUSPEND_SKIP_SYNC and I think it would address those concerns.
>
> I mentioned in my reply to him that this doesn't really work for me:
>
> | As a general rule, I don't expose knobs like that in wireguard /itself/,
> | but wireguard has no problem with adapting to whatever machine properties
> | it finds itself on. And besides, this *is* a very definite device
> | property, something really particular and peculiar about the machine
> | the kernel is running on. It's a concrete thing that the kernel should
> | know about. So let's go with your "very clear description idea", above,
> | instead.
>
> IOW, we're not going to add a tunable on every possible place this is
> used.

Hrm. Can you explain a bit more on why you're particularly adamant
against scoping the config to describe the behavior we want from the
kernel rather than describing a "machine property"?  As personally, I
greatly prefer Kalesh's suggestion (as it avoids the same critique one
could make of the CONFIG_ANDROID "flag"), but admittedly this is
bikeshed territory.

Does this preference come out of the too-many-options-in-gpg
antipattern? Or is there something else?


> Anyway if you don't want a runtime switch, make a compiletime switch
> called CONFIG_PM_CONTINUOUS_RAPID_AUTOSLEEPING or whatever, write some
> very discouraging help text, and call it a day. And this way you don't
> have to worry about ABI and we can change this later on and do the whole
> thing as a no-big-deal change that somebody can tweak later without
> issue.

Yeah, this is ok with me, as I don't see much benefit to creating a
userland ABI, as I don't think at this point we expect the behavior to
shift or oscillate at runtime.

thanks
-john
