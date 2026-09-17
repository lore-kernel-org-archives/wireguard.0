Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC98C982D0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Sep 2026 07:59:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a3cf999d;
	Thu, 17 Sep 2026 07:59:53 +0000 (UTC)
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [2a00:1450:4864:31::11])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fb3f7495
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Sep 2026 07:59:51 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso4731215e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 17 Sep 2026 00:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789631991; cv=none;
 d=google.com; s=arc-20260327;
 b=dU3gb1Er2uOLyapJo+4BcUVUFbu277q/N0Caxq3/AOHGgemcxr93SJeQPttKVNanoS
 cEaRt7+EzAnXy+W1yGyfdd1rq9I0dy8xZq0XoM6QSAAbMAYqo1MVgbY+lAcU0UrPxEBi
 aEJG6nS9BFLIZ8J2lx4PHOtFdw28QbbuvLX+HvwslD3lVyz3iy/YDk0w3Ho9eYFmz/FB
 Qcv9vcDfA//qM3AvqOAmOQcFpa/JMsMkT4oL5DQyjXZMNgJXA4VmGoDQ0cnPWsx0USyd
 RNwS3khtVxLaBGtHcfXpOyAI6e0dRNlPDiNaqRmNKV0ao5Jlk58fE2p9TZtGNYEFx2Xs
 O+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=eJNuqpfi+CfKTGmA0E5LYoJvZ3lW5iv4OoNxduvLxKc=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=ZfgvsMjk26r79tmUtBYpcLQ99LLx16eFi03EJtbOnQpAHEg+WzVhRhs4pchcLtOhbc
 jkcBKF36+KuvjrzUFGlbezbOIhwyMdmvCjf4Gru3gzdNGf8dkJGzNCJK6NPKqoFZ9Hoq
 HZ/dBmZQS5ui5Yg77QzrxTKGJ/rhreqXtqNGmUL4ckQc+b5u3utKfyeU0CN6jdQJmIzp
 6onoI3nSUPdVJSBpPpBJfqUaehoV+xXUUxrBFC+QFqe+Xh32xodnbaFPqQD2D1b0/vCA
 UqZMyMWs+8CNIhV0EvroWuXkRcbs93Zc9wXTTOkRX9JnX/rxAOLYR9hUJuFio7gTwLAs
 iprw==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=swimm.io; s=google; t=1789631991; x=1790236791; darn=lists.zx2c4.com;
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=eJNuqpfi+CfKTGmA0E5LYoJvZ3lW5iv4OoNxduvLxKc=;
 b=kQL9xgzkfzSI7z/4Ndcz9hgNEhgRb8TZNmIfO3QWphXzrYJdA2k6FnPQ35gOKgj0zN
 Th0g7PKpc3omgg58JoZJoHiQ9pXnd570WBSfg8lvpCfE4m76RlIoJ2LsJFprj814Z3jR
 d5lI+Jx/IzcgJzYBEnJfFesj22elfF415YWqWGhndTBOiSw/WhLpHPMtNS6jNNcBgurt
 NdU9cOJTeECmvvuOewnwrM2wGRY+CjQ1rjGan5fvnYPOFCRDrI4ksIzJhYDSqeO74Sx5
 gt03XkAnZPlJAuAZsPdxW1ryZaRrofo/hiDh7hLSUKrF8ALMA0I/JRtzKIB0BVwculjL
 VkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789631991; x=1790236791;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eJNuqpfi+CfKTGmA0E5LYoJvZ3lW5iv4OoNxduvLxKc=;
 b=mDOX4Prc7euDhfB1Z8hGSoAfbQk1nmTfIdUUJktonMFmGg2Ps4apm15WaHoy1NTIYH
 wN8IOYv7PEARYygn6sOymZTT1A9VOqdlrgnITU2letKFFyX75j69tI9EksNHJufKT7sj
 HecbqeXZYV8lIgcr+20whwB3GH2zrcpeK5pGXmiGr5qqPg3jwVARTNZ5HFPQM+CsFcxQ
 QctlA6rTWW29i+ybJkJat3uK9+j3rGpyOooszqUNSZTc1onVxPLzaPKUJuEcWrj/fx3n
 GdzA1mkNjyDOUFnzm3AgBHVAWNIJFD22MLvR5hH6izHlPF1PsFbwzZ7x4b63QjtuR6pR
 TTlg==
