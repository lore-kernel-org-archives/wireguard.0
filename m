Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42181CCA47E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 23:30:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9de21705;
	Wed, 29 Jun 2022 23:10:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9b2386f9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:56:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 467BD61E23;
 Wed, 29 Jun 2022 16:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13837C341CB;
 Wed, 29 Jun 2022 16:56:45 +0000 (UTC)
Date: Wed, 29 Jun 2022 12:56:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christoph Hellwig <hch@lst.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arve =?UTF-8?B?SGrDuG5uZXbDpWc=?=
 <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen
 <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian
 Brauner <brauner@kernel.org>, Hridya Valsaraju <hridya@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Theodore Ts'o <tytso@mit.edu>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, Josh Triplett
 <josh@joshtriplett.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <20220629125643.393df70d@gandalf.local.home>
In-Reply-To: <20220629164543.GA25672@lst.de>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
 <20220629164543.GA25672@lst.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 29 Jun 2022 23:10:40 +0000
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


[ Note, I'm not on the Android team and my response has nothing to do with
  my employer. I would say the same thing with my previous employer. ]

On Wed, 29 Jun 2022 18:45:43 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Jun 29, 2022 at 06:38:09PM +0200, Jason A. Donenfeld wrote:
> > On the technical topic, an Android developer friend following this
> > thread just pointed out to me that Android doesn't use PM_AUTOSLEEP and
> > just has userspace causing suspend frequently. So by his rough
> > estimation your patch actually *will* break Android devices. Zoinks.
> > Maybe he's right, maybe he's not -- I don't know -- but you should
> > probably look into this if you want this patch to land without breakage.  
> 
> And it will also "break" anyone else doing frequent suspends from
> userspace, as that behavior is still in no way related to
> CONFIG_ANDROID.

Should there then be a CONFIG_FREQUENT_SUSPENDS ?

That is, if you have system where you know that there will be a lot of
frequent suspends coming from user space, then you would enable it.

I agree, calling this ANDROID is not related to the functionality change.
But if there was a config that was related, would that be acceptable?

Then it would not just be Android that could enabled this change, but any
other system that is doing frequent suspends?

-- Steve
