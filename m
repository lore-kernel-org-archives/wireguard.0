Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDA4CCA47C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 17:20:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id df75a870;
	Wed, 29 Jun 2022 17:19:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 01e6b99f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 17:19:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6DAFB82475;
 Wed, 29 Jun 2022 17:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9E1C341C8;
 Wed, 29 Jun 2022 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656523184;
 bh=7SEzehmTNiedxnN/WyWz5hw+VLLOK+1tiViOeyV+LwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nTB2P46GglBZYH8eYlOmT0yhVsC0SdQpx2SlanJHUQqipHLAZHXfbNFgBiQ0FQM/F
 cD+JTc+uDNS6UJ9YPZzL8dsW2GbUU5yf8dl5N9O/jtPNDW7Zui8HY9idCsKDfXZd8W
 46gApD0MR22xzwtQEPeLhQJLah20KDBiKC3GVi7Y=
Date: Wed, 29 Jun 2022 19:19:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
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
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YryJqI/ppVfMhRhI@kroah.com>
References: <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
 <20220629164543.GA25672@lst.de>
 <CAHmME9rwKmEQcn84GfTrCPzaK3g6vh6rpQ=YcgyTo_PWpJ5VcA@mail.gmail.com>
 <YryFKXsx/Bgv/oBE@kroah.com> <YryHk06Ye/12dMEN@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YryHk06Ye/12dMEN@zx2c4.com>
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

On Wed, Jun 29, 2022 at 07:10:43PM +0200, Jason A. Donenfeld wrote:
> On Wed, Jun 29, 2022 at 07:00:25PM +0200, Greg Kroah-Hartman wrote:
> > I think that by the time the next kernel release comes out, and
> > percolates to a real Android device, the years gone by will have caused
> > those who care about this to fix it.
> 
> You assume that there aren't Android devices using kernels outside of
> the ones you're referring to. That's a rather Google-centric
> perspective. It's still breakage, even if Google has the ability to fix
> it locally after "years gone by". If you want Android things to be
> upstream, this is the way you must think about it; otherwise, what's the
> point? By your logic, upstream should probably remove the Android code
> everywhere and let Google handle it downstream. Except nobody wants
> that; we want Android upstream. So let's keep it working upstream, not
> intentionally break it.

I would be totally and completly amazed if there are any Android kernels
in real devices in the world that are not at the very least, based on
LTS releases.  But maybe there is, this patch series isn't going to land
until 5.20, and by then, I think the "define behavior, not hardware" fix
for random and wg will be properly resolved :)

> > In the meantime, this might actually fix issues in desktop distros that
> > were enabling this option, thinking it only affected the building of a
> > driver
> 
> That sounds like a false dichotomy. It's not about "fix Android" vs "fix
> distros". What I'm suggesting is fixing Android AND fixing distros, by
> looking at the problem holistically. Trading a bad problem on Android
> (wg connections are broken) for a manageable problem on distros (something
> something theoretical warm boot attack something) doesn't sound like a
> nice trade off. Let's instead get this all fixed at the same time.

Agreed, so what should we use instead in the wg code?  What userspace
functionality are you trying to trigger off of here in the current
CONFIG_ANDROID check?

The RCU stuff is already handled as Paul has stated, so that's not an
issue.

thanks,

greg k-h
