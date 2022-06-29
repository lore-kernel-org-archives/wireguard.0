Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9E0C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 17:12:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 405da889;
	Wed, 29 Jun 2022 17:10:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bf4f81a4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 17:10:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 030D8B82604;
 Wed, 29 Jun 2022 17:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C467FC34114;
 Wed, 29 Jun 2022 17:10:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aExlGSSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656522652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bl3uaY3cRegdu8Xedo5QKvYZcFg8ZQEQBfUE65BNrGc=;
 b=aExlGSSP2ZDh66T/coO6aB/IVwm5xDpZVXleX8D0ABt5ix/QwGSlKWvj27VgZh7mEsafsq
 yZa6kbd4W7mfe09g2TNhf4MXmE0JxAeYHChRIFWwVB6J4tg9DdmsTmn1Jgelf/kWdlHTHc
 7PBZvkYyrEcXv0OPVt5sacdT5F/y4wc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9da54ae8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 17:10:51 +0000 (UTC)
Date: Wed, 29 Jun 2022 19:10:43 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
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
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YryHk06Ye/12dMEN@zx2c4.com>
References: <Yrx5Lt7jrk5BiHXx@zx2c4.com> <20220629161020.GA24891@lst.de>
 <Yrx6EVHtroXeEZGp@zx2c4.com> <20220629161527.GA24978@lst.de>
 <Yrx8/Fyx15CTi2zq@zx2c4.com> <20220629163007.GA25279@lst.de>
 <Yrx/8UOY+J8Ao3Bd@zx2c4.com> <20220629164543.GA25672@lst.de>
 <CAHmME9rwKmEQcn84GfTrCPzaK3g6vh6rpQ=YcgyTo_PWpJ5VcA@mail.gmail.com>
 <YryFKXsx/Bgv/oBE@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YryFKXsx/Bgv/oBE@kroah.com>
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

On Wed, Jun 29, 2022 at 07:00:25PM +0200, Greg Kroah-Hartman wrote:
> I think that by the time the next kernel release comes out, and
> percolates to a real Android device, the years gone by will have caused
> those who care about this to fix it.

You assume that there aren't Android devices using kernels outside of
the ones you're referring to. That's a rather Google-centric
perspective. It's still breakage, even if Google has the ability to fix
it locally after "years gone by". If you want Android things to be
upstream, this is the way you must think about it; otherwise, what's the
point? By your logic, upstream should probably remove the Android code
everywhere and let Google handle it downstream. Except nobody wants
that; we want Android upstream. So let's keep it working upstream, not
intentionally break it.

> In the meantime, this might actually fix issues in desktop distros that
> were enabling this option, thinking it only affected the building of a
> driver

That sounds like a false dichotomy. It's not about "fix Android" vs "fix
distros". What I'm suggesting is fixing Android AND fixing distros, by
looking at the problem holistically. Trading a bad problem on Android
(wg connections are broken) for a manageable problem on distros (something
something theoretical warm boot attack something) doesn't sound like a
nice trade off. Let's instead get this all fixed at the same time.

> So it's nothing to worry about now, I agree with Christoph, this config
> option should not be used for power management policy decisions like
> this.  This should be controlled by userspace properly in the Android
> userspace framework, like all other Linux distros/systems do this.

Except right now it is. So if it's going to be removed, the code that
was depending on it will need to be updated coherently.

Jason
