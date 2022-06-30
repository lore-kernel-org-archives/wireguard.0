Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D3C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 00:39:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b0f692aa;
	Thu, 30 Jun 2022 00:37:16 +0000 (UTC)
Received: from relay3.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dac12cc0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 00:37:14 +0000 (UTC)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 8B03D20F1B;
 Thu, 30 Jun 2022 00:37:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id 2C2422000E; 
 Thu, 30 Jun 2022 00:36:58 +0000 (UTC)
Message-ID: <306dacfb29c2e38312943fa70d419f0a8d5ffe82.camel@perches.com>
Subject: Re: [PATCH] remove CONFIG_ANDROID
From: Joe Perches <joe@perches.com>
To: Kalesh Singh <kaleshsingh@google.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?=
 <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen
 <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian
 Brauner <brauner@kernel.org>, Hridya Valsaraju <hridya@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Theodore Ts'o <tytso@mit.edu>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, Josh Triplett
 <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>,  Lai Jiangshan
 <jiangshanlai@gmail.com>, Shuah Khan <shuah@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, rcu <rcu@vger.kernel.org>,  "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sultan@kerneltoast.com, android-kernel-team
 <android-kernel-team@google.com>, John Stultz <jstultz@google.com>,
 Saravana Kannan <saravanak@google.com>, rafael@kernel.org
Date: Wed, 29 Jun 2022 17:36:57 -0700
In-Reply-To: <CAC_TJvcEzp+zQp50wtj4=7b6vEObpJCQYLaTLhHJCxFdk3TgPg@mail.gmail.com>
References: <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
 <YryNQvWGVwCjJYmB@zx2c4.com> <Yryic4YG9X2/DJiX@google.com>
 <Yry6XvOGge2xKx/n@zx2c4.com>
 <CAC_TJve_Jk0+XD7VeSJVvJq4D9ZofnH69B4QZv2LPT4X3KNfeg@mail.gmail.com>
 <YrzaCRl9rwy9DgOC@zx2c4.com>
 <CAC_TJvcEzp+zQp50wtj4=7b6vEObpJCQYLaTLhHJCxFdk3TgPg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2C2422000E
X-Stat-Signature: 5uw4as89t5pkeunkfxcmzb44pcsr5u8p
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mY8RNBqVwD0Nf7RscHoGyDK+vPHNZ/5M=
X-HE-Tag: 1656549418-319526
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

On Wed, 2022-06-29 at 16:19 -0700, Kalesh Singh wrote:
> On Wed, Jun 29, 2022 at 4:02 PM Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> > On Wed, Jun 29, 2022 at 03:26:33PM -0700, Kalesh Singh wrote:
> > > Thanks for taking a look. I'm concerned holding the sys/power/state
> > > open would have unintentional side effects. Adding the
> > > /sys/power/userspace_autosuspender seems more appropriate. We don't
> > > have a use case for the refcounting, so would prefer the simpler
> > > writing '0' / '1' to toggle semantics.
> >=20
> > Alright. So I've cooked you up some code that you can submit, since I
> > assume based on Christoph's bristliness that he won't do so. The below
> > adds /sys/power/pm_userspace_autosleeper, which you can write a 0 or a =
1
> > into, and fixes up wireguard and random.c to use it. The code is
> > untested, but should generally be the correct thing, I think.
> >=20
> > So in order of operations:
> >=20
> > 1. You write a patch for SystemSuspend.cpp and post it on Gerrit.
> >=20
> > 2. You take the diff below, clean it up or bikeshed the naming a bit or
> >    do whatever there, and submit it to Rafael's PM tree, including as a
> >    `Link: ...` this thread and the Gerrit link.
> >=20
> > 3. When/if Rafael accepts the patch, you submit the Gerrit CL.
> >=20
> > 4. When both have landed, Christoph moves forward with his
> >    CONFIG_ANDROID removal.
> >=20
> > Does that seem like a reasonable way forward?
>=20
> Sounds like a plan. I'll clean up and repost your patch once the
> Gerrit change is ready.

trivial note:

> > diff --git a/kernel/power/main.c b/kernel/power/main.c
[]
> > @@ -120,6 +120,23 @@ static ssize_t pm_async_store(struct kobject *kobj=
, struct kobj_attribute *attr,
> >=20
> >  power_attr(pm_async);
> >=20
> > +bool pm_userspace_autosleeper_enabled;
> > +
> > +static ssize_t pm_userspace_autosleeper_show(struct kobject *kobj,
> > +                               struct kobj_attribute *attr, char *buf)
> > +{
> > +       return sprintf(buf, "%d\n", pm_userspace_autosleeper_enabled);

This should use sysfs_emit no?

