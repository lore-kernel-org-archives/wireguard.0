Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B95C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jul 2022 18:09:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a1d5bcf5;
	Wed, 6 Jul 2022 18:09:54 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6f5d1f5d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2022 18:09:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id y18so8576591ljj.6
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2022 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0A598iVSKLysRfv2sRXRDO6tMHET5VOceIuNiuD58/Y=;
 b=RCq4RtcmZ8gfFAM/viGpnHBX7b6YJzB9+TxM8v7brC+iSNmhLCX/k75uH2OP1T7/a8
 bS8oBg/Viter1LXQ7eHV8v2nY5lEBb4Rv3iw0GJ1bZSN0TQm1ffZiqD4NXwPV4veIWVe
 XB1ZUQDinD2dOVWeGYnETXE+m19508Y6Ozq/PcicZqcTgtPcNoKDObAq4iyCDwVYYrq8
 RIkiNu3SHadjcqE0XTgclmFT9xK2C1KbizaIxzPjJEENCITLg1FV+XIOB6MZfdvVcnWl
 4SmvktWXdPoqTf+km4bX9tnC7oUfSZzFD/c6028NywVvCMaAdd7bZ50ArulnCB4I/0vw
 Oqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0A598iVSKLysRfv2sRXRDO6tMHET5VOceIuNiuD58/Y=;
 b=AeOiG/Y+AclevBWifFO12Ox2f0vHsSw9g+P4uy0o66EuXJXUoeb1cJzA5rThnBaSxa
 emk2jHy/vIawBpX1V0pwytgbAV7HmbnQ54A90Fhh3VqBDMx5GyVOUGgzrUlhO1fDilEW
 /GSaQsa9GETTIKxzGqv6ezPT6pYuHCrrXO9mJfcyCnORD9Sz2ln9XLA0YGSaXxfcrMGY
 WO5EsDAZPa64bbvY6u3ztFc7wMZsGY7kJRIdXMdKpTKZ3o8zzBOCPCjXkp52KdVxvUJK
 8tFL3JWRF+3u9xuhuT1lGTbiXb0vZsL/uhKtGD2lz2a1SiR3z7CGsekaV1JqaF8u87np
 Mk5g==
X-Gm-Message-State: AJIora/UhnDzUBinIFykFImO73MLVgL2R56AUtGvoE0mFzG1XAkmsJTW
 EFhK/AheHuUFJQVRSZn/NnE=
X-Google-Smtp-Source: AGRyM1tVGz9tZcQBzGZVPndJH1FRtpjeuQp7KHQvu/ovYzoH3JzfCWBp9GXAxjZSPbrMCtpzNemUuA==
X-Received: by 2002:a2e:b209:0:b0:25a:705d:c4ba with SMTP id
 l9-20020a2eb209000000b0025a705dc4bamr22643914ljm.468.1657130992430; 
 Wed, 06 Jul 2022 11:09:52 -0700 (PDT)
Received: from pc638.lan ([155.137.26.201]) by smtp.gmail.com with ESMTPSA id
 n24-20020a05651203f800b0047863e5649esm6413063lfq.86.2022.07.06.11.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 11:09:51 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 6 Jul 2022 20:09:49 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Joel Fernandes <joel@joelfernandes.org>,
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
Message-ID: <YsXP7ZwHh/GvWM82@pc638.lan>
References: <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
 <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656443915.mdjoauhqe0.none@localhost> <YrtgeSmwLmpzN/zw@pc638>
 <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
 <YsXK5A0MiVgHd8Je@pc638.lan>
 <20220706175836.GI1790663@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706175836.GI1790663@paulmck-ThinkPad-P17-Gen-1>
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

On Wed, Jul 06, 2022 at 10:58:36AM -0700, Paul E. McKenney wrote:
> On Wed, Jul 06, 2022 at 07:48:20PM +0200, Uladzislau Rezki wrote:
> > Hello.
> > 
> > On Mon, Jul 04, 2022 at 01:30:50PM +0200, Christian König wrote:
> > > Hi guys,
> > > 
> > > Am 28.06.22 um 22:11 schrieb Uladzislau Rezki:
> > > > > Excerpts from Paul E. McKenney's message of June 28, 2022 2:54 pm:
> > > > > > All you need to do to get the previous behavior is to add something like
> > > > > > this to your defconfig file:
> > > > > > 
> > > > > > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
> > > > > > 
> > > > > > Any reason why this will not work for you?
> > > 
> > > sorry for jumping in so later, I was on vacation for a week.
> > > 
> > > Well when any RCU period is longer than 20ms and amdgpu in the backtrace my
> > > educated guess is that we messed up some timeout waiting for the hw.
> > > 
> > > We usually do wait a few us, but it can be that somebody is waiting for ms
> > > instead.
> > > 
> > > So there are some todos here as far as I can see and It would be helpful to
> > > get a cleaner backtrace if possible.
> > > 
> > Actually CONFIG_ANDROID looks like is going to be removed, so the CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
> > will not have any dependencies on the CONFIG_ANDROID anymore:
> > 
> > https://lkml.org/lkml/2022/6/29/756
> 
> But you can set the RCU_EXP_CPU_STALL_TIMEOUT Kconfig option, if you
> wish.  Setting this option to 20 will get you the behavior previously
> obtained by setting the now-defunct ANDROID Kconfig option.
> 
Right. Or over boot parameter. So for us it is not a big issue :)

--
Uladzislau Rezki
