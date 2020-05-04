Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E2BC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 22:55:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6940F206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 22:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IDXjs5+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6940F206EB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd576392;
	Mon, 4 May 2020 22:42:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 534d74f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 22:42:35 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 499e2faf;
 Mon, 4 May 2020 22:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=i0ylfdx1DjV8
 qrPhs9eQPqxjcMY=; b=IDXjs5+gX6tNaWx4xN+3Jh+Fh+T+yLj385KVyaaz1Wd9
 3Q5I0iGzKGt887IGUs3hqY4rpD7Bi2sObLK7+EKJd+NBxp9dnRLLLxr43HmSdDkx
 2UHOKFbEWN+5yh1upEqCZXmXijrEoCoD4jtytgoF+hinfFXVY3554NP7iwwEXk3Q
 B3kOE4IZnMJyT3lkFXHn2veKJ+x5kkJ9eL52FlNFZDIbZteb1a0AhJx7DTc58tsj
 DZ/Jo4xXdUVgQVwomDcbOYou8yKAAlfj3hK1bNb5YLh5jcCH6Ty0GBo35NseqVML
 1zwqh45P8w8JYY0c21Na6LOVcOUDpW57MDxpXzVdFQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 92821b7d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 May 2020 22:42:35 +0000 (UTC)
Subject: Re: soft lockup - may be related to wireguard (backported)
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
 <878si8564q.fsf@depni.sinp.msu.ru>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <cacb70ea-1ecb-51ec-1201-240047ee8dc0@zx2c4.com>
Date: Mon, 4 May 2020 16:55:02 -0600
MIME-Version: 1.0
In-Reply-To: <878si8564q.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 5/4/20 4:47 AM, Serge Belyshev wrote:
> Hi! I can reproduce similar RCU stall with a different kernel under
> specific conditions on a specific box:
> 
> [   54.437636] rcu: INFO: rcu_sched self-detected stall on CPU
> [   54.438838] rcu:  0-...!: (2101 ticks this GP) idle=ea6/1/0x4000000000000002 softirq=604/604 fqs=0
> [   54.440052]  (t=2101 jiffies g=69 q=89)
> [   54.441273] rcu: rcu_sched kthread starved for 2101 jiffies! g69 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
> [   54.442547] rcu: RCU grace-period kthread stack dump:
> [   54.443812] rcu_sched       I    0    10      2 0x80004000
> [   54.443814] Call Trace:
> [   54.445087]  ? __schedule+0x540/0xa80
> [   54.446356]  schedule+0x45/0xb0
> [   54.447612]  schedule_timeout+0x144/0x280
> [   54.448859]  ? __next_timer_interrupt+0xc0/0xc0
> [   54.450099]  rcu_gp_kthread+0x3f0/0x840
> [   54.451329]  kthread+0xe6/0x120
> [   54.452557]  ? rcu_gp_slow.part.0+0x30/0x30
> [   54.453761]  ? __kthread_create_on_node+0x150/0x150
> [   54.454943]  ret_from_fork+0x1f/0x30
> [   54.456095] NMI backtrace for cpu 0
> [   54.457221] CPU: 0 PID: 2910 Comm: md5sum Not tainted 5.6.0-00001-g6e142c237f00 #1309
> [   54.458355] Hardware name: Gigabyte Technology Co., Ltd. GA-MA790FX-DQ6/GA-MA790FX-DQ6, BIOS F7g 07/19/2010
> [   54.459484] Call Trace:
> [   54.460576]  <IRQ>
> [   54.461672]  dump_stack+0x50/0x70
> [   54.462772]  nmi_cpu_backtrace.cold+0x14/0x53
> [   54.463871]  ? lapic_can_unplug_cpu.cold+0x3e/0x3e
> [   54.464955]  nmi_trigger_cpumask_backtrace+0x7c/0x89
> [   54.466026]  rcu_dump_cpu_stacks+0x7b/0xa9
> [   54.467088]  rcu_sched_clock_irq.cold+0x153/0x38a
> [   54.468146]  update_process_times+0x1f/0x50
> [   54.469204]  tick_sched_timer+0x33/0x70
> [   54.470262]  ? tick_sched_do_timer+0x50/0x50
> [   54.471321]  __hrtimer_run_queues+0xe2/0x180
> [   54.472378]  hrtimer_interrupt+0x109/0x240
> [   54.473423]  smp_apic_timer_interrupt+0x48/0x80
> [   54.474461]  apic_timer_interrupt+0xf/0x20
> [   54.475486]  </IRQ>
> [   54.476495] RIP: 0033:0x556cbd33bf19
> [   54.477506] Code: ce 44 8b 4b 10 c1 c9 0f 01 d1 44 89 4c 24 c8 21 ce 31 c6 01 fe 41 8d bc 01 af 0f 7c f5 89 d0 44 8b 4b 3c c1 ce 0a 31 c8 01 ce <21> f0 31 d0 01 f8 41 8d bc 12 2a c6 87 47 89 ca 41 89 ea c1 c0 07
> [   54.479694] RSP: 002b:00007ffc30913ce8 EFLAGS: 00000283 ORIG_RAX: ffffffffffffff13
> [   54.480813] RAX: 00000000980270bd RBX: 0000556cbe81e4e0 RCX: 00000000c35c3b1a
> [   54.481943] RDX: 000000005b5e4ba7 RSI: 00000000ae8ee5ae RDI: 0000000009b5de85
> [   54.483075] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [   54.484201] R10: 0000000000000000 R11: 00000000b16eb4f8 R12: 0000000000000000
> [   54.485317] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000023604445
> 

I don't see anything wireguard-related in this stacktrace. Can you try 
sending one that has something wireguard-related in it? Or is more complete?
