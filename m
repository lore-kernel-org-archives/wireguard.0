Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F37C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 19:34:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba1bf7ee;
	Tue, 20 May 2025 19:34:17 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 410d9859
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2024 09:33:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-382442b7d9aso616545f8f.1
 for <wireguard@lists.zx2c4.com>; Tue, 19 Nov 2024 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=swimm.io; s=google; t=1732008819; x=1732613619; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=93sfeRDo7pM+WVWjvcrEwpDPB3P0V8FhE4yZYOUploc=;
 b=EbfKIaVkOMECk8ZZLJTlGMSGLaqk0re39elpMWsFSmCo+V4UTauiqonwqhxDPh21T/
 i/hwzVTd0CE/PNwUwlyPYS911U5qJCa6KnjzcF6PCCHOuBOIj7WK/87fkmTp0k1ZPkCH
 LUQIl9OXwFJX23nbvKC4sO8XpiNLhBI4sSOd2BvZB+zs69DlRuHqrXExOgJbFW2qQASD
 OOgUoAMmrYHYaUALmppDXCEwhP5nOTnBaICHtVIczu8Nw9v25I/2rrNLRQKyhDyDzjb5
 xbV0KYdRtsiMVpizAZV4ctYllVOb2LkREEifWcH1T0l7DPa9WBe8W7A00BObR+eP95H+
 LDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732008819; x=1732613619;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93sfeRDo7pM+WVWjvcrEwpDPB3P0V8FhE4yZYOUploc=;
 b=nCE2IbmorZrR9gxZ9aJe2eca5MkOiAOdNFvR9QGVusBrnd1t+8jyCaYii1bxW3jwMj
 pvTXYM3lpxmSbjic5SbMMAXfhy9Iy7NqOtn0TyF6SO9Y1t8i16SR0kXSHnxPcy6WzM2U
 lDTgT/4iFdCbhOpDViKUHWdFE2DMsCLBfU/63Ny5twB72zcA6K7drbU+eku7v3vHhZAO
 va5yMKyMdhId1vjlkzgbqBgbTHAYWKaR/J4J6iXIhCr8Tzu8xzus/q10rWKeFV41MCf0
 xUngCf0aTgD/1rO1rHzvjAiNrNwoYXr05pyrfm6Axb0cimqKJFJCkbiNF7giJHOHbYMh
 0YwQ==
X-Gm-Message-State: AOJu0YyzPc7Hjses7dNxDHRlAQcvOZiyuDQfdr8gyDo8JTc1ZCDzjtQ9
 IPaS3rZwUjYxZY9fxeHRZzyKaBy0tlR3Ml4rZKRX6iNWIPLp7ba6kATZ8up8quwxZhJPA98eW5b
 2h3/W7ohxjsPO6HjPVh5Y50MnU06sRaiILCqc1EJVwceez6dUL7U=
X-Google-Smtp-Source: AGHT+IFeOACw7XPd6A2+FY4BffojsiX1QDNC47SiT6BwFjzGj2raCeA+C821629KDqa/Qytzn2vXzF7VhJgeMfAGDEQ=
X-Received: by 2002:a05:6000:178a:b0:382:4b6f:24ea with SMTP id
 ffacd0b85a97d-3824b6f28bamr3307161f8f.11.1732008819024; Tue, 19 Nov 2024
 01:33:39 -0800 (PST)
MIME-Version: 1.0
From: Segev Finer <segev@swimm.io>
Date: Tue, 19 Nov 2024 11:32:56 +0200
Message-ID: <CAEFWZ+NONS2A7o06DJB_Nt+CGO5ZTk0OHTkhP44sAAGDk+hbwQ@mail.gmail.com>
Subject: Add support for setting proxy settings
 (NETunnelNetworkSettings.proxySettings) in wireguard-apple
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Nov 2024 18:00:54 +0000
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
allows to set. You can currently still use wireguard-tools/wg-quick
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
