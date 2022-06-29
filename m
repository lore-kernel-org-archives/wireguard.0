Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5DFC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 16:42:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a2e4bb1c;
	Wed, 29 Jun 2022 16:38:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 40b11435
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:38:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29B61B825AB;
 Wed, 29 Jun 2022 16:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38917C34114;
 Wed, 29 Jun 2022 16:38:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZNKx75q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656520696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqsTdiLfWpJvLwXGqGd7Je96p2+qJUVXjf/cM3xQGqA=;
 b=ZNKx75q7yT64VSkCyZYIG/UKOvmj2k2d+g2rhHqSjeu1Zdq/d9bl9TVbzbqjHVmavQYjof
 KuXqFM7kkX42Se1F8LiCZUWNnALfjzJmU8Ysdci7RZK9kyZOyLEcxbiTpNjTBsI4Ywyan1
 UosUpF3Ud0xyjAhkSthaJ/NO4xyrkkI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2422f02d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 16:38:16 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:38:09 +0200
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
Message-ID: <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629163007.GA25279@lst.de>
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

On Wed, Jun 29, 2022 at 06:30:07PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 06:25:32PM +0200, Jason A. Donenfeld wrote:
> > Anyway, instead of the slow drip of "facts" and ≤three sentence emails,
> > can you just write up a paragraph that indicates this is safe to do (for
> > both (1) and (2)) in your v+1?
> 
> Why would I care?  If your config wakeups up so often that you need
> special casing find a way to deal with it. 

You should care, because the change you're suggesting might break code
that I maintain. If you don't care about breaking my code with your
change, than just have my "nack", and it'll be up to Greg to decide
whether he wants to apply this despite the nack for two separate
affected code spots.

On the technical topic, an Android developer friend following this
thread just pointed out to me that Android doesn't use PM_AUTOSLEEP and
just has userspace causing suspend frequently. So by his rough
estimation your patch actually *will* break Android devices. Zoinks.
Maybe he's right, maybe he's not -- I don't know -- but you should
probably look into this if you want this patch to land without breakage.

Jason
