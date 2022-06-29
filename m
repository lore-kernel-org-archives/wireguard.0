Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 16:55:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 78ef13ed;
	Wed, 29 Jun 2022 16:52:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a1de5b08
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:52:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C537B8224C
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 16:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E42CC341CA
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 16:52:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QiOL2Qug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656521543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9yQuP8dZlIefMwCtE/LZH80/r0SB1Bpmqz3sW7F0As=;
 b=QiOL2Quggjmg25RNTA9yJnjRwRJ0O0z8dtQzJbJUqtKUGjHEHa/zJ9CCLH+2WfUvOj6jfG
 Vcm8SvC9bb+vafFcBkjec7m3BIzDDzANavS7zSSrCgfPrRi+YDGCBGBJgmWH77+vmY5b+A
 Iyd2dbHNjNAdbq38fmK7CqCcdqKECVI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc4d50de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:52:22 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id h85so16608826iof.4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 09:52:21 -0700 (PDT)
X-Gm-Message-State: AJIora+x+KbRdrkF3Oye+whuiExaDkeGyrTdutCtKksO6XPiAGtLg6rA
 EfnzbTxTQ2vbdyd4NQN4YPHi+VPHJ+eaH5TqBW4=
X-Google-Smtp-Source: AGRyM1tEuvoeECCx/bx2m7scUVXWPupT5PUetPXh1d7o9fBuPNfa8DVhmIomMMIebUacCysCKoZGZxBEY4pNRnKB0hI=
X-Received: by 2002:a02:9709:0:b0:339:ef87:c30b with SMTP id
 x9-20020a029709000000b00339ef87c30bmr2526540jai.214.1656521539436; Wed, 29
 Jun 2022 09:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629150102.1582425-1-hch@lst.de>
 <20220629150102.1582425-2-hch@lst.de>
 <Yrx5Lt7jrk5BiHXx@zx2c4.com> <20220629161020.GA24891@lst.de>
 <Yrx6EVHtroXeEZGp@zx2c4.com> <20220629161527.GA24978@lst.de>
 <Yrx8/Fyx15CTi2zq@zx2c4.com> <20220629163007.GA25279@lst.de>
 <Yrx/8UOY+J8Ao3Bd@zx2c4.com> <20220629164543.GA25672@lst.de>
In-Reply-To: <20220629164543.GA25672@lst.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jun 2022 18:52:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9rwKmEQcn84GfTrCPzaK3g6vh6rpQ=YcgyTo_PWpJ5VcA@mail.gmail.com>
Message-ID: <CAHmME9rwKmEQcn84GfTrCPzaK3g6vh6rpQ=YcgyTo_PWpJ5VcA@mail.gmail.com>
Subject: Re: [PATCH] remove CONFIG_ANDROID
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 "Theodore Ts'o" <tytso@mit.edu>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, rcu@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Jun 29, 2022 at 6:45 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jun 29, 2022 at 06:38:09PM +0200, Jason A. Donenfeld wrote:
> > On the technical topic, an Android developer friend following this
> > thread just pointed out to me that Android doesn't use PM_AUTOSLEEP and
> > just has userspace causing suspend frequently. So by his rough
> > estimation your patch actually *will* break Android devices. Zoinks.
> > Maybe he's right, maybe he's not -- I don't know -- but you should
> > probably look into this if you want this patch to land without breakage.
>
> And it will also "break" anyone else doing frequent suspends from
> userspace, as that behavior is still in no way related to
> CONFIG_ANDROID.

I don't know of any actual systems that do this for which
CONFIG_PM_AUTOSLEEP and CONFIG_ANDROID are both disabled. At least
that was what I concluded back in 2017-2018 when I looked at this
last. And so far, no other-handset-users have reported bugs.

But of course I agree that this all could be improved with something
more granular somehow, somewhere. I don't really have any developed
opinions on what that looks like or what form that should take.

However, the thing I do have a strong opinion on is that the change
you're proposing shouldn't break things. And that's what your patch
currently might do (or not!).

In other words, instead of making the current situation worse,
justified by your observation that in theory the current mechanism is
imperfect, please make the situation better. Or conclude that it
doesn't make the situation worse, and put the reason why inside your
commit message, which is the first thing I asked.

Jason
