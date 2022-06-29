Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B90C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 15:27:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 66220699;
	Wed, 29 Jun 2022 15:27:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df4ff759
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 15:27:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45022B824DD;
 Wed, 29 Jun 2022 15:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40D8C34114;
 Wed, 29 Jun 2022 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656516446;
 bh=C7+n2xJegL9gjAWfn0gYV9ETANtGcmZOAauecDXXpMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVw2/8ykosIBTI15WhKjsfTHLa4ELBMBAvMHusrYnbWqsGUNPq8/vue9Obr7k+OM8
 Z03VBpUkdJ7I1gr3zda5pP9qLy1TMznbkAdEhlbV6odBTWoBQwdYxktyo7b5PaqqiM
 rura0NjwXFAj8QrHwXNjNOllKwxPlM5m6o4pk3R8=
Date: Wed, 29 Jun 2022 17:27:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YrxvWT/aeQnwEv52@kroah.com>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629150102.1582425-2-hch@lst.de>
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

On Wed, Jun 29, 2022 at 05:01:02PM +0200, Christoph Hellwig wrote:
> The ANDROID config symbol is only used to guard the binder config
> symbol and to inject completely random config changes.  Remove it
> as it is obviously a bad idea.

Ick, rcu and random driver changes?  That's not ok, I'll go queue this
up, if Android devices need to make these core changes, they can do that
in their kernel or submit a patch that makes sense for everyone.

Also, one meta-comment:

>  kernel/configs/android-base.config                  | 1 -

This whole file can be deleted now, with the way Android kernels are now
being managed it makes no sense anymore.  I'll write up a patch to do
that later tonight.

thanks,

greg k-h
