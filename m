Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D466C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 16:36:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 261732e0;
	Wed, 29 Jun 2022 16:34:48 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c5caa5e7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:34:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B49AB82285;
 Wed, 29 Jun 2022 16:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB63C34114;
 Wed, 29 Jun 2022 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656520485;
 bh=sFETOlgQpy9AOtXsqkIBLwAzXJA3N7SbWK2htFFpod4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=CwSA1DDZbxtpffCPw7RONM05jSVQih1yJlYiH1+2sOckkrXu4HrZ+vG16N2gI4Ztw
 q8yv8hACvHaNqdek8TGLXgDz6g9NCQC6IynBCDq3zAKhSo2E6+A9W0HWNhOsyCh88G
 3O6JZFqs9zevcfps9aJhBHSxFvQHaoMe1XMKNiStcnKtUaNHNTR2SDFsWsEIiCsIgW
 w3L6RI0MJ61ph5CFFS4+o4+mOfhgMLK6nCmOkbOkrnLCLWpdJq7/zCUH7PuUPF1iRL
 myuN/9jPx8UsOIPnnuaHo/QRgZTWO8jjAbZS8gKC6IXmLUEZBcP5NumrwkiEN+q6SI
 uJO6m6L0XbDRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 76CC25C0E5F; Wed, 29 Jun 2022 09:34:44 -0700 (PDT)
Date: Wed, 29 Jun 2022 09:34:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <20220629163444.GG1790663@paulmck-ThinkPad-P17-Gen-1>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629161527.GA24978@lst.de>
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
Reply-To: paulmck@kernel.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jun 29, 2022 at 06:15:27PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 06:13:05PM +0200, Jason A. Donenfeld wrote:
> > Good! It sounds like you're starting to develop opinions on the matter.
> 
> No, I provide facts.  Look at both the definition of the symbol, and
> various distribution kernel that enabled it and think hard if they run
> on "Android" hardware.  Not just primarily, but at all.

So you are OK if your patch is accepted, and then CONFIG_ANDROID is
re-introduced but used only for building kernels intended to run on
Android systems?

Asking for a friend.  ;-)

							Thanx, Paul
