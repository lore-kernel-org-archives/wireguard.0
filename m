Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009F2CCA47C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 23:30:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2a6712e1;
	Wed, 29 Jun 2022 23:10:52 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 20e3cb3f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 19:41:25 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-118-63.bstnma.fios.verizon.net
 [173.48.118.63]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 25TJf03p002141
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 15:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1656531666; bh=A00A5iArp8Jb47JVnyjlorO4xEv+4O+Vse4QFx1ESSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MNq41MOiCURJszuFzvQeIrOjYX8okABoDH44ubCBFGtMXodARRk59s2L/Djbx5tKM
 nruf2t0eHRzVoETd9KxT6h5v0eEdiqq3qZrQvcHNMGGkfpgLcRFmb3cVpZom8OiXzU
 9+N5fVHuIOBjc05RUOfj/NDO93/uSrB9cZvAfyFCAbu8rKZ3wVA9u76g1pEh1TMyFm
 RiLn+kwf3cw48aXaAI4BmdOhzqZ7kiIJJX1WIQts172MbD4vy/yJ+Ql9nUzZk9cibZ
 nVea6p02UHt4hJq2BBqCSwb5xZmm3qHXd5JTJvnHBJGWcdtFno9r6/BgPu33uARDuT
 cEh37HIcEdZWA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id C409315C3E94; Wed, 29 Jun 2022 15:41:00 -0400 (EDT)
Date: Wed, 29 Jun 2022 15:41:00 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
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
 Lai Jiangshan <jiangshanlai@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sultan@kerneltoast.com
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YryqzCNqVcMtKROJ@mit.edu>
References: <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
 <YryNQvWGVwCjJYmB@zx2c4.com> <Yryic4YG9X2/DJiX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yryic4YG9X2/DJiX@google.com>
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

On Wed, Jun 29, 2022 at 12:05:23PM -0700, Kalesh Singh wrote:
> 
> Android no longer uses PM_AUTOSLEEP, is correct. libsuspend is
> also now deprecated. Android autosuspend is initiatiated from the
> userspace system suspend service [1].

Is anything still using CONFIG_PM_AUTOSLEEP?  Is it perhaps time to
consider deprecating it?

						- Ted
