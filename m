Return-Path: <SRS0=vxWX=6P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE80C35280
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:36:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FEC208DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lz+A3dR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FEC208DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8e762ef;
	Fri, 1 May 2020 21:23:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 739bb9f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:23:46 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 294aa520
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=m08UdedwexGGrbw8J6LkyHWjNEM=; b=lz+A3d
 R2fzWbP5u4GvTlebSLkOVX+uJm6ugkIc1XcTza4qH5xnTmYrJuJSaNw0pEoWLaOp
 mW2RN8M67oLnEeJO95igXgKa2eqtJPUBKY/BE/2jeWPQ1J+BUfnV2i7C5p0JdrCA
 Tep3YMC8R/QWj5koHpTwGRbVrXOxrkTxGKRpHgfOpZCYXRvYwpqZU3vAqMrM5l5Z
 IK6L5g5gV0rPBfLcl+O1P+ggpti3oI9VftwdeY+xvoTOrVpkHeKl8KZOedbAXdIb
 u46Ad6JRxDr+g8huVQl4ClTUhuqIamplEkfICcC8Bi63U/HbC/OUlgdmUM69Bvc0
 JMJ0M6EBZz/ONdqg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80d2b79e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:23:46 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id c2so6175338iow.7
 for <wireguard@lists.zx2c4.com>; Fri, 01 May 2020 14:35:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuZucG45fiUr9OONpC+qknV3ScqCHftHhRGb1rFUpNTTXOnMJdeI
 A+KcRdxmHqbKQ7yAhGkzY1GZA6+B0I4KRYDHPQA=
X-Google-Smtp-Source: APiQypLPg7iwt+DkDCBjAHouNj1JjAs7TtSLoZ+QzwFrZpHJXZZzVSBz02GsIu/PxatS9TWp7+nHk88fvCj49Tpi7+E=
X-Received: by 2002:a6b:7114:: with SMTP id q20mr5570921iog.79.1588368949891; 
 Fri, 01 May 2020 14:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200430135551.9911-1-mardnh@gmx.de>
 <CAHmME9p0u2=i1+ApzsHicFy4VrGKOcE0sD_e5Yk5b-y9UrZBow@mail.gmail.com>
 <9d644025-9b85-51a1-58f8-07e445c61492@gmx.de>
In-Reply-To: <9d644025-9b85-51a1-58f8-07e445c61492@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 May 2020 15:35:38 -0600
X-Gmail-Original-Message-ID: <CAHmME9p--JcBcVdFKVnaexYy-NWobGudQyA7z9KX5w1KBW4cbw@mail.gmail.com>
Message-ID: <CAHmME9p--JcBcVdFKVnaexYy-NWobGudQyA7z9KX5w1KBW4cbw@mail.gmail.com>
Subject: Re: [PATCH] systemd: add file wireguard.target
To: Martin Hauke <mardnh@gmx.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, May 1, 2020 at 3:29 PM Martin Hauke <mardnh@gmx.de> wrote:
>
> Am 01.05.20 um 01:21 schrieb Jason A. Donenfeld:
> > On Thu, Apr 30, 2020 at 7:56 AM Martin Hauke <mardnh@gmx.de> wrote:
> >> +PartOf=wireguard.target
> >
> > This won't reset wireguard interfaces configured by systemd-networkd,
> > nor interfaces configured manually, right? So maybe it's better to
> > call this wg-quick.target?
>
> Correct, then let's call this wg-quick.target .
>
> >> +Description=Target to restart all parts of WireGuard
> >
> > Is this verbage consistent with other systemd targets? Specifically,
> > is the "to restart" part apt? Or should this say something more
> > general?
>
> How about "Description=WireGuard target allowing to start/stop all
> wg-quick@.service instances at once" ?

Based on the language pattern established by below,
"Description=WireGuard Tunnels via wg-quick(8)" seems more fitting.

