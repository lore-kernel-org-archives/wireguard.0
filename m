Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FECC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF10206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3k2VYpY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF10206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dea8db15;
	Sun, 25 Aug 2019 15:32:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0398078a
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jul 2019 05:09:29 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26932da5
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jul 2019 05:09:28 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id q20so38839573otl.0
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jul 2019 22:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xWTjyFYquhL08aA1J0jhjHL9D1rC4cxrMt7g7ZVF+AU=;
 b=k3k2VYpYAoW0evN+83cOBjmB37sEHe9KBLMlQ6/3wE7CQH+zGMqcgnM8epMh16fVWB
 iG7bwfKqrD1bTRqV6DvQVXSHDx1CmyqIt3kDeIl7cv4jW3XY+1TlbjHgY2kIus3qc4S/
 ZUZq6IZpjb+FH1dUY+54QphgnJzurpYjpEPq52q7GhbKVu6jZh+P/oQ8YBOtSABeiFH0
 8BDCx5MebPXIEZvXj45SJOu3D+bJ0Liq6JsXCbdLl1DaxKBcWOhYu9BddNlvSb06m6Jp
 +4YEzsphZVtk50Cq/hiKAvAaepc+sprtZ/Aq7M7VXF/Ln488qu+VsSh3Ly32zUWTNWBq
 Q8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xWTjyFYquhL08aA1J0jhjHL9D1rC4cxrMt7g7ZVF+AU=;
 b=XE8scUbqoMNEBFY4xHJhpovAyeUTKW8skCGttNDhwKAlmsUO9VG3MoKhA1rbNzyWUS
 BvOCAcySgCstoDPP6UQRs07rv8dXDDfUmd4UdGsqXD5of06e9XSgjq0r5qANIa9xzSL1
 9Ghsyg00vhHCLVfRWPjLMx3wiyAlLn6A/9timrxUeUZ+eDvp4aOHmNEGVxHO+RCkrWLY
 +h6OPoDCxT7JrUASGBrO33gzo+sIsIkHXfqzOm8du4xz1hHTr7dXJbuDGYydRRmkLpaS
 HMDldMvPvPgFyHdN4Iun6igOtS0jsDOTzbuxGmTjjHwYD3bOdJloaSO4qdzxxemCVlj+
 bONw==
X-Gm-Message-State: APjAAAUYGEMMl+KbF6KenDB9neDhmY0Bigz9E71SoQGdUiuESv92Ksw1
 mzQ/fkSUEmFKyu/VvwGZnfR5Fo6QkRFkoENgyNKoCOgjbIAYbw==
X-Google-Smtp-Source: APXvYqzhoFqkMqm01guPjADEiquB5GuSYIUno85O9uQ5SJbV9LC3e7B9obiuqcor8hZJVpA1eIR3XuQs4Ck+wxwQCes=
X-Received: by 2002:a9d:3e87:: with SMTP id b7mr8242726otc.157.1563772167871; 
 Sun, 21 Jul 2019 22:09:27 -0700 (PDT)
MIME-Version: 1.0
From: trulyliu <trulyliu@gmail.com>
Date: Mon, 22 Jul 2019 13:09:17 +0800
Message-ID: <CANNc_DSMxv5NhrNnKkVp+yYGEmDm48Db=8VsB_S0N4RVai1jUQ@mail.gmail.com>
Subject: Ryzen 3000 CPU soft lockup
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:32:28 +0200
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
Content-Type: multipart/mixed; boundary="===============1380186094860438136=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1380186094860438136==
Content-Type: multipart/alternative; boundary="000000000000936108058e3e1462"

--000000000000936108058e3e1462
Content-Type: text/plain; charset="UTF-8"

I just upgrade my cpu to Ryzen 3700x, my mainboard is Asus B450-I.  I have
updated the latest bios.
After upgarde, wireguard constantly cause CPU soft lockup.

