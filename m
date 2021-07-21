Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5234CC4320E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E58D60E97
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E58D60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gips.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6a8647e;
	Mon, 2 Aug 2021 13:14:19 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e944b2c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jul 2021 17:05:26 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id gh6so1278778qvb.3
 for <wireguard@lists.zx2c4.com>; Wed, 21 Jul 2021 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gips-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=u5+CPCupJEN9fW5E6mFZhwe8W6WRRP3NzshitEJkjfE=;
 b=O6KgwZFGU3aGHrZlzN9yUkUaR4HOWWgFHZa/Oa3eNtVz29EcM1vGTqIigAO11enT0+
 oaqlTJtEi+OJo/UU34w/l+g6KaS+Sd4oxK67UkrpHuPVlZ5HgHr5mP8KV4xh2+G5B/+6
 USLPGo1X3edeFXozBfMH5R+gw2LG/3Th0Wi8hpcsG5HHH4uD+bc3/IK96pXdGJB8pKCV
 rnrJaMJR87joZ29njrV1+mDhznuv6y6RV1D4/9JzQoj5PVLDIBHnTO7jD02AOMaWyOKp
 h3RqC/tQMqT70Y1DPEaX/m1/B6+7A30HAHj5T2FnmwoZvXc/CzpevvXAe2T7/whJF4lo
 lCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=u5+CPCupJEN9fW5E6mFZhwe8W6WRRP3NzshitEJkjfE=;
 b=PQlSr4E3CJhasM//vD16jeGQkhbJwGBoSJYKSx1UXYWPVF3wZve/9R4wBIJoeSI8Mx
 7U6JOl8rRzvzYzmtmR5gM3YwS5D0Ps8W0kXZhnQGBSqOG87vzGcPFiTPEUeb5wxlQGuC
 kJrRD8GeS2ulke4mDynm4WKmviTe0pnrihfG6BVivgz0oMUCrLyUTLHn09rFLdnkf+7n
 GrIS0QRvDgI3XcIyHTuf6iZjy2wkI3U+GRNqYs+CTm0i2d5WPg+WgEFtu8LO1EeV4j51
 yC5xFkahMxojEa70cUT0/7rnPqzHYGrebMBcAWkAjgGqNK2fxJfxF2cjVIa+kgm3g0/4
 qQEA==
X-Gm-Message-State: AOAM533TzpVIweK2NAxbvZgyKA3WCwMAARGNKsbqarakQRuJkhtbPJuw
 F0wJoqeAPQnKHAqGnPLy/To8nVireCnd
X-Google-Smtp-Source: ABdhPJzDzmR1BslwtEKfYlO76Tr/S+i87CJTv3fePyvuDHnBmhHoCZtFf0JnCARU4nr13EqzRPQoSA==
X-Received: by 2002:a0c:ff48:: with SMTP id y8mr37340469qvt.29.1626887124924; 
 Wed, 21 Jul 2021 10:05:24 -0700 (PDT)
Received: from smtpclient.apple (c-73-142-15-55.hsd1.ma.comcast.net.
 [73.142.15.55])
 by smtp.gmail.com with ESMTPSA id w71sm11632153qkb.67.2021.07.21.10.05.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:05:24 -0700 (PDT)
From: Jonathan Gips <jon@gips.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Kernel error accessing user memory 
Message-Id: <3E5B9FB3-741F-4953-BD1A-9EA83A6FEF8E@gips.com>
Date: Wed, 21 Jul 2021 13:05:23 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

Hello WireGuard Maintainers,

I am seeing the following kernel error when running WireGuard as a =
kernel module on my Ubuntu 18.04 armv8 device:=20

