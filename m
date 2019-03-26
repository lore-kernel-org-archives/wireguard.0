Return-Path: <SRS0=43sN=R5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09EAC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Mar 2019 14:17:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB8A2075D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Mar 2019 14:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd7G5Eyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB8A2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8f3bb72;
	Tue, 26 Mar 2019 14:16:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b971b8
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 14:16:17 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ff3748c
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 14:16:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o1so14527597wrs.13
 for <wireguard@lists.zx2c4.com>; Tue, 26 Mar 2019 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=oTRvGItlLv3cYBGHzRCGfH4Bhcl1bjsMB+5eOLrfELE=;
 b=Cd7G5Eyfh975WKiquDRcrRRtXXWGbInXcLtdGxmjcIL5zPy82Saof+LlbGgXbxRBxv
 IwqdRp+1AykRTcxahL+e7sFYK1LZzSF3ILFEHYTIJpf77/3cwhRKcCPO4N/HWlaMY6LZ
 cUGbutIQ5yccdx5XipEUh747oJqWpISnho5ZHgGTVZp9nxNBEJvN8A+oUuB4p/Vh/e1n
 63QnVKvD6VODPgzgCK0lYFVP1Zphi0ms1/msQlpXMRexQWvt4r1UlxxcN5amYYdK7RUO
 6wE34g1yQr2tQdzEex92FBopTpQf16sPNvbQ4uTIEmlV8lAM4Ag1o51cdt72HyjFpDRo
 BUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=oTRvGItlLv3cYBGHzRCGfH4Bhcl1bjsMB+5eOLrfELE=;
 b=Jeve0jp6a9Sgvk9GlVf1+xyXA/sjOMKDBHiuVPXPLWNms1sD8grLFJ0xutUaY82iFN
 xffkWSAHKTdfsHk7afcSy0lS0WkKNQjrvczNugWzqOkcukkgMPPHCozr13XFdezpNmnJ
 XBVENOzZZj+S1QAJGK3IBvqwOGocaSJSI8WBWcm+pAec+CvbvzJab5ob8jH17RGUA+Vd
 /PirMEAIJlvCh15pUy6Ls7Vn2H+cRVq25rEXl3vDj1iLOVoWIYPp9U1z5V2u93E5bmJa
 F/MthdAyPoqFx9WqVzVuy69D58roBSh4lyrhR4BKlELRptDsyeEp36wdiTPgbPpV8dHj
 XXfQ==
X-Gm-Message-State: APjAAAWD31r5jZTwBEBYgm2Wc+xawCEu95N0c9FE7W6RLRTjypC4nLiq
 PBENkQSVQ8XX/iiovuy2hjg=
X-Google-Smtp-Source: APXvYqwHBzhHw9jUYvEeLny0t16W5GhnsuNe7gGzdlTu267Fm3UDdnIYqGyTrSe/Lw8cu59EruK3MQ==
X-Received: by 2002:adf:eb85:: with SMTP id t5mr19850819wrn.168.1553609839479; 
 Tue, 26 Mar 2019 07:17:19 -0700 (PDT)
Received: from ?IPv6:2003:c5:5f27:5400:2289:84ff:fe70:d494?
 (p200300C55F275400228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f27:5400:2289:84ff:fe70:d494])
 by smtp.googlemail.com with ESMTPSA id d14sm15535831wro.79.2019.03.26.07.17.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Mar 2019 07:17:18 -0700 (PDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Julian Orth <ju.orth@gmail.com>
Subject: Multiple VPN connections on Android
Message-ID: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
Date: Tue, 26 Mar 2019 15:17:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
Content-Language: en-US
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

Hello list,

I'm currently using WireGuard on Android for two purposes:

1. Routing all traffic via a commercial VPN provider to protect myself on
   open wireless networks.
2. Connecting to my home network.

Unfortunately WireGuard on Android does not allow me to do both of these
things at the same time. I assume this is because VpnService [1] only allows 1
VPN connection at a time.

Has any thought been put into emulating multiple tun devices in user space?

Julian

[1] https://developer.android.com/reference/android/net/VpnService.html
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
