Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBED5C00307
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:15:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9381620644
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ncYYKYZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9381620644
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18cf20d9;
	Fri, 6 Sep 2019 19:15:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9f8b411
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:15:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c428a68
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:15:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26068763
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ahTndUaSulLOdXRaPbIXWfHUFzU=; b=ncYYKY
 ZVcZ6LCiTwdjBz0dP5kwU7y5usrm5a6sbWB4tfy9sdFP9e412FCXsAEsr5qhCMQj
 fbISk3ngcubjZKlpqV2rC79HdJlD1bKWJyGPHG6i4OgLerrTWHVq0LgXAmVlCEuD
 djGyf0yuCQ9UClAWSRpEHZ4h7sfwos/IrZ1ghvHdLxO5O1mBYshQHcGr416nwJUb
 QdOnhc2Gs0yxWmKDcf1B9RBWIiTgSYi4e5l78RgUWtA7NknTfA6X69cD4Wu7JaBM
 VxJeehkmuDvNe0vqY+gdiEXGsDrh70pjfK13pkzOU4tbkES7XV+278DoXB3DsOXp
 8su4GXXi857GY3YQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 03553f4a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:32:18 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id b80so5848162oii.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 12:15:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXliSddWor+JHI3CXWvCrVG2mQPCnC4yyG17Hj63GUlwgqlsSJx
 dHxPDagYPLGhS5vSERZNbKDu/+HzC6tTA3bODuM=
X-Google-Smtp-Source: APXvYqzgEbDeOmBk5brkrrL7CgwD1QEMhs3bJoIX9tWfz/wPctVWVLfMsmeMHhg8MLOGw7QZCJwMRPA3CkUcHbHKWhw=
X-Received: by 2002:aca:f555:: with SMTP id t82mr8105074oih.66.1567797338949; 
 Fri, 06 Sep 2019 12:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
In-Reply-To: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 13:15:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9p4eKZMZgwJxvs_FDRRTnrmyw366mcHyJ+pdB_ccALN0w@mail.gmail.com>
Message-ID: <CAHmME9p4eKZMZgwJxvs_FDRRTnrmyw366mcHyJ+pdB_ccALN0w@mail.gmail.com>
Subject: Re: Problems on linux-image-4.15.0-1047-aws
To: Johnny Rose Carlsen <jrcarlsen@gmail.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Johnny,

