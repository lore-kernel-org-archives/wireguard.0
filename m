Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A80C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 23:30:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1369a468;
	Wed, 29 Jun 2022 23:10:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 452fe1c7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 17:35:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 56BBA68AA6; Wed, 29 Jun 2022 19:35:45 +0200 (CEST)
Date: Wed, 29 Jun 2022 19:35:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20220629173545.GA26648@lst.de>
References: <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
 <20220629164543.GA25672@lst.de>
 <CAHmME9rwKmEQcn84GfTrCPzaK3g6vh6rpQ=YcgyTo_PWpJ5VcA@mail.gmail.com>
 <YryFKXsx/Bgv/oBE@kroah.com> <YryHk06Ye/12dMEN@zx2c4.com>
 <YryJqI/ppVfMhRhI@kroah.com> <YryMO6PX+G9owRGz@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YryMO6PX+G9owRGz@zx2c4.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Wed, Jun 29, 2022 at 07:30:35PM +0200, Jason A. Donenfeld wrote:
> Properly resolved by whom? It sounds like you're up for intentionally
> allowing a userspace regression, and also volunteering other people's
> time into fixing that regression? The way I understand the kernel
> development process is that the person proposing a change is responsible
> for not intentionally causing regressions, and if one is pointed out, a
> v+1 of that patch is provided that doesn't cause the regression.

If you think the code does not work when the system frequently suspends
and resumes, then well it is broken already, as that can happen just
as much on non-Android systems.  So maybe we should just remove it if
it is so broken that you fear about regressions on the 3 and a half
Android systems in the world running an upstream kernel?
