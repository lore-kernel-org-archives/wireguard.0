Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B85AC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 12:28:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 70fb3a7d;
	Wed, 29 Jun 2022 12:27:05 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bc030e39
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 20:11:46 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w20so24210620lfa.11
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yP7z++hmLdln35/PWmu6kJvToesBwvqVRLcqwtfTqHw=;
 b=Wf4kJNvUbmGXAp0NKucvsRru3Al5eajFw/oZCCKXVRRSqAQeeg8pU5Ege0VPhodaH7
 IEvU3zGwXrbw+cRkIIQcjHHVhS8kZoOxWWZkL3cJEM0QeyptAEr7JYrzzIseoD7tWwNx
 GwEWmjo8AA9qQAOthsc9dxhRBtotQ5CWSpAy4Z5KA4HJNAOLWvmdl/DBy+mLSpTuwguG
 nXhqsIWc0WAhnJEKWESan3ugOFaug8LyIgmFKNvWHvMWfvOG2TncTre7680CDJF/DzZs
 wADgKv0PoqodHkVCeWuh9jF85+a3yot3LdR+4xBpltsfJhTaVVjqHbtImVNB8Digj3+w
 J20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yP7z++hmLdln35/PWmu6kJvToesBwvqVRLcqwtfTqHw=;
 b=3YQaV6XD57kWJXE4rRKwOVAAa9Ii1jCd6M9eFjil3E0unscih8N6q3bCUDaEe5O069
 4WlVP9qEWS1LwdUEwNHfvHQCE8Ikj5yO6cHxEBnyityulEKUaP4mf/hZL3/hE3w+MCMd
 xJ9JPw7kHMprw1b/qbuAvmNOddSKIbOIhG5CboQ3zVxlnCERKI0D3PHMW4fRVrq9Ft2v
 dPHy1PsyO0qKEtmqtv2U9QgC+ESQ16+jq543OLg9LUiZPMNsN8nS6YV4mnnRwYD1bXPk
 JZhZsOVvJW3rPOZB73EP7mTezXqJeHkx1scZPcRWlIRpeWkkRijyjfihucnaVDJvdXv+
 oqDA==
X-Gm-Message-State: AJIora/FwxQHpNIqZJjm6bDKhZ00hum98wAaucowpjmEYTqDUJyW6iWk
 MdINdGrB0s++dzU3pm1B58Y=
X-Google-Smtp-Source: AGRyM1s/SxLBCRJqtNijzYQhHtgDDNIM9SkW0fxBYF0tjMUjSiLBy70E08Gxvmb304uwHefJmXgTew==
X-Received: by 2002:a05:6512:128f:b0:480:fd23:6647 with SMTP id
 u15-20020a056512128f00b00480fd236647mr13566368lfs.136.1656447105293; 
 Tue, 28 Jun 2022 13:11:45 -0700 (PDT)
Received: from pc638 ([155.137.26.201]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05651203a800b0047f9fa2925csm2315627lfp.234.2022.06.28.13.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 13:11:44 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638>
Date: Tue, 28 Jun 2022 22:11:37 +0200
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: paulmck@kernel.org, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Christian Brauner <christian@brauner.io>, christian.koenig@amd.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel@vger.kernel.org, Martijn Coenen <maco@android.com>,
 rcu@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Todd Kjos <tkjos@android.com>, Theodore Ts'o <tytso@mit.edu>,
 uladzislau.rezki@sony.com, urezki@gmail.com,
 wireguard@lists.zx2c4.com, Xinhui.Pan@amd.com
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <YrtgeSmwLmpzN/zw@pc638>
References: <1656357116.rhe0mufk6a.none.ref@localhost>
 <1656357116.rhe0mufk6a.none@localhost>
 <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
 <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656443915.mdjoauhqe0.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656443915.mdjoauhqe0.none@localhost>
X-Mailman-Approved-At: Wed, 29 Jun 2022 12:27:03 +0000
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

> Excerpts from Paul E. McKenney's message of June 28, 2022 2:54 pm:
> > All you need to do to get the previous behavior is to add something like
> > this to your defconfig file:
> > 
> > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
> > 
> > Any reason why this will not work for you?
> 
> As far as I know, I do not require any particular RCU debugging features 
> intended for developers; as an individual user and distro maintainer, I 
> would like to select the option corresponding to "emit errors for 
> unexpected conditions which should be reported upstream", not "emit 
> debugging information for development purposes".
> 
Sorry but we need to apply some assumption, i.e. to me the CONFIG_ANDROID
indicates that a kernel runs on the Android wise device. When you enable
this option on you specific box it is supposed that some Android related
code are activated also on your device which may lead to some side effect.

>
> Therefore, I think 0 is a suitable setting for me and most ordinary 
> (not tightly controlled) distributions. My concern is that other users 
> and distro maintainers will also have confusion about what value to set 
> and whether the warnings are important, since the help text does not say 
> anything about Android, and "make oldconfig" does not indicate that the 
> default value is different for Android.
> 
<snip>
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 9b64e55d4f61..ced0d1f7c675 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -94,7 +94,8 @@ config RCU_EXP_CPU_STALL_TIMEOUT
          If the RCU grace period persists, additional CPU stall warnings
          are printed at more widely spaced intervals.  A value of zero
          says to use the RCU_CPU_STALL_TIMEOUT value converted from
-         seconds to milliseconds.
+         seconds to milliseconds. If CONFIG_ANDROID is set for non-Android
+         platform and you unsure, set the RCU_EXP_CPU_STALL_TIMEOUT to zero.

 config RCU_TRACE
        bool "Enable tracing for RCU"
<snip>

Will it work for you?

--
Uladzislau Rezki