Thanks for the report. Can you confirm whether or not you're running
the latest kernel offered by `apt update && apt upgrade`? If you are,
then perhaps Sultan (CC'd) will be be interested to learn about Ubuntu
4.15 breakage.

Jason

On Fri, Sep 6, 2019 at 1:09 PM Johnny Rose Carlsen <jrcarlsen@gmail.com> wrote:
>
> I am running Ubuntu 18.04 on Amazon AWS, and I just ran a dist-upgrade
> that upgraded my kernel from linux-image-4.15.0-1041-aws to
> linux-image-4.15.0-1047-aws, and Wireguard is now failing with the
> following error:
>
> [   50.640515] BUG: unable to handle kernel NULL pointer dereference
> at 000000000000054a
> [   50.647808] IP: skb_set_owner_w+0x30/0xb0
> [   50.651708] PGD 0 P4D 0
> [   50.654476] Oops: 0000 [#1] SMP PTI
> [   50.657963] Modules linked in: wireguard(OE) ip6_udp_tunnel
> udp_tunnel serio_raw sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core
> iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables
> x_tables autofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov
> async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1
> raid0 multipath linear crct10dif_pclmul crc32_pclmul
> ghash_clmulni_intel pcbc aesni_intel aes_x86_64 crypto_simd
> glue_helper cryptd
> [   50.691945] CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G
> OE    4.15.0-1047-aws #49-Ubuntu
> [   50.698795] Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
> [   50.702783] Workqueue: wg-crypt-wg21 wg_packet_decrypt_worker [wireguard]
> [   50.706986] RIP: 0010:skb_set_owner_w+0x30/0xb0
> [   50.709950] RSP: 0018:ffffaf96c0223a70 EFLAGS: 00010246
> [   50.713515] RAX: 0000000000000000 RBX: ffff979d1ebeba00 RCX: 0000000000000000
> [   50.717860] RDX: ffff979d19646000 RSI: 0000000000000538 RDI: ffff979d1ebeba00
> [   50.723405] RBP: ffffaf96c0223a80 R08: 00000000000006c0 R09: ffff979d1cc02d80
> [   50.729688] R10: ffffaf96c0223970 R11: ffff979d1cc02d80 R12: 0000000000000538
> [   50.736138] R13: 0000000000000000 R14: ffff979d1ebeba00 R15: ffff979d184fe100
> [   50.743111] FS:  0000000000000000(0000) GS:ffff979d1f200000(0000)
> knlGS:0000000000000000
> [   50.750900] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   50.756707] CR2: 000000000000054a CR3: 0000000015e0a006 CR4: 00000000001606f0
> [   50.763817] Call Trace:
> [   50.766859]  skb_cow_data+0x9e/0x340
> [   50.770908]  decrypt_packet+0xd1/0x1d0 [wireguard]
> [   50.775834]  ? ip_finish_output+0x198/0x270
> [   50.780265]  ? ip_finish_output+0x198/0x270
> [   50.784982]  ? ip_output+0x70/0xe0
> [   50.788772]  ? __update_load_avg_se.isra.37+0x1c0/0x1d0
> [   50.794426]  ? prandom_u32+0x18/0x20
> [   50.798727]  ? ip_local_out+0x3b/0x50
> [   50.803031]  ? iptunnel_xmit+0x154/0x1f0
> [   50.807233]  ? udp_tunnel_xmit_skb+0xef/0x110 [udp_tunnel]
> [   50.812613]  ? send4+0x129/0x380 [wireguard]
> [   50.817185]  ? send4+0x13e/0x380 [wireguard]
> [   50.821825]  ? _cond_resched+0x19/0x40
> [   50.826004]  ? __kmalloc_node+0x21b/0x2c0
> [   50.830431]  ? kvmalloc_node+0x75/0x80
> [   50.834761]  ? _cond_resched+0x19/0x40
> [   50.838897]  ? kvmalloc_node+0x75/0x80
> [   50.842989]  ? alloc_bucket_locks.isra.14+0x89/0xf0
> [   50.847874]  ? call_rcu_sched+0x17/0x20
> [   50.851553]  ? rht_deferred_worker+0x31c/0x400
> [   50.855225]  wg_packet_decrypt_worker+0x90/0x180 [wireguard]
> [   50.861068]  process_one_work+0x1de/0x420
> [   50.865485]  worker_thread+0x32/0x410
> [   50.869620]  kthread+0x121/0x140
> [   50.873241]  ? process_one_work+0x420/0x420
> [   50.877528]  ? kthread_create_worker_on_cpu+0x70/0x70
> [   50.882591]  ret_from_fork+0x35/0x40
> [   50.886446] Code: 48 8b 47 60 55 48 89 e5 41 54 53 48 85 c0 48 89
> fb 49 89 f4 0f 84 83 00 00 00 e8 2c c3 41 00 48 c7 43 60 00 00 00 00
> 4c 89 63 18 <41> 0f b6 4c 24 12 b8 01 00 00 00 d3 e0 a9 bf ef ff ff 74
> 45 48
> [   50.903567] RIP: skb_set_owner_w+0x30/0xb0 RSP: ffffaf96c0223a70
> [   50.909341] CR2: 000000000000054a
> [   50.913177] ---[ end trace e139c84255b1aea4 ]---
>
> The Wireguard version is:
> 0.0.20190702-wg1~bionic
>
> Please let me know what other information could be helpful to troubleshoot this.
>
> --
> Best Regards,
> Johnny Carlsen
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
