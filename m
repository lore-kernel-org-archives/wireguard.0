Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C384C0018C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:48:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE38923A9D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE38923A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=essd.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94c82b07;
	Sat, 19 Dec 2020 11:39:49 +0000 (UTC)
Received: from pmg01-out3.zxcs.nl (pmg01-out3.zxcs.nl [2a06:2ec0:1:b::ffeb])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f773bebb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:11:17 +0000 (UTC)
Received: from pmg01.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg01.zxcs.nl (ZXCS) with ESMTP id 2EA7E10567D
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 12:20:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=essd.nl;
 s=x; h=Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Content-Type
 :MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=srm1kcGdhb3Cfw9ucNVnoUvO5WLdz1SFJBAHZWChcds=; b=M
 +zn1Mc2dHzMSM2qEAoFOysvP0nUK9K0srqhn9dXye9qwacliIFme6L+6ceJH7D414abY9kDV43nnC
 /TChH8FjRwYWEh93G3Wx5H0XfXYjmnkcbJfxrWtwwoezT1UtI9eafxVowSIB1ODHPqVCXG9ML2E2G
 dl+H+FThC8TzuLyGswzmWRWX+xXrAxCy8lsXRENq9P/hXdTF/ufQ4G62rokumLIifE3kRCKqZHHC1
 01nhmoyaFzMFBjzO5wPbuq4FEhA/ZywGpAKzlBwD+/egGy6W8Ze3X+htT6m2y01cuSMWktnbU3wVx
 WQeNOiES+B/U8x7vft+qmXTmYWnPT3k/Q==;
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 19 Dec 2020 12:20:01 +0100
From: Erik Schuitema <erik@essd.nl>
To: wireguard@lists.zx2c4.com
Subject: "BUG: scheduling while atomic" on 5.4 kernels with PREEMPT_RT
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <90c10d21558d31825a56aac48692b080@essd.nl>
X-Sender: erik@essd.nl
X-AuthUser: erik@essd.nl
X-Mailman-Approved-At: Sat, 19 Dec 2020 12:39:47 +0100
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

Hi,

I ran into an issue with Wireguard on Linux 5.4 kernels with the 
PREEMPT_RT patch, on Ubuntu 18.04. I tried kernels 5.4.47-rt28 and 
5.4.82-rt45.
Everything is fine until I send actual data to the machine through scp, 
resulting in the kernel log below stating "BUG: scheduling while 
atomic".
I tried both the latest Ubuntu package (with wireguard-dkms version 
1.0.20201112) as well as compiling the kernel module from the latest 
source from the wireguard-linux-compat repo, with the same result.

Since the call trace mentions kernel_fpu_begin, I looked at the code and 
the issue seems to occur while using SIMD for packet decryption.

When I forcibly disable SIMD with this simple bypass:
  static inline void simd_get(simd_context_t *ctx)
  {
-    *ctx = !IS_ENABLED(CONFIG_PREEMPT_RT_BASE) && may_use_simd() ? 
HAVE_FULL_SIMD : HAVE_NO_SIMD;
+    *ctx = HAVE_NO_SIMD;
  }
indeed everything works fine again (ignoring the performance hit).

I was unable to further pinpoint the issue, unfortunately.
Any idea what might be the cause?

Best regards,
Erik Schuitema

=== kernel log ===

000: BUG: scheduling while atomic: kworker/0:1/15/0x00000002
000: Modules linked in: wireguard(E) ip6_udp_tunnel udp_tunnel 
intel_rapl_msr 8250_dw nls_iso8859_1 intel_rapl_common 
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass 
intel_cstate intel_rapl_perf joydev input_leds wmi_bmof 
intel_wmi_thunderbolt serio_raw snd_hda_codec_hdmi mei_me mei 
snd_hda_intel snd_intel_nhlt snd_hda_codec snd_hda_core snd_hwdep 
intel_lpss_pci snd_pcm intel_lpss snd_timer idma64 intel_pch_thermal 
virt_dma snd soundcore mac_hid acpi_pad ip6t_REJECT nf_reject_ipv6 
nf_log_ipv6 sch_fq_codel xt_hl ip6t_rt ipt_REJECT nf_reject_ipv4 
nf_log_ipv4 nf_log_common xt_LOG xt_limit xt_tcpudp xt_addrtype 
xt_conntrack ib_iser ip6table_filter rdma_cm ip6_tables iw_cm ib_cm 
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat ib_core 
nf_conntrack_ftp iscsi_tcp libiscsi_tcp nf_conntrack libiscsi 
nf_defrag_ipv6 scsi_transport_iscsi nf_defrag_ipv4 iptable_filter 
ip_tables x_tables autofs4 btrfs zstd_compress algif_skcipher af_alg 
dm_crypt raid10
000:  raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear hid_logitech_hidpp 
hid_logitech_dj hid_generic usbhid hid amdgpu i915 gpu_sched ttm 
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel drm_kms_helper 
syscopyarea nvme sysfillrect sysimgblt fb_sys_fops aesni_intel igb 
e1000e crypto_simd dca cryptd glue_helper ptp psmouse pps_core nvme_core 
i2c_algo_bit drm wmi video pinctrl_sunrisepoint
000: Preemption disabled at:
000: [<ffffffff87442203>] kernel_fpu_begin+0x13/0xd0
000: CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G            E     
5.4.47-rt28 #1
000: Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS 
HNKBLi70.86A.0064.2020.1028.1438 10/28/2020
000: Workqueue: wg-crypt-wg0 wg_packet_decrypt_worker [wireguard]
000: Call Trace:
000:  dump_stack+0x6f/0x95
000:  ? kernel_fpu_begin+0x13/0xd0
000:  __schedule_bug+0x78/0xc0
000:  __schedule+0x5f3/0x8b0
000:  ? task_blocks_on_rt_mutex+0x17c/0x350
000:  schedule+0x3d/0xe0
000:  rt_spin_lock_slowlock_locked+0x103/0x2e0
000:  rt_spin_lock_slowlock+0x57/0x90
000:  rt_spin_lock+0x44/0x50
000:  ? wg_packet_decrypt_worker+0xea/0x1c0 [wireguard]
000:  wg_packet_decrypt_worker+0xff/0x1c0 [wireguard]
000:  process_one_work+0x1ee/0x4d0
000:  worker_thread+0x34/0x3f0
000:  kthread+0x121/0x140
000:  ? process_one_work+0x4d0/0x4d0
000:  ? kthread_park+0x90/0x90
000:  ret_from_fork+0x35/0x40
000: ------------[ cut here ]------------