"Internal error: Accessing user space memory outside uaccess.h routines: =
96000005 [#1] PREEMPT SMP=E2=80=9D

Has anyone come across this? I have seen mention on the Nvidia forums =
that this issue can arise on newer armv8 CPUs when a kernel module =
directly accesses userspace memory, with the recommended fix being to =
use copy_from_user() and copy_to_user().=20

My device's configuration:
--------------------------
- Nvidia Jetson Nano
- CPU: Armv8, 64-bit
- OS: Ubuntu 18.04 / Bionic
- uname -a: Linux jetson-nano 4.9.201-tegra #1 SMP PREEMPT Fri Feb 19 =
08:40:32 PST 2021 aarch64 aarch64 aarch64 GNU/Linux

Apt package configuration:
--------------------------
- wireguard/bionic-updates,now 1.0.20200513-1~18.04.2 all [installed]
- wireguard-dkms/bionic-updates,now 1.0.20201112-1~18.04.1 all =
[installed,automatic]
- wireguard-tools/bionic-updates,now 1.0.20200513-1~18.04.2 arm64 =
[installed]

Full syslog entry for kernel error:
-----------------------------------
May 4 18:45:22 jetson-nano kernel: [628210.837536] Internal error: =
Accessing user space memory outside uaccess.h routines: 96000005 [#1] =
PREEMPT SMP
May 4 18:45:22 jetson-nano kernel: [628210.847539] Modules linked in: =
wireguard ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink =
nfnetlink br_netfilter overlay iwlmvm mac80211 bnep btusb btrtl btbcm =
btintel iwlwifi zram spidev cfg80211 ipt_REJECT nf_reject_ipv4 xt_limit =
xt_tcpudp xt_addrtype xt_conntrack iptable_nat nf_conntrack_ipv4 =
nf_defrag_ipv4 nf_nat_ipv4 ip6table_mangle userspace_alert nvgpu =
iptable_mangle ip6table_filter ip6_tables nf_conntrack_netbios_ns =
nf_conntrack_broadcast nf_nat_ftp nf_nat bluedroid_pm nf_conntrack_ftp =
nf_conntrack iptable_filter ip_tables x_tables
May 4 18:45:22 jetson-nano kernel: [628210.896578] CPU: 1 PID: 3832 =
Comm: exe Not tainted 4.9.201-tegra #1
May 4 18:45:22 jetson-nano kernel: [628210.902921] Hardware name: =
custom-jetson-carrier (DT)
May 4 18:45:22 jetson-nano kernel: [628210.908137] task: =
ffffffc0d02c0e00 task.stack: ffffffc00d7ac000
May 4 18:45:22 jetson-nano kernel: [628210.914140] PC is at =
do_last+0x54/0xfd0
May 4 18:45:22 jetson-nano kernel: [628210.918057] LR is at =
path_openat+0x90/0x378
May 4 18:45:22 jetson-nano kernel: [628210.922320] pc : [] lr : [] =
pstate: 20400145
May 4 18:45:22 jetson-nano kernel: [628210.929792] sp : ffffffc00d7afbc0
May 4 18:45:22 jetson-nano kernel: [628210.933188] x29: ffffffc00d7afbc0 =
x28: ffffffc0d02c0e00
May 4 18:45:22 jetson-nano kernel: [628210.938595] x27: ffffffc00d7afd48 =
x26: ffffffc087b23e40
May 4 18:45:22 jetson-nano kernel: [628210.944000] x25: ffffffc00d7afe7c =
x24: 0000000000000000
May 4 18:45:22 jetson-nano kernel: [628210.949403] x23: 0000000000000041 =
x22: 0000000000000002
May 4 18:45:22 jetson-nano kernel: [628210.954805] x21: ffffffc037fb9100 =
x20: ffffffc00d7afcfc
May 4 18:45:22 jetson-nano kernel: [628210.960208] x19: 0000000000020041 =
x18: 00000000000002c8
May 4 18:45:22 jetson-nano kernel: [628210.965611] x17: 000000000000006e =
x16: 0000000000000000
May 4 18:45:22 jetson-nano kernel: [628210.971013] x15: 00000000000000f9 =
x14: 0000000000000000
May 4 18:45:22 jetson-nano kernel: [628210.976416] x13: 0000000000000080 =
x12: 732f74752f626772
May 4 18:45:22 jetson-nano kernel: [628210.981818] x11: 5f63652f7070612f =
x10: d0d0d0d0d0d0d0d0
May 4 18:45:22 jetson-nano kernel: [628210.987221] x9 : 96a4abb42eef25a3 =
x8 : 70d6b989bf66a5a8
May 4 18:45:22 jetson-nano kernel: [628210.992625] x7 : 30017cce4247b231 =
x6 : e672123d9189800b
May 4 18:45:22 jetson-nano kernel: [628210.998027] x5 : 0000000000000018 =
x4 : fefefefefefefeff
May 4 18:45:22 jetson-nano kernel: [628211.003430] x3 : ffffffc00d7afcfc =
x2 : 0000000000000000
May 4 18:45:22 jetson-nano kernel: [628211.008834] x1 : 0000000000000000 =
x0 : 0000000000000041
May 4 18:45:22 jetson-nano kernel: [628211.014237]
May 4 18:45:22 jetson-nano kernel: [628211.015811] Process exe (pid: =
3832, stack limit =3D 0xffffffc00d7ac000)
May 4 18:45:22 jetson-nano kernel: [628211.022327] Call trace:
May 4 18:45:22 jetson-nano kernel: [628211.024860] [] do_last+0x54/0xfd0
May 4 18:45:22 jetson-nano kernel: [628211.029818] [] =
path_openat+0x90/0x378
May 4 18:45:22 jetson-nano kernel: [628211.035122] [] =
do_filp_open+0x70/0xe8
May 4 18:45:22 jetson-nano kernel: [628211.040425] [] =
do_sys_open+0x174/0x258
May 4 18:45:22 jetson-nano kernel: [628211.045816] [] =
SyS_openat+0x3c/0x50
May 4 18:45:22 jetson-nano kernel: [628211.050947] [] =
el0_svc_naked+0x34/0x38
May 4 18:45:22 jetson-nano kernel: [628211.056341] ---[ end trace =
c646984c02898d73 ]---
May 4 18:45:43 jetson-nano kernel: [628231.843814] INFO: rcu_preempt =
detected stalls on CPUs/tasks:
May 4 18:45:43 jetson-nano kernel: [628231.849575] Tasks blocked on =
level-0 rcu_node (CPUs 0-3): P3832
May 4 18:45:43 jetson-nano kernel: [628231.855674] (detected by 1, =
t=3D5255 jiffies, g=3D39064575, c=3D39064574, q=3D28414)
May 4 18:45:43 jetson-nano kernel: [628231.862901] exe D 0 3832 6362 =
0x00000008
May 4 18:45:43 jetson-nano kernel: [628231.868476] Call trace:
May 4 18:45:43 jetson-nano kernel: [628231.871012] [] =
__switch_to+0x9c/0xc0
May 4 18:45:43 jetson-nano kernel: [628231.876233] [] =
__schedule+0x270/0x780
May 4 18:45:43 jetson-nano kernel: [628231.881539] [] schedule+0x40/0xa8
May 4 18:45:43 jetson-nano kernel: [628231.886497] [] =
schedule_timeout+0x1ec/0x420
May 4 18:45:43 jetson-nano kernel: [628231.892322] [] =
wait_for_common+0xa0/0x140
May 4 18:45:43 jetson-nano kernel: [628231.897975] [] =
wait_for_completion+0x28/0x38
May 4 18:45:43 jetson-nano kernel: [628231.903887] [] =
__wait_rcu_gp+0x104/0x138
May 4 18:45:43 jetson-nano kernel: [628231.909452] [] =
synchronize_rcu+0x80/0x90
May 4 18:45:43 jetson-nano kernel: [628231.915017] [] =
namespace_unlock+0x58/0x68
May 4 18:45:43 jetson-nano kernel: [628231.920668] [] =
drop_collected_mounts+0x78/0x88
May 4 18:45:43 jetson-nano kernel: [628231.926751] [] =
put_mnt_ns+0x3c/0x50
May 4 18:45:43 jetson-nano kernel: [628231.931880] [] =
free_nsproxy+0x24/0xe8
May 4 18:45:43 jetson-nano kernel: [628231.937182] [] =
switch_task_namespaces+0x70/0x80
May 4 18:45:43 jetson-nano kernel: [628231.943351] [] =
exit_task_namespaces+0x24/0x30
May 4 18:45:43 jetson-nano kernel: [628231.949349] [] =
do_exit+0x2b8/0xa50
May 4 18:45:43 jetson-nano kernel: [628231.954392] [] die+0x194/0x198
May 4 18:45:43 jetson-nano kernel: [628231.959089] [] =
do_page_fault+0x1ec/0x480
May 4 18:45:43 jetson-nano kernel: [628231.964651] [] =
do_translation_fault+0x6c/0x80
May 4 18:45:43 jetson-nano kernel: [628231.970648] [] =
do_mem_abort+0x54/0xb0
May 4 18:45:43 jetson-nano kernel: [628231.975950] [] el1_da+0x24/0xbc
May 4 18:45:43 jetson-nano kernel: [628231.980735] [] =
path_openat+0x90/0x378
May 4 18:45:43 jetson-nano kernel: [628231.986037] [] =
do_filp_open+0x70/0xe8
May 4 18:45:43 jetson-nano kernel: [628231.991340] [] =
do_sys_open+0x174/0x258
May 4 18:45:43 jetson-nano kernel: [628231.996729] [] =
SyS_openat+0x3c/0x50
May 4 18:45:43 jetson-nano kernel: [628232.001859] [] =
el0_svc_naked+0x34/0x38
May 4 18:45:43 jetson-nano kernel: [628232.007249] exe D 0 3832 6362 =
0x00000008
May 4 18:45:43 jetson-nano kernel: [628232.012826] Call trace:
May 4 18:45:43 jetson-nano kernel: [628232.015361] [] =
__switch_to+0x9c/0xc0
May 4 18:45:43 jetson-nano kernel: [628232.020581] [] =
__schedule+0x270/0x780
May 4 18:45:43 jetson-nano kernel: [628232.025885] [] schedule+0x40/0xa8
May 4 18:45:43 jetson-nano kernel: [628232.030842] [] =
schedule_timeout+0x1ec/0x420
May 4 18:45:43 jetson-nano kernel: [628232.036668] [] =
wait_for_common+0xa0/0x140
May 4 18:45:43 jetson-nano kernel: [628232.042319] [] =
wait_for_completion+0x28/0x38
May 4 18:45:43 jetson-nano kernel: [628232.048231] [] =
__wait_rcu_gp+0x104/0x138
May 4 18:45:43 jetson-nano kernel: [628232.053797] [] =
synchronize_rcu+0x80/0x90
May 4 18:45:43 jetson-nano kernel: [628232.059362] [] =
namespace_unlock+0x58/0x68
May 4 18:45:43 jetson-nano kernel: [628232.065013] [] =
drop_collected_mounts+0x78/0x88
May 4 18:45:43 jetson-nano kernel: [628232.071097] [] =
put_mnt_ns+0x3c/0x50
May 4 18:45:43 jetson-nano kernel: [628232.076228] [] =
free_nsproxy+0x24/0xe8
May 4 18:45:43 jetson-nano kernel: [628232.081531] [] =
switch_task_namespaces+0x70/0x80
May 4 18:45:43 jetson-nano kernel: [628232.087702] [] =
exit_task_namespaces+0x24/0x30
May 4 18:45:43 jetson-nano kernel: [628232.093700] [] =
do_exit+0x2b8/0xa50

Thanks,
Jon=
