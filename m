Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCDBC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 12:50:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3DAF20721
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 12:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhSScPUb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3DAF20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dbe9a35;
	Mon, 4 May 2020 12:37:47 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79d61702
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 12:37:44 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id j26so8745790ots.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JNrQB9bIfd9zlPROmS321vPnk/sStayet1erWJCjgho=;
 b=dhSScPUbo6HcwXW0zkHSbY7OzpLzE51ebxXeFPDtWd57xgRvCeEo9G0BT/mPS+G4uo
 dKYqQM5oAbg60kT0f/Rxw18wW8O6w1Skyn3FyMp7mG9r2dJNwwpMUjKY5GTHpnHzhfSH
 meekcB7+YMyNThPuHwcSbkUqvu6dKj/tAXBQLtLYzcvDj1lJC6Udc9D3dKEbRofUQo34
 11C00kEjJEhWzaFwHx8U49Zrp2qbffrAMENUNam1uzC3721vdL1PFtoRW5BeZ+aKBwSq
 S0D+ZVc4lo43koeTEVfLQTNLRwuOmmmiqHdH7qVtlNQUudXEOlXefLJz9/lZkcPek0Se
 U3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JNrQB9bIfd9zlPROmS321vPnk/sStayet1erWJCjgho=;
 b=X8zS03DXTMEqz9MH1KeI6QyZAaAvUkysCe+cf/Gt5n4jiz54wD8m2EU5WqW3ekiDI0
 rbY1iznx+kEvuDMjJ40dFvAkVKb0J2TgHx8WiTeiJrwLyar/MoD2nAeDLRoapv7iYLhr
 VuCr4IASf3TYX1F3Tcf68eiLKNRrEDO4doD/WRvUVuev1Y9Bmv+ruhWC1mxh5p2IknIg
 b+k/TRNBB+h/b9c9xMbisdoBzyuAk8w5jNZm5jdpdbBqtk39RPIj22x/pUBiKg6kgtj6
 D8mMlqYBi6LyfCqIhzegLz8CvvdgPtb/OMIJSTVNN6rGZ6yBQ3dO6h6zLwaPXVb0Rw/E
 HG1g==
X-Gm-Message-State: AGi0PuYuklvH+Zjp0jLjJxtPkaCIrZ30Vun0v00Wwa6Lma+4oznRzwk8
 TvyP48tsi4BtlApTTzKrbLYxGuRpAf8GpTX3ShblNLVTOHY=
X-Google-Smtp-Source: APiQypJ0G2fwjVO+w4vX604Ktyhbqo3Y+FrLfuu07woch0bUwCwTJl7+NAVJsOWTc8rF+c8em26PMPb0O1eSaIQUTTo=
X-Received: by 2002:a9d:2185:: with SMTP id s5mr14653793otb.170.1588596608579; 
 Mon, 04 May 2020 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
 <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
In-Reply-To: <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Mon, 4 May 2020 20:49:57 +0800
Message-ID: <CAF75rJAh8xA3-=nk+gTpvULMD-xC41ukEatW=JyowaZHfiOzQg@mail.gmail.com>
Subject: Re: soft lockup - may be related to wireguard (backported)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Jason A. Donenfeld <Jason@zx2c4.com> =E4=BA=8E2020=E5=B9=B45=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=881:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Are you routing wireguard over wireguard, or something interesting like t=
hat?
>
> Is ipsec being used?

I don't think I have any fancy use cases. But wireguard over pppoe?

Other details are
- nftable's iptables compatible mode is used, along with ipset
- pppoe link is default route, and wg-quick is configured to install
additional default route into new created routing table (2000)
- ipset matches are used to MARK traffic to specific destinations in
mangle table, PREROUTING & OUTPUT, for both v4 and v6
- ip rules are added to match the fwmark and lookup new routing table
(2000, so go out via wireguard interface) for forwarded traffic and
output traffic

Here is the list of loaded kmod.

