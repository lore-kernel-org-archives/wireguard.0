Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E58CF6480
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2529e29;
	Tue, 18 Nov 2025 17:33:34 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3825d381
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Oct 2025 13:09:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e6c8bc46eso35310255e9.3
 for <wireguard@lists.zx2c4.com>; Tue, 14 Oct 2025 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760447353; x=1761052153; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XBmndkyEtmuH2zqfJVf2MipvEX2Eu2YJsa5R9Svl5+o=;
 b=O1pNvqsSSQw8jXfn4VuQGdGCXjfx0wBhRip+NE/QiqU7bOmVm+Oi3ZRq8QYlKo5VLy
 nsi7tWHRXnO+vot8aVGDIJPE9SxZdMibw6XVlh3FM541ckYCgV5LdAdQ6mvRMx1N46wV
 YiCv+KfMY4Y+P2AOZl+1c4wUnaXYhY0NLuPULFyGbJAoJkRGog5JwuM75Ah21wJ74TiA
 R1bkooh1M1w0h+11BftyfS+/nrvaBfaAuOPFMfEEWaKmleg4vFrEuC/ZK1wJYSC9hIP1
 hNwn7D02Igjrq6FUCbCv5E0WVspy1EwoN237mudGY4ZV7HNBiuHOgNN4Rl9+JgT6bv2u
 i7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760447353; x=1761052153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBmndkyEtmuH2zqfJVf2MipvEX2Eu2YJsa5R9Svl5+o=;
 b=IqOsALxy6T8mOYR4lvsQU5+IlIUUQos0/kT86IXx2aX2rJDz6miVUJtnQWH8som5/h
 TIFfLsWAw4K18fWIRsESQefXZ7H/SffFYlmCBLuBm8K+odVnQMvguSvNdWg2UxG8o9sL
 immSuGBK5jSH/ePNYWd42/amRZb8Edj49LiyoXdveLcdAYnFWb+ag3qqdpma/lYi9s1i
 oGpY2O9xdRx/gsoJ76pAPLZRZkMeOSzhNnyKhgIpkH8lFfyBKFMOnFJ67H2whwhszwFK
 ZvWN2WG9OGnChM5QoE9kJ9RUGn8Sv+AUB1sSFYfOGTtaIVhYmDCMUkTTURsCpUl/nwBl
 9a8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUvj4QqxoFV3LSpRWHNnBV1avs5Fup/VpDCqHKGMLsRvkxuwBPI1/Vc2FIz0sv+OHTeESvwJhQHE4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz4civ8mau9JEMC3EBiLk0UlE+beCCn6hYa5E/8+8v6bLjIjtLA
 zZeeic//yTq1Zs2ussEeRv5O0nRxgjVas63JMvhmG8l/aJig4p3pk/dWOzpbtn/kBs0=
X-Gm-Gg: ASbGncu0RxHfKuWMrtW0T5+DDW3Ct0SdT3dK+Z6mM27D15k/4Cl5wys0YKR0zk7Ij02
 fJXrHIYAGp/2ev7vbhVc0C6RKoBCqx/IxoMVqVlpBPdlnwOebftOL1VRA72cqs8XW9p/mtYLxyA
 F8VJl/PzPyBKBCVw6VZRwxP3XCHAK2BGZwiO8mEHgOLSbSf1rHOdavkBLkij5TmaY7+wVDw2kEz
 bSnPeDgm59Pcse7Z34JrkcyZEKuOpLO2Ah+/NXlrUky7lQ/qTVO+hx7LMUg9MoHjU97LS4BreLr
 H1ZKITQqIZx40TnYTNeTg1gvm65lnslZEoDLPovkYFhFibcOF645bYdHTxM4OZ2ppByXepisx2v
 /zwKdYcgdh4Hl4/BiHxMGMZFwe5MnokDv4IGw6Ke8u+es8nuJVzknN/Gdr6vDl3yp9BEBzw==
X-Google-Smtp-Source: AGHT+IFGpYfRWYGhqIaSZxufyw3cU/D950Wt8EiMNsuJCAolvX6QytVu1nn4m6ZLSmt3VXgOJE+wuQ==
X-Received: by 2002:a05:6000:43d4:20b0:426:ed9d:4072 with SMTP id
 ffacd0b85a97d-426ed9d43d7mr1534097f8f.21.1760447352714; 
 Tue, 14 Oct 2025 06:09:12 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf70fsm22846162f8f.27.2025.10.14.06.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 06:09:12 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:09:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: Lance Yang <lance.yang@linux.dev>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Joel Granados <joel.granados@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Phil Auld <pauld@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Florian Westphal <fw@strlen.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [????] Re: [PATCH][v3] hung_task: Panic after fixed number of
 hung tasks
Message-ID: <aO5Ldv4U8QSGgfog@pathway.suse.cz>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
 <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

On Tue 2025-10-14 10:49:53, Li,Rongqing wrote:
> 
> > On Tue 2025-10-14 13:23:58, Lance Yang wrote:
> > > Thanks for the patch!
> > >
> > > I noticed the implementation panics only when N tasks are detected
> > > within a single scan, because total_hung_task is reset for each
> > > check_hung_uninterruptible_tasks() run.
> > 
> > Great catch!
> > 
> > Does it make sense?
> > Is is the intended behavior, please?
> > 
> 
> Yes, this is intended behavior
> 
> > > So some suggestions to align the documentation with the code's
> > > behavior below :)
> > 
> > > On 2025/10/12 19:50, lirongqing wrote:
> > > > From: Li RongQing <lirongqing@baidu.com>
> > > >
> > > > Currently, when 'hung_task_panic' is enabled, the kernel panics
> > > > immediately upon detecting the first hung task. However, some hung
> > > > tasks are transient and the system can recover, while others are
> > > > persistent and may accumulate progressively.
> > 
> > My understanding is that this patch wanted to do:
> > 
> >    + report even temporary stalls
> >    + panic only when the stall was much longer and likely persistent
> > 
> > Which might make some sense. But the code does something else.
> > 
> 
> A single task hanging for an extended period may not be a critical
> issue, as users might still log into the system to investigate.
> However, if multiple tasks hang simultaneously-such as in cases
> of I/O hangs caused by disk failures-it could prevent users from
> logging in and become a serious problem, and a panic is expected.

I see. This another approach and it makes sense as well.
An this is much more clear description than the original text.

I would also update the subject to something like:

    hung_task: Panic when there are more than N hung tasks at the same time



That said, I think that both approaches make sense.

Your approach would trigger the panic when many processes are stuck.
Note that it still might be a transient state. But I agree that
the more stuck processes exist the more serious the problem
likely is for the heath of the system.

My approach would trigger panic when a single process hangs
for a long time. It will trigger more likely only when the problem
is persistent. The seriousness depends on which particular process
get stuck.

I am fine with your approach. Just please, make more clear that
the number means the number of hung tasks at the same time.
And mention the problems to login, ...

Best Regards,
Petr