[   79.397005] wireguard: WireGuard 0.0.20190601 loaded. See
www.wireguard.com for information.
[   79.397005] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
Jason@zx2c4.com>. All Rights Reserved.
[  224.295881] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[kworker/u64:4:304]
[  224.295884] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel
rfcomm pci_stub vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE)
xt_nat xt_tcpudp veth ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_n
etlink nfnetlink xfrm_user xfrm_algo iptable_nat nf_conntrack_ipv4
nf_defrag_ipv4 nf_nat_ipv4 xt_addrtype iptable_filter xt_conntrack nf_nat
nf_conntrack libcrc32c br_netfilter bridge stp llc aufs overlay cmac bnep
snd
_hda_codec_hdmi binfmt_misc nls_iso8859_1 edac_mce_amd
snd_hda_codec_realtek snd_hda_codec_generic kvm snd_hda_intel arc4
snd_hda_codec irqbypass snd_hda_core crct10dif_pclmul snd_hwdep
crc32_pclmul snd_pcm ghash_clmul
ni_intel snd_seq_midi r8822be(C) snd_seq_midi_event pcbc snd_rawmidi btusb
snd_seq btrtl aesni_intel mac80211 btbcm btintel snd_seq_device snd_timer
bluetooth
[  224.295921]  aes_x86_64 eeepc_wmi asus_wmi crypto_simd sparse_keymap snd
glue_helper video wmi_bmof joydev input_leds ecdh_generic cryptd cfg80211
soundcore shpchp wmi mac_hid nvidia_uvm(OE) sch_fq_codel msr parport
_pc ppdev lp sunrpc parport ip_tables x_tables autofs4 btrfs xor
zstd_compress raid6_pq hid_generic usbhid hid nvidia_drm(POE)
nvidia_modeset(POE) nvidia(POE) drm_kms_helper syscopyarea sysfillrect
sysimgblt fb_sys_fop
s drm igb ipmi_devintf ipmi_msghandler nvme dca i2c_algo_bit i2c_piix4 ahci
ptp nvme_core pps_core libahci gpio_amdpt gpio_generic
[  224.295952] CPU: 2 PID: 304 Comm: kworker/u64:4 Tainted: P         C OE
   4.15.0-54-generic #58-Ubuntu
[  224.295953] Hardware name: System manufacturer System Product Name/ROG
STRIX B450-I GAMING, BIOS 2501 07/12/2019
[  224.295961] Workqueue: wg-kex-wg0 wg_packet_handshake_send_worker
[wireguard]
[  224.295965] RIP: 0010:get_random_u32+0x24/0xe0
[  224.295967] RSP: 0018:ffffa20888307ca8 EFLAGS: 00000203 ORIG_RAX:
ffffffffffffff11
[  224.295968] RAX: 00000000ffffffff RBX: ffff921d74985ac8 RCX:
0000000000000000
[  224.295969] RDX: 000000000000000a RSI: 00000000fffffe01 RDI:
ffffffffc2386d02
[  224.295970] RBP: ffffa20888307cc0 R08: ffffffffc23a8ca0 R09:
ffffa20888307c58
[  224.295971] R10: 0000000000000000 R11: 02d4998003202790 R12:
ffff921cb5720000
[  224.295972] R13: ffff921cb5730000 R14: ffff921d74985ad0 R15:
ffffa20888307e0c
[  224.295973] FS:  0000000000000000(0000) GS:ffff921e3e280000(0000)
knlGS:0000000000000000
[  224.295974] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  224.295975] CR2: 00007ffbffff3308 CR3: 000000074f19c000 CR4:
0000000000340ee0
[  224.295976] Call Trace:
[  224.295982]  ? wg_index_hashtable_insert+0x71/0x110 [wireguard]
[  224.295985]  wg_index_hashtable_insert+0x62/0x110 [wireguard]
[  224.295988]  wg_noise_handshake_create_initiation+0x2d2/0x2f0
[wireguard]
[  224.295992]  wg_packet_send_handshake_initiation+0x8c/0x130 [wireguard]
[  224.295995]  wg_packet_handshake_send_worker+0x19/0x30 [wireguard]
[  224.295998]  process_one_work+0x1de/0x410
[  224.295999]  worker_thread+0x32/0x410
[  224.296001]  kthread+0x121/0x140
[  224.296003]  ? process_one_work+0x410/0x410
[  224.296005]  ? kthread_create_worker_on_cpu+0x70/0x70
[  224.296008]  ret_from_fork+0x22/0x40
[  224.296009] Code: 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 89 e5 41 54
53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 0f c7 f0
<72> 46 83 ea 01 75 f6 48 8b 75 08 48 c7 c2 b0 52 30 ba 48 c7 c7

