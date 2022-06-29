Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF5BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 17:37:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id be9bf1d5;
	Wed, 29 Jun 2022 17:35:17 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 52e76b82
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 17:35:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5EABCCE285B;
 Wed, 29 Jun 2022 17:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B1BC34114;
 Wed, 29 Jun 2022 17:35:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AucPVFO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656524107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YuSrb83T/sew09oEwC4jqlwmFmsN3/eWbuM4rfaIxQ8=;
 b=AucPVFO5o+D4xprp0cAdeMfdNNJ1IjiF4Z5ekpcwdbgxZHUbVXYx1VdkDXXP8xhdN00dQY
 p5Jk5fgzTPbwdXuMmla6Aiz90j+J9qkxtwHezru0nrhRBlygn2Nu0us7NC5/Vdmerd3vKF
 J13IU9BNrAfLdi4ASZ/bwCwZD5mTEOg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f38fdb15
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 29 Jun 2022 17:35:06 +0000 (UTC)
Date: Wed, 29 Jun 2022 19:34:58 +0200
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
 rcu@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sultan@kerneltoast.com
Subject: Re: [PATCH] remove CONFIG_ANDROID
Message-ID: <YryNQvWGVwCjJYmB@zx2c4.com>
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de> <Yrx5Lt7jrk5BiHXx@zx2c4.com>
 <20220629161020.GA24891@lst.de> <Yrx6EVHtroXeEZGp@zx2c4.com>
 <20220629161527.GA24978@lst.de> <Yrx8/Fyx15CTi2zq@zx2c4.com>
 <20220629163007.GA25279@lst.de> <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yrx/8UOY+J8Ao3Bd@zx2c4.com>
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

On Wed, Jun 29, 2022 at 06:38:09PM +0200, Jason A. Donenfeld wrote:
> On the technical topic, an Android developer friend following this
> thread just pointed out to me that Android doesn't use PM_AUTOSLEEP and
> just has userspace causing suspend frequently. So by his rough
> estimation your patch actually *will* break Android devices. Zoinks.
> Maybe he's right, maybe he's not -- I don't know -- but you should
> probably look into this if you want this patch to land without breakage.

More details: https://cs.android.com/android/platform/superproject/+/master:system/core/libsuspend/autosuspend_wakeup_count.cpp;bpv=1;bpt=1;l=52?q=%22%2Fsys%2Fpower%2Fstate%22&start=51&gsn=sys_power_state&gs=kythe%3A%2F%2Fandroid.googlesource.com%2Fplatform%2Fsuperproject%3Flang%3Dc%252B%252B%3Fpath%3Dsystem%2Fcore%2Flibsuspend%2Fautosuspend_wakeup_count.cpp%23ftWlDJuOhS_2fn3Ri7rClxA30blj_idGgT12aoUHd1o

So indeed it looks like it's userspace controlled. If you want this to
be a runtime, rather than a compiletime, switch, maybe
autosuspend_init() of that file could write to a sysctl.

Who at Google "owns" that code? Can somebody CC them in?

Jason
