Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2BAC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 16:25:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6b2ae064;
	Wed, 29 Jun 2022 16:25:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2a652efa
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:25:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 28479CE282B;
 Wed, 29 Jun 2022 16:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C294C34114;
 Wed, 29 Jun 2022 16:25:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pcAWGf38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656519940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68juHfv4ygcIaahoO6PbfPTLidvNwti4IiRxQ+0kt6w=;
 b=pcAWGf38OzIMgyPi4OUE3lxDPN67fDsAwjtmVY65jBcFJHVgSvrOJLrXxTDJgzjglyzQ1u
 2CSO9+yCjfBazL0tv1CtSmUtDTr4aCsE3ZzVZ02CULsAB0CdMri+FLuqwPNnCRQgJS+/oB
 YOKOC2ccbkhGrCi051exLIABSKZ8eyM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1fb02a60
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 16:25:40 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:25:32 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <Yrx8/Fyx15CTi2zq@zx2c4.com>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jun 29, 2022 at 06:15:27PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 06:13:05PM +0200, Jason A. Donenfeld wrote:
> > Good! It sounds like you're starting to develop opinions on the matter.
> 
> No, I provide facts.

Lol.

> Look at both the definition of the symbol, and
> various distribution kernel that enabled it and think hard if they run
> on "Android" hardware.  Not just primarily, but at all.

There are two failure modes:

1) Key clearing code is skipped when it shouldn't be.
2) Key clearing code is run when it shouldn't be.

You've identified (well, Alex in the other thread I think?) a case of
(1). I was sort of thinking the fix to that would be that distros
shouldn't enable that option, but it doesn't really matter to me.

However, what I'm pointing out is the potential for (2). A (2)-style
regression means that WireGuard basically doesn't work, because, for
example, qcacld's packet-triggered wakeups tend to be too short to
renegotiate a handshake.

Anyway, instead of the slow drip of "facts" and ≤three sentence emails,
can you just write up a paragraph that indicates this is safe to do (for
both (1) and (2)) in your v+1?

I don't really want to argue about it, because I don't have anything to
argue about. Your change is probably fine. I'd just like it to be
spelled out why this is safe to do from somebody who has looked into it.
I have not looked into it, but it sounds like you have or are in the
process of doing so. Just write down what you find, please.

Jason