Kernel version: Linux 5.0.0-20-generic
I also tried WireGuard 0.0.20190702, the same CPU lockup.
I know this maybe the bug of CPU or kernel itself.
But this lockup only occurs in wireguard,  If stop wireguard, the CPU soft
lockup disappear.

Could anyone look into this issue?




-- 
trulyliu@gmail.com

--000000000000936108058e3e1462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just upgrade my cpu to Ryzen 3700x, my mainboard is Asus=
 B450-I.=C2=A0 I have updated the latest bios.<div>After upgarde, wireguard=
 constantly cause CPU soft lockup.<br></div><div><br></div><div><span style=
=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">[ =C2=A0=C2=A07=
9.397005] wireguard: WireGuard 0.0.20190601 loaded. See <a href=3D"http://w=
ww.wireguard.com">www.wireguard.com</a> for information.
</span><br>[ =C2=A0=C2=A079.397005] wireguard: Copyright (C) 2015-2019 Jaso=
n A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&g=
t;. All Rights Reserved.
<br>[ =C2=A0224.295881] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [=
kworker/u64:4:304]
<br>[ =C2=A0224.295884] Modules linked in: wireguard(OE) ip6_udp_tunnel udp=
_tunnel rfcomm pci_stub vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(O=
E) xt_nat xt_tcpudp veth ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack=
_n<br>etlink nfnetlink xfrm_user xfrm_algo iptable_nat nf_conntrack_ipv4 nf=
_defrag_ipv4 nf_nat_ipv4 xt_addrtype iptable_filter xt_conntrack nf_nat nf_=
conntrack libcrc32c br_netfilter bridge stp llc aufs overlay cmac bnep snd<=
br>_hda_codec_hdmi binfmt_misc nls_iso8859_1 edac_mce_amd snd_hda_codec_rea=
ltek snd_hda_codec_generic kvm snd_hda_intel arc4 snd_hda_codec irqbypass s=
nd_hda_core crct10dif_pclmul snd_hwdep crc32_pclmul snd_pcm ghash_clmul<br>=
ni_intel snd_seq_midi r8822be(C) snd_seq_midi_event pcbc snd_rawmidi btusb =
snd_seq btrtl aesni_intel mac80211 btbcm btintel snd_seq_device snd_timer b=
luetooth
<br>[ =C2=A0224.295921] =C2=A0aes_x86_64 eeepc_wmi asus_wmi crypto_simd spa=
rse_keymap snd glue_helper video wmi_bmof joydev input_leds ecdh_generic cr=
yptd cfg80211 soundcore shpchp wmi mac_hid nvidia_uvm(OE) sch_fq_codel msr =
parport<br>_pc ppdev lp sunrpc parport ip_tables x_tables autofs4 btrfs xor=
 zstd_compress raid6_pq hid_generic usbhid hid nvidia_drm(POE) nvidia_modes=