$ rg -g '*.target' ^Description= /lib/systemd
/lib/systemd/system/initrd-fs.target:Description=Initrd File Systems
/lib/systemd/system/printer.target:Description=Printer
/lib/systemd/system/kexec.target:Description=Reboot via kexec
/lib/systemd/system/emergency.target:Description=Emergency Mode
/lib/systemd/system/getty-pre.target:Description=Login Prompts (Pre)
/lib/systemd/system/local-fs.target:Description=Local File Systems
/lib/systemd/system/initrd-root-device.target:Description=Initrd Root Device
/lib/systemd/system/initrd-switch-root.target:Description=Switch Root
/lib/systemd/system/basic.target:Description=Basic System
/lib/systemd/system/umount.target:Description=Unmount All Filesystems
/lib/systemd/system/rescue.target:Description=Rescue Mode
/lib/systemd/system/reboot.target:Description=Reboot
/lib/systemd/system/poweroff.target:Description=Power-Off
/lib/systemd/system/remote-fs-pre.target:Description=Remote File Systems (Pre)
/lib/systemd/system/timers.target:Description=Timers
/lib/systemd/system/network-pre.target:Description=Network (Pre)
/lib/systemd/system/final.target:Description=Final Step
/lib/systemd/system/remote-cryptsetup.target:Description=Remote
Encrypted Volumes
/lib/systemd/system/hibernate.target:Description=Hibernate
/lib/systemd/system/getty.target:Description=Login Prompts
/lib/systemd/system/slices.target:Description=Slices
/lib/systemd/system/boot-complete.target:Description=Boot Completion Check
/lib/systemd/system/nss-user-lookup.target:Description=User and Group
Name Lookups
/lib/systemd/system/nss-lookup.target:Description=Host and Network Name Lookups
/lib/systemd/system/hybrid-sleep.target:Description=Hybrid Suspend+Hibernate
/lib/systemd/system/suspend-then-hibernate.target:Description=Suspend;
Hibernate if not used for a period of time
/lib/systemd/system/sockets.target:Description=Sockets
/lib/systemd/system/paths.target:Description=Paths
/lib/systemd/system/graphical.target:Description=Graphical Interface
/lib/systemd/system/cryptsetup.target:Description=Local Encrypted Volumes
/lib/systemd/system/local-fs-pre.target:Description=Local File Systems (Pre)
/lib/systemd/system/halt.target:Description=Halt
/lib/systemd/system/nfs-client.target:Description=NFS client services
/lib/systemd/system/rpcbind.target:Description=RPC Port Mapper
/lib/systemd/system/machines.target:Description=Containers
/lib/systemd/system/multi-user.target:Description=Multi-User System
/lib/systemd/system/network.target:Description=Network
/lib/systemd/system/swap.target:Description=Swap
/lib/systemd/system/network-online.target:Description=Network is Online
/lib/systemd/system/initrd.target:Description=Initrd Default Target
/lib/systemd/system/initrd-root-fs.target:Description=Initrd Root File System
/lib/systemd/system/smartcard.target:Description=Smart Card
/lib/systemd/system/shutdown.target:Description=Shutdown
/lib/systemd/system/bluetooth.target:Description=Bluetooth
/lib/systemd/system/system-update-pre.target:Description=Offline
System Update (Pre)
/lib/systemd/system/remote-fs.target:Description=Remote File Systems
/lib/systemd/system/time-sync.target:Description=System Time Synchronized
/lib/systemd/system/suspend.target:Description=Suspend
/lib/systemd/system/blockdev@.target:Description=Block Device Preparation for %f
/lib/systemd/system/sleep.target:Description=Sleep
/lib/systemd/system/system-update.target:Description=Offline System Update
/lib/systemd/system/nvmf-connect.target:Description=All instances of
nvmf-autoconnect daemon
/lib/systemd/system/sound.target:Description=Sound Card
/lib/systemd/system/exit.target:Description=Exit the container
/lib/systemd/system/time-set.target:Description=System Time Set
/lib/systemd/system/sysinit.target:Description=System Initialization
/lib/systemd/system/sigpwr.target:Description=Power Failure
/lib/systemd/system/cryptsetup-pre.target:Description=Local Encrypted
Volumes (Pre)
