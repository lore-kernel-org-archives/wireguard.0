Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6689BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jun 2022 15:13:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7b53940f;
	Tue, 28 Jun 2022 15:13:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 474c692a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 15:13:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23F5460F0D;
 Tue, 28 Jun 2022 15:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE345C3411D;
 Tue, 28 Jun 2022 15:13:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Mvf/U4H2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656429219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSloj0brG5bY7mdOHUoBdYMTWYdqdgpOBJQxXJWQhIs=;
 b=Mvf/U4H250uHD//VCHHEFWF4dRnaFg8uUreDF0NEjyU7kploiNMNxYd1qnBixnjkj4vdtJ
 +fftl9mN1dhrW3k3z8d8Fe1canDszKfF/p3MA812sAVw1NTQ+YSeEOH87Ll8MBgIBzTp4E
 mJ/kFO2wa0G2AHHHxGQle358Cf5+Z7M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fdb5660b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 28 Jun 2022 15:13:38 +0000 (UTC)
Date: Tue, 28 Jun 2022 17:13:24 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: paulmck@kernel.org, rcu@vger.kernel.org, urezki@gmail.com,
 uladzislau.rezki@sony.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 Theodore Ts'o <tytso@mit.edu>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <YrsalGetwIfl8Wkw@zx2c4.com>
References: <1656357116.rhe0mufk6a.none.ref@localhost>
 <1656357116.rhe0mufk6a.none@localhost>
 <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1656421946.ic03168yc3.none@localhost>
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

Hi Alex,

On Tue, Jun 28, 2022 at 11:02:40AM -0400, Alex Xu (Hello71) wrote:
> WireGuard and random also use CONFIG_ANDROID in a similar "proxy" way as 
> rcu, there to see if suspends are "frequent". This seems dubious for the 
> same reasons.

I'd be happy to take a patch in WireGuard and random.c to get rid of the
CONFIG_ANDROID usage, if you can conduct an analysis and conclude this
won't break anything inadvertently.

Jason