et(POE) nvidia(POE) drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys=
_fop<br>s drm igb ipmi_devintf ipmi_msghandler nvme dca i2c_algo_bit i2c_pi=
ix4 ahci ptp nvme_core pps_core libahci gpio_amdpt gpio_generic
<br>[ =C2=A0224.295952] CPU: 2 PID: 304 Comm: kworker/u64:4 Tainted: P =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0C OE =C2=A0=C2=A0=C2=A04.15.0-=
54-generic #58-Ubuntu
<br>[ =C2=A0224.295953] Hardware name: System manufacturer System Product N=
ame/ROG STRIX B450-I GAMING, BIOS 2501 07/12/2019
<br>[ =C2=A0224.295961] Workqueue: wg-kex-wg0 wg_packet_handshake_send_work=
er [wireguard]
<br>[ =C2=A0224.295965] RIP: 0010:get_random_u32+0x24/0xe0
<br>[ =C2=A0224.295967] RSP: 0018:ffffa20888307ca8 EFLAGS: 00000203 ORIG_RA=
X: ffffffffffffff11
<br>[ =C2=A0224.295968] RAX: 00000000ffffffff RBX: ffff921d74985ac8 RCX: 00=
00000000000000
<br>[ =C2=A0224.295969] RDX: 000000000000000a RSI: 00000000fffffe01 RDI: ff=
ffffffc2386d02
<br>[ =C2=A0224.295970] RBP: ffffa20888307cc0 R08: ffffffffc23a8ca0 R09: ff=
ffa20888307c58
<br>[ =C2=A0224.295971] R10: 0000000000000000 R11: 02d4998003202790 R12: ff=
ff921cb5720000
<br>[ =C2=A0224.295972] R13: ffff921cb5730000 R14: ffff921d74985ad0 R15: ff=
ffa20888307e0c
<br>[ =C2=A0224.295973] FS: =C2=A00000000000000000(0000) GS:ffff921e3e28000=
0(0000) knlGS:0000000000000000
<br>[ =C2=A0224.295974] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
<br>[ =C2=A0224.295975] CR2: 00007ffbffff3308 CR3: 000000074f19c000 CR4: 00=
00000000340ee0
<br>[ =C2=A0224.295976] Call Trace:
<br>[ =C2=A0224.295982] =C2=A0? wg_index_hashtable_insert+0x71/0x110 [wireg=
uard]
<br>[ =C2=A0224.295985] =C2=A0wg_index_hashtable_insert+0x62/0x110 [wiregua=
rd]
<br>[ =C2=A0224.295988] =C2=A0wg_noise_handshake_create_initiation+0x2d2/0x=
2f0 [wireguard]
<br>[ =C2=A0224.295992] =C2=A0wg_packet_send_handshake_initiation+0x8c/0x13=
0 [wireguard]
<br>[ =C2=A0224.295995] =C2=A0wg_packet_handshake_send_worker+0x19/0x30 [wi=
reguard]
<br>[ =C2=A0224.295998] =C2=A0process_one_work+0x1de/0x410
<br>[ =C2=A0224.295999] =C2=A0worker_thread+0x32/0x410
<br>[ =C2=A0224.296001] =C2=A0kthread+0x121/0x140
<br>[ =C2=A0224.296003] =C2=A0? process_one_work+0x410/0x410
<br>[ =C2=A0224.296005] =C2=A0? kthread_create_worker_on_cpu+0x70/0x70
<br>[ =C2=A0224.296008] =C2=A0ret_from_fork+0x22/0x40
<br>[ =C2=A0224.296009] Code: 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 89 =
e5 41 54 53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 =
0f c7 f0 &lt;72&gt; 46 83 ea 01 75 f6 48 8b 75 08 48 c7 c2 b0 52 30 ba 48 c=
7 c7 <br>
<br></span><div>Kernel version:=C2=A0<span style=3D"color:rgb(0,0,0);font-f=
amily:monospace">Linux 5.0.0-20-generic</span></div><div>I also tried=C2=A0=
<span style=3D"color:rgb(0,0,0);font-family:monospace">WireGuard 0.0.201907=
02, the same CPU lockup.</span><br></div><div><span style=3D"color:rgb(0,0,=
0);font-family:monospace">I know this maybe the bug of CPU or kernel itself=
.</span></div><div><span style=3D"color:rgb(0,0,0);font-family:monospace">B=
ut this lockup only occurs in wireguard,=C2=A0 If stop wireguard, the CPU s=
oft lockup disappear.</span></div><div><br></div><div>Could anyone look int=
o this issue?</div><div><br></div><div><br></div><div><span style=3D"color:=
rgb(0,0,0);font-family:monospace"><br></span></div><div><span style=3D"colo=
r:rgb(0,0,0);font-family:monospace"><br></span></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><a href=3D"m=
ailto:trulyliu@gmail.com" target=3D"_blank">trulyliu@gmail.com</a><br></div=
></div></div>

--000000000000936108058e3e1462--

--===============1380186094860438136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1380186094860438136==--
