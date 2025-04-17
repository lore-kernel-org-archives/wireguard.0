Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D71C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:29:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6764069a;
	Tue, 20 May 2025 19:55:25 +0000 (UTC)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90e54222
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Apr 2025 21:50:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e6e1cd3f1c5so1069555276.0
 for <wireguard@lists.zx2c4.com>; Thu, 17 Apr 2025 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744926643; x=1745531443; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5XQ7EIQOjKK/hm+507IricmA8aGEudj8pqoM62YIFX8=;
 b=MzHOpDlgIocvEASU/vQ/dKBFjdXQhCG1XL3aI+PDS5FMS/MCikJTDai+ia/7DW6Qvy
 o9jqN2A0rDiTuPD0NH1P+hPpOAgFA6LfhgCH/XVxjAkMrjY00xOAAA0cWfzSoZkwmCCh
 qoevmQwLqSlO3FDqZqhmFcsynUmbFpdgcNmqUNcTw5G5cQax1z2EOeKEXHBiTZw6Trwn
 sN/vGiSmvvH+PDr0fQgyoa+f4vgxA4/TfF8vF954uhxpE7PP6+M4vvnnTxqXvHBzqT3U
 Rb+mQC59Jm/y0ZQqFRk2qgp+MGH6JiLqOxfI87Rozpv0B1Zz51oPOE4XD3EX+a6hwH3v
 0Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744926643; x=1745531443;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XQ7EIQOjKK/hm+507IricmA8aGEudj8pqoM62YIFX8=;
 b=XHAXi8PjLLwlHlQHpofOMd9B4tZrsdDMlsDtSGkOM14vMWTDLOcKnhMURlC8zyfwdj
 esqGSu07ZRAANfr/lyR4cqIGyuwmzuTg33j04ZSkQpIGzZaaIAiTyLhye348MIPO1kgd
 3PVfOeb2PO4I9H+fTr2tqrOcBVlBhCxPYSzltTh9b6imWFaUnAutVRCOPZUbpzUgutkg
 EFiKWLoBMjnyowPC/E1wbjQZXqNAroKIHmZ9syvutEDfwWpI1RCwvFvxT066erZPN5n5
 Pr2KyZcHPtLeuecpNCZ/xh/iUf8Xw4enBzuH3qHx9ZNmVZENeu38Xif6Qf8SgBUDwRtA
 6NIg==
X-Gm-Message-State: AOJu0Yx2hUBcNz60THfVIvQe4l9anI4/2oX4kqlPAfIeVf8GXM3D6Jc8
 jj7oAmW0VJAUWFXD2KCDx71wJtUVFZcKLubjMPhEB1WT8XvSx2v80dHE5wa448nzmDqNJYy98b4
 oCracpZ2YROZmcnZ0xvAO/H2ThQ4E8LOFJ15KlQ==
X-Gm-Gg: ASbGncv2UGCPJwKx/GLZhMpOjNCxVgvgMDVM9daL1h2w/cypaaGwfMeKZ9ySqgxZ7Tc
 gkpJ2oMiz5+eoSlsfhgS9fwFs3JvoP4R7C8MkcDTofzG9gfl/dkiAQpK7Zhz4eAu6Pv/U4aj3BJ
 YyNbhTDnNFdiPU0Lg9/N0bRbFWP2nipenm79Bs
X-Google-Smtp-Source: AGHT+IGWzvgGtyyN6AAdjLO/uTMj1ZCKRjZ+9bq87MbGEQJS/yXiTFWCuiTKvG/l12EKkKPp8Nffmncsyu0Nf3LLlm4=
X-Received: by 2002:a05:6902:1028:b0:e6d:ef29:169f with SMTP id
 3f1490d57ef6-e7297eff074mr697059276.43.1744926642790; Thu, 17 Apr 2025
 14:50:42 -0700 (PDT)
MIME-Version: 1.0
From: Tristan <trigus42.dev@gmail.com>
Date: Thu, 17 Apr 2025 23:50:32 +0200
X-Gm-Features: ATxdqUFoyPpC4mXcFzLvfDHfhiCQCh9pPhiAfvjCph3plhxymRgcprGBzpHlMqo
Message-ID: <CAOhsA=t9SmdC23R-uU2gkjfNUTCa9Ge31eDfccT+V4ABMU=gRA@mail.gmail.com>
Subject: [PATCH] wg-quick: check if nftables is functional before using it
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

Currently, wg-quick only checks if the nft binary exists before attempting
to use nftables. This can lead to failures when the binary exists but the
required kernel modules aren't loaded.

This change adds a functionality check using 'nft list ruleset' to verify
nftables is operational before attempting to use it, falling back to
iptables if nftables is non-functional.
---
src/wg-quick/linux.bash | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..55b1850 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -238,7 +238,7 @@ add_default() {
printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d
ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta
mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
- if type -p nft >/dev/null; then
+ if type -p nft >/dev/null && nft list ruleset &>/dev/null; then
cmd nft -f <(echo -n "$nftcmd")
else
echo -n "$restore" | cmd $iptables-restore -n
--
2.47.0
