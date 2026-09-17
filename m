Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4141ACA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 072aa0ff;
	Mon, 5 Oct 2026 07:00:47 +0000 (UTC)
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [2a00:1450:4864:30::10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5c25a98a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Sep 2026 12:17:19 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-48449f62b93so267261f8f.0
 for <wireguard@lists.zx2c4.com>; Thu, 17 Sep 2026 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789647439; x=1790252239; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kaHqI6qYkHR4lIRxpmNU3+KvwZSyPgQ7+NmYJ0QJKc8=;
 b=oMKsgvU+LoA8gkWH4L6Efo34WV9+bjkN0l5K8tZWw/O0giFJLNgw/9GHxk9QmEatKX
 665KXtkKoL+DCtqrvj6qJqU5ZYQ3vcvuzV0ALeTKRUShod8R4D3l2ntOGqCnpirrrTeW
 j760Cu/ejALG3VFRmiHch+kD6pzLniRqPW76Io1lXB18/FjnzH2OyXT9GmpQsx/ts8XZ
 nLVOo4+cK1uaI+oUljvRwgCMv8sskXylKj7htP9QKUa/tlbRlKRfGd3T30wBG2X7/cB0
 bMhiF//tzEpGkdKKNoJckREk3lHWEeVNQK4ZDXzMcVPcXJm5mWGW2KLMpJnzeBkEgKxt
 NEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789647439; x=1790252239;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kaHqI6qYkHR4lIRxpmNU3+KvwZSyPgQ7+NmYJ0QJKc8=;
 b=1JRbvYP2HCjpwplmoQM9GjglEHAB+wbZ4CQ24f1kaquJfj3Z/hspuVJImeWffgFH8K
 A9GVOwjEYLkv0pjkymq7xqs6v4VHvrXAhJdJU2ZRBATmrbskf5J0iz3H8tlDDz1jTKyG
 4x1EtyOvYp/CK3vITr6nbwllkRyKWDjELf7PvMzKIGSsa7sLvkwtU5e9yMt3GpHayndE
 wIZa+Edu0Kdx/cZ/dJfef9CHYm5RAfajOtS4nXONamdtJokjdxpeHP8Qpu95+I23pTRu
 QRX54Ggq8P8ClOTo0rxNd5SlhopJxXY/Uu67asViEZfyYVUlbGi5osPQnKHRVAqLgNAR
 Ywyw==
X-Gm-Message-State: AFuF++n4A8SKqXk98cyJwCftVWn2oELkFsAmjkcX99LbnYn1VhDjo+g/
 iueQ5y4E0ACrah1vsBHcN1FAsX5z3T07mbT3d9rwyKABRF8DiDfqiupKkgdT5Q==
X-Gm-Gg: AYBFou3lrgPnfViXkmCix0yn1xNN3mbxgkZ9Y5YlLel4DXPnNWwadNGnO+9p3sNh00W
 86aiBCCXC0g4r4XATsWFI+hhUVnFqGwqO9Wn1k4yZi010Hyk6hiCBH946bmyLXWVfLnGZSa/fDd
 ljj2nqHnzQv9dqni/D9va4mynIvU4SjgF9UoLWA5aGNWLmdDmqtdqawyPyT9Y7bqfhqc3dfpklY
 0I04xsfaXy1PY1I+QEYb+OkxF67cVWl1aiS91ufwNxj/ZBUwetzi6Jnk4w3LPhzvBuWoJMpFpE0
 aiSB+mnAJ4w9R3dHSTixHaPa9bqPKbh4/IZZTiNMTwFNBO3x9ImdVlRgezFKTVZ8RYuZDWi9y8W
 jm5agWsBLQp3FG90MlCnmLy5Q94+IPcJq2BEMEoy5otGJq/mAN5E7Bemsm3e33/IimR7oD3PcCu
 vt3ip1BFDK6Zuo41OjvY32xITiShZ+i4v1ItgiUVk86pyNGLIjqgixd+O152eDcvyfWo8goVsPl
 kHsfc9/Tx8miIe47yE03+asZFVHyA==
X-Received: by 2002:a05:6000:2502:b0:487:a87:24c9 with SMTP id
 ffacd0b85a97d-48713ae6895mr5432148f8f.3.1789647438990; 
 Thu, 17 Sep 2026 05:17:18 -0700 (PDT)
Received: from smtpclient.apple ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf26c8dsm15085590f8f.14.2026.09.17.05.17.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2026 05:17:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: Add support for setting proxy settings
 (NETunnelNetworkSettings.proxySettings) in wireguard-apple
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
In-Reply-To: <CAEFWZ+MH3vtg5i1Tb0Poac_xc0ufFUQMcxcKx6kzKd0347trJA@mail.gmail.com>
Date: Thu, 17 Sep 2026 15:17:15 +0300
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: 7bit
Message-Id: <D31D1D56-5BD9-47E3-9084-C192624C2CD2@gmail.com>
References: <CAEFWZ+MH3vtg5i1Tb0Poac_xc0ufFUQMcxcKx6kzKd0347trJA@mail.gmail.com>
To: Segev Finer <segev@swimm.io>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

hi, i sent some patches some time ago .. why nobody bothers to even answer?

multumesc,
razvan

---
Razvan Cremenescu
razvan.cremenescu@gmail.com




> On 17 Sep 2026, at 10:59, Segev Finer <segev@swimm.io> wrote:
> 
> When using NEPacketTunnelProvider, you can also specify proxy
> settings, those are used by programs that query for the system proxy
> settings while connected to the WireGuard VPN, for example,
> Chromium/Chrome uses that (scutil --proxy shows the settings AFAIK),
> there is currently no way to set those settings in wireguard-apple,
> and the GUI for setting them, as available in builtin VPN providers in
> macOS is not available for the WireGuard VPN interface in the macOS
> GUI, so you are stuck with the default proxy settings, where some
> networks do require proxy settings, be it enabling auto-discovery, PAC
> URL, HTTP proxy URL, etc. like the default proxy settings GUI in macOS
> allows you to set. You can currently still use wireguard-tools/wg-quick
> which still uses, what I think is an undocumented interface?, to
> create a tun device, which doesn't affect those settings, but that's
> not as convenient or nice as using wireguard-apple.
> 
> Another thing that I noticed is that wireguard-apple seems to always
> use the default internet gateway, ignoring routing rules that say
> otherwise which prevent using it nested, or with other custom network
> interfaces, it would be nice to be able to control the outgoing
> interface in wireguard-apple. wireguard-tools/wg-quick adds a route
> that uses the default gateway which you can simply remove or modify
> manually if needed (Though a setting would be nicer of course), but
> wireguard-apple seems to somehow go through the default interface and
> ignores the routing rules.
> 
> I would have tried to contribute but Apple requires a paid developer
> account to develop network extensions.