# lsmod
Module                  Size  Used by
pppoe                  20480  2
pppox                  16384  1 pppoe
ppp_generic            49152  6 pppox,pppoe
slhc                   20480  1 ppp_generic
wireguard              94208  0
curve25519_x86_64      49152  1 wireguard
libcurve25519          49152  2 curve25519_x86_64,wireguard
libchacha20poly1305    16384  1 wireguard
chacha_x86_64          28672  1 libchacha20poly1305
poly1305_x86_64        28672  1 libchacha20poly1305
ip6_udp_tunnel         16384  1 wireguard
udp_tunnel             16384  1 wireguard
libblake2s             16384  1 wireguard
blake2s_x86_64         20480  1 libblake2s
libblake2s_generic     20480  1 blake2s_x86_64
libchacha              16384  1 chacha_x86_64
cfg80211              839680  0
rfkill                 28672  1 cfg80211
8021q                  40960  0
garp                   16384  1 8021q
stp                    16384  1 garp
mrp                    20480  1 8021q
llc                    16384  2 stp,garp
xt_mark                16384  4
xt_set                 16384  4
nft_chain_nat          16384  8
xt_MASQUERADE          20480  3
xt_TCPMSS              16384  5
xt_nat                 16384  2
nf_nat                 53248  3 xt_nat,nft_chain_nat,xt_MASQUERADE
nft_counter            16384  25
xt_tcpudp              20480  7
ipt_REJECT             16384  3
nf_reject_ipv4         16384  1 ipt_REJECT
xt_state               16384  0
xt_conntrack           16384  4
xt_multiport           20480  2
nft_compat             20480  34
nf_tables             176128  93 nft_compat,nft_counter,nft_chain_nat
ip_set_hash_ip         45056  2
ip_set_hash_net        53248  3
ip_set                 57344  3 ip_set_hash_ip,xt_set,ip_set_hash_net
nfnetlink              16384  4 nft_compat,nf_tables,ip_set
binfmt_misc            24576  1
intel_powerclamp       20480  0
nls_ascii              16384  1
coretemp               20480  0
snd_hda_codec_realtek   126976  1
nls_cp437              20480  1
vfat                   20480  1
snd_hda_codec_generic    94208  1 snd_hda_codec_realtek
fat                    86016  1 vfat
ledtrig_audio          16384  2 snd_hda_codec_generic,snd_hda_codec_realtek
snd_hda_codec_hdmi     73728  1
snd_hda_intel          53248  0
snd_intel_dspcfg       24576  1 snd_hda_intel
snd_hda_codec         163840  4
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realte=
k
evdev                  28672  3
gma500_gfx            221184  1
efi_pstore             16384  0
snd_hda_core          102400  5
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hd=
a_codec_realtek
snd_hwdep              16384  1 snd_hda_codec
snd_pcm               131072  4
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core
drm_kms_helper        233472  1 gma500_gfx
pcspkr                 16384  0
efivars                20480  1 efi_pstore
snd_timer              40960  1 snd_pcm
iTCO_wdt               16384  0
snd                   106496  8
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_co=
dec,snd_hda_codec_realtek,snd_timer,snd_pcm
sg                     36864  0
iTCO_vendor_support    16384  1 iTCO_wdt
soundcore              16384  1 snd
i2c_algo_bit           16384  1 gma500_gfx
watchdog               28672  1 iTCO_wdt
acpi_cpufreq           28672  1
button                 24576  0
tcp_bbr                20480  36
sch_cake               32768  3
nf_conntrack          172032  5
xt_conntrack,nf_nat,xt_state,xt_nat,xt_MASQUERADE
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         16384  1 nf_conntrack
loop                   40960  0
drm                   585728  3 drm_kms_helper,gma500_gfx
efivarfs               16384  1
ip_tables              32768  0
x_tables               53248  12
xt_conntrack,nft_compat,xt_multiport,xt_state,xt_tcpudp,xt_nat,xt_set,ipt_R=
EJECT,ip_tables,xt_MASQUERADE,xt_TCPMSS,xt_mark
autofs4                53248  2
ext4                  765952  1
crc16                  16384  1 ext4
mbcache                16384  1 ext4
jbd2                  135168  1 ext4
btrfs                1478656  0
xor                    24576  1 btrfs
zstd_decompress        90112  1 btrfs
zstd_compress         188416  1 btrfs
raid6_pq              122880  1 btrfs
crc32c_generic         16384  2
libcrc32c              16384  3 nf_conntrack,nf_nat,btrfs
sd_mod                 57344  3
ahci                   40960  2
libahci                45056  1 ahci
libata                290816  2 libahci,ahci
e1000e                290816  0
ehci_pci               20480  0
uhci_hcd               53248  0
scsi_mod              253952  3 sd_mod,libata,sg
ehci_hcd               98304  1 ehci_pci
i2c_i801               32768  0
usbcore               315392  3 ehci_pci,ehci_hcd,uhci_hcd
ptp                    20480  1 e1000e
lpc_ich                28672  0
mfd_core               20480  1 lpc_ich
pps_core               24576  1 ptp
usb_common             16384  3 usbcore,ehci_hcd,uhci_hcd
video                  53248  1 gma500_gfx
