Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7BBC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jul 2022 17:48:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bad9ddcf;
	Wed, 6 Jul 2022 17:48:26 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d54750f9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2022 17:48:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y18so8511785ljj.6
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2022 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Tdf7ASxlbaDXe3UntpbJmcyMVIZx89GElFlVDq70G1E=;
 b=av5EmNC6KScDiSo3yZRxHh1JjVtGq58I72zcmjOS/GbgnhP9d8NL1M67W6AdDXWLBO
 smYrB5PVGshhhGcB3EOvl0VKQhQYBBZv45doGDeTc8aiualcqa94FJFkRbbZooofaXAR
 bXGL5bjfGNorBvl4Q/qYWvyzPb6qAA2SDjlNyda8uXSK9XxPxrO58pcJ14Td10bg1KFW
 EyHDqu5L8ZKn1kKjOWPdFbdL7k8qhfZbOZPv9OzdKlPYVeO2Q3u7kUhwgFhnQbQx+eVg
 9c74CIJZQE0C/YfHhRoBDFamJEMO/uldYuzvtYJC25qCRRqrPPcME4kMgAOeMfhB8wyR
 ZbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tdf7ASxlbaDXe3UntpbJmcyMVIZx89GElFlVDq70G1E=;
 b=hBzXvoKTsi/KQyA2cVCJ9mXa6c7+7EO3Rm9wqjqp30/AjgTOw07k+9XmHb1z+bZT/+
 rCzKwmKHnl6K6+McYF2B/gFVBNYsHGX5+OenNmrhveRvRWiErVjcoScQNB7TXTzFQdLP
 +5SSRVrVqSFikpNMQjofkIPbDIg0oslHtYZdxRKTE+C6sv1cC1a3WBokLrjxMmvj1YgD
 +RDPfZZ6R6j3FrZFdzV+E4WNNoOF6G3ju6KE7cNUS0ystmuYt4I2Gdwrf3IRv14boplS
 XYp8xpT75yiYyX1JQfKhd7bQo4j9tANTlei37DyYnKOEWVyR38uQ8M5vobVV5Tan90dg
 /fUg==
X-Gm-Message-State: AJIora+5Q5le58vWoAzyjMD64xDaihulDc/eP4fW8OtyIJD7/K+SL9A9
 Swcah2mq8BvRUknyO38Dwac=
X-Google-Smtp-Source: AGRyM1u1HT+sFi2wLf7fp4YNZfwAKQU6WlrA9bLDUjbi9zIEm3uBpG7mqsv2U+35d/fU8R3i17yQvA==
X-Received: by 2002:a2e:9808:0:b0:25a:a30c:e5cb with SMTP id
 a8-20020a2e9808000000b0025aa30ce5cbmr24645544ljj.312.1657129703858; 
 Wed, 06 Jul 2022 10:48:23 -0700 (PDT)
Received: from pc638.lan ([155.137.26.201]) by smtp.gmail.com with ESMTPSA id
 c2-20020ac25f62000000b00478f3fe716asm6387536lfc.200.2022.07.06.10.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 10:48:22 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 6 Jul 2022 19:48:20 +0200
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Joel Fernandes <joel@joelfernandes.org>, paulmck@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Suren Baghdasaryan <surenb@google.com>, rcu@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Theodore Ts'o <tytso@mit.edu>, alexander.deucher@amd.com,
 Todd Kjos <tkjos@android.com>, uladzislau.rezki@sony.com,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <YsXK5A0MiVgHd8Je@pc638.lan>
References: <1656357116.rhe0mufk6a.none.ref@localhost>
 <1656357116.rhe0mufk6a.none@localhost>
 <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
 <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656443915.mdjoauhqe0.none@localhost> <YrtgeSmwLmpzN/zw@pc638>
 <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
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

Hello.

On Mon, Jul 04, 2022 at 01:30:50PM +0200, Christian König wrote:
> Hi guys,
> 
> Am 28.06.22 um 22:11 schrieb Uladzislau Rezki:
> > > Excerpts from Paul E. McKenney's message of June 28, 2022 2:54 pm:
> > > > All you need to do to get the previous behavior is to add something like
> > > > this to your defconfig file:
> > > > 
> > > > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
> > > > 
> > > > Any reason why this will not work for you?
> 
> sorry for jumping in so later, I was on vacation for a week.
> 
> Well when any RCU period is longer than 20ms and amdgpu in the backtrace my
> educated guess is that we messed up some timeout waiting for the hw.
> 
> We usually do wait a few us, but it can be that somebody is waiting for ms
> instead.
> 
> So there are some todos here as far as I can see and It would be helpful to
> get a cleaner backtrace if possible.
> 
Actually CONFIG_ANDROID looks like is going to be removed, so the CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
will not have any dependencies on the CONFIG_ANDROID anymore:

https://lkml.org/lkml/2022/6/29/756

--
Uladzislau Rezki

