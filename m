Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBCDCF34C7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 15:03:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75d2bec1;
	Tue, 18 Nov 2025 17:32:33 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3ce71e60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Oct 2025 09:45:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so30601455e9.1
 for <wireguard@lists.zx2c4.com>; Tue, 14 Oct 2025 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760435108; x=1761039908; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R75CvrIgcbILYeZyEie2SvMudL4DW8xIUI8yCH+RsPE=;
 b=XXYSntzQHlmsgAQw48QnaSBpxz6HdUw8EedQmGHxqbXfqcB4a/7xNt8P9yaW1puyoE
 hU/EogbVUYqldZSLmlNkWWVNDtYMSP30rZjGu3oWtZ0M1ZSP8mZ/9wvyPdYmYrxtDBSR
 t+W9QRFMlGsY7jQ/HfYIPHxKOqxgAGMwGsgtpV0oR9Puk4rbAovPoT1Wzd9QIfhlXeFT
 h3zJ3u+nwQVJIZqJaXxFTk5jE3Bkly/tTwL1BfTuqK+udr1xs1CCnMP1iMi2/mpONP/U
 VafNEzvcU9EHE+Cc6hIHKSgjjdFcz1l+GxHKs71zHluUoDDwgsJxXBRij2/32oLxiIB5
 1dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760435108; x=1761039908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R75CvrIgcbILYeZyEie2SvMudL4DW8xIUI8yCH+RsPE=;
 b=CRyh8fdf6as93bW6mAJN4EUt2tG8Gx8zCcFRCgLFu63bnGks7UulEuyNRC+DLTKf31
 ReXB3fam6oPCFiPAZQmDGy8ptf+zM2DQMsudsL/kXnhICMlzUudcDrfkE9JriR96JT2S
 cvpbOCn4ZtsMKNWRyXy4L+s3QHLTRtHvSq36geGrXDtf2Mqh/7JnnqvS0emsoxIgO18U
 +b8mHcP98jLG1IwoukskrcJWxlv0S65oL+953UmC22MCiSXE0r8g5BKw4PLZobZgbmSZ
 BYeRn21giMjTrI+vuQTMV3NdC2qj398CSXN1J6eh+mSx82zGbjI8N/kbil6VTKmGzuKf
 CJdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyeLCT3CtTeWUTGf104n/8xoa9XaL05MqONui3NCIMr1wwb4iGSdSquNQLdNQGkGML9Cpm/RIEguU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxwBc/zHw1RVd1zYfDlHU0/sE/uLahhWX+4LaaSBep4M0X95Yt3
 R5OKUv9ZZegYVMjgRynIuUnLZC01x4A0K6kL/bb3KShqgCcwa/MpY2N23O9vxgzbdnY=
X-Gm-Gg: ASbGncvw3BPrqJUoDI3MLgoSnJYeHou1+kaAisGHVBA+s3H7pGjJ2ao0dJfJgIy9Cp0
 OZU98tzMD5g7FU/Zaf+ntCnwQyG2yIHd/7ocxispRoaMdedbIO2SteGTl19qriSJoFzfSeqQrKm
 cdmt1kgdpjdkIczV4ddlVLSatwFzUEaTZrj76MrMHfvEY4XJ+jhK7qqPzVnaKaDyY0EGbP4RUaE
 qV4Ql1sHDlvEIhwR2E66vFQmOKLDqxFZNdCR8vSbO1nHWMaXj9Ojdq+IH54o2kQpKa86bLxAp3B
 Xw87HajmBQiTxGOkHCZ9zEBAhgv/oLkd8gDQhL/lAdL+dEYlZgRxpyvrHIWO1/lMamqyRz/MAi0
 L9yxx1Fi7YRK9rD0TkBUzcqPJuFSLGTNppiO2PlqZt0i+xjhXZyy5E961fybCo1DLpndyiA==
X-Google-Smtp-Source: AGHT+IFLMF/oRlSecQb1AgZUj9ViudEM8BAiQCOLkhiN8cHZAWDwJ7zBbTzbicn8TdmEii38ZLu7Sw==
X-Received: by 2002:a05:600c:890d:b0:46e:32f7:98fc with SMTP id
 5b1f17b1804b1-46fa9af3656mr132535685e9.21.1760435107774; 
 Tue, 14 Oct 2025 02:45:07 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ad27sm230711415e9.15.2025.10.14.02.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 02:45:07 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:45:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: lirongqing <lirongqing@baidu.com>, wireguard@lists.zx2c4.com,
 linux-arm-kernel@lists.infradead.org,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 linux-doc@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stanislav Fomichev <sdf@fomichev.me>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Joel Granados <joel.granados@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Florian Westphal <fw@strlen.de>, netdev@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH][v3] hung_task: Panic after fixed number of hung tasks
Message-ID: <aO4boXFaIb0_Wiif@pathway.suse.cz>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
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

On Tue 2025-10-14 13:23:58, Lance Yang wrote:
> Thanks for the patch!
> 
> I noticed the implementation panics only when N tasks are detected
> within a single scan, because total_hung_task is reset for each
> check_hung_uninterruptible_tasks() run.

Great catch!

Does it make sense?
Is is the intended behavior, please?

> So some suggestions to align the documentation with the code's
> behavior below :)

> On 2025/10/12 19:50, lirongqing wrote:
> > From: Li RongQing <lirongqing@baidu.com>
> > 
> > Currently, when 'hung_task_panic' is enabled, the kernel panics
> > immediately upon detecting the first hung task. However, some hung
> > tasks are transient and the system can recover, while others are
> > persistent and may accumulate progressively.

My understanding is that this patch wanted to do:

   + report even temporary stalls
   + panic only when the stall was much longer and likely persistent

Which might make some sense. But the code does something else.

> > --- a/kernel/hung_task.c
> > +++ b/kernel/hung_task.c
> > @@ -229,9 +232,11 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
> >   	 */
> >   	sysctl_hung_task_detect_count++;
> > +	total_hung_task = sysctl_hung_task_detect_count - prev_detect_count;
> >   	trace_sched_process_hang(t);
> > -	if (sysctl_hung_task_panic) {
> > +	if (sysctl_hung_task_panic &&
> > +			(total_hung_task >= sysctl_hung_task_panic)) {
> >   		console_verbose();
> >   		hung_task_show_lock = true;
> >   		hung_task_call_panic = true;

I would expect that this patch added another counter, similar to
sysctl_hung_task_detect_count. It would be incremented only
once per check when a hung task was detected. And it would
be cleared (reset) when no hung task was found.

Best Regards,
Petr