X-Gm-Message-State: AFuF++lSmFPhk2ly+wAtPSvTv0isgOrn8AJbmORMtOD/w5Oaux6/zA9S
 Ccm2ADpkBjasWAbDKJ85qXPwmFT58IO1s2TOe5I0S5cOLZJgAMB1JOe9MQ/FowpEIWmZK8yNz8u
 Nd+5ZX89rI76DdTns+sDpYwHkqvwT83NNexx3x5nkbYuuHZauc2L3Ln5IMQ==
X-Gm-Gg: AYBFou3TlbTUlu05LrfcHd+D1kobJdlY3Me0gy6idVUlFZvbhR7SAjPu5UtobHIO/47
 /hTinVUXQrR8IFclrYJ1VzSw/5CLElaL8gD4MfGhCvyyx+AaWf/qIPpjIIoX3UYvPor59/EvDRe
 UjSrlQjmgoJ32d4/Gen7oDlOYzf7vFXsCPiQJjrFR9AJo6Cu8Okn6Nnfu1cwcgMEQ0BTaAzbYyy
 xNB3Z5ytmYoTM+nx/EpVWq9JGkazV2u5C55H45v3C5cZyVBqP7XOZCpWMFECXpblxWexHetk+WW
 8mxTT88ZWOS8wddPUKwg2NVG2XqROufcokohVTlybyZ6UL1JDrdKrEg7ixINjsMhmtdn3ItNKQ3
 sv/3RrZZdK12ANCjtf9r8mw==
X-Received: by 2002:a05:600c:314a:b0:49e:799e:c1c3 with SMTP id
 5b1f17b1804b1-49eb73263c6mr66754325e9.17.1789631990940; Thu, 17 Sep 2026
 00:59:50 -0700 (PDT)
MIME-Version: 1.0
From: Segev Finer <segev@swimm.io>
Date: Thu, 17 Sep 2026 10:59:39 +0300
X-Gm-Features: AcwNN1XtlWAnlbpYAtIL9px6dQaO9bHhbxG8pVAT72TdvyPns7Do7eBep39PUh4
Message-ID: <CAEFWZ+MH3vtg5i1Tb0Poac_xc0ufFUQMcxcKx6kzKd0347trJA@mail.gmail.com>
Subject: Add support for setting proxy settings
 (NETunnelNetworkSettings.proxySettings) in wireguard-apple
To: wireguard@lists.zx2c4.com
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

When using NEPacketTunnelProvider, you can also specify proxy
settings, those are used by programs that query for the system proxy
settings while connected to the WireGuard VPN, for example,
Chromium/Chrome uses that (scutil --proxy shows the settings AFAIK),
there is currently no way to set those settings in wireguard-apple,
and the GUI for setting them, as available in builtin VPN providers in
macOS is not available for the WireGuard VPN interface in the macOS
GUI, so you are stuck with the default proxy settings, where some
networks do require proxy settings, be it enabling auto-discovery, PAC
URL, HTTP proxy URL, etc. like the default proxy settings GUI in macOS
allows you to set. You can currently still use wireguard-tools/wg-quick
which still uses, what I think is an undocumented interface?, to
create a tun device, which doesn't affect those settings, but that's
not as convenient or nice as using wireguard-apple.

Another thing that I noticed is that wireguard-apple seems to always
use the default internet gateway, ignoring routing rules that say
otherwise which prevent using it nested, or with other custom network
interfaces, it would be nice to be able to control the outgoing
interface in wireguard-apple. wireguard-tools/wg-quick adds a route
that uses the default gateway which you can simply remove or modify
manually if needed (Though a setting would be nicer of course), but
wireguard-apple seems to somehow go through the default interface and
ignores the routing rules.

I would have tried to contribute but Apple requires a paid developer
account to develop network extensions.
