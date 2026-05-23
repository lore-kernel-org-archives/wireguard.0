Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C20CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:55:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b86da6db;
	Mon, 5 Oct 2026 06:55:51 +0000 (UTC)
Received: from smtp-outbound2.duck.com (smtp-outbound2.duck.com [20.67.223.10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 750859ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2026 03:44:00 +0000 (UTC)
References: <abgBz1nmM6LD-0bMqUc6gO14UGFdLMad4y7VHlyOMSnK2vUHOeqEc6P1OzkS0lbIhCLtuSXeNxIX72wTxB8LPy-pdl-cH_G70aO7MwUFTOU=@proton.me>
 <DAA7DED0-AE8F-4FA8-AFBB-68DA8178B3FB.1@smtp-inbound1.duck.com>
Subject: Add instructions to verify android APK to wireguard.com
MIME-Version: 1.0
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: DMARC_POLICY_ALLOW(-0.5) R_DKIM_ALLOW(-0.2) MIME_GOOD(-0.1)
 R_SPF_ALLOW(-0.2)
X-Rspamd-Score: -1
X-Rspamd-Action: no action
To: wireguard@lists.zx2c4.com
Received: by smtp-inbound1.duck.com; Fri, 22 May 2026 23:44:00 -0400
Message-ID: <7C4828E7-8864-43BE-9E6C-65FB4A1849C6.1@smtp-inbound1.duck.com>
Date: Fri, 22 May 2026 23:44:00 -0400
From: marqueandreprisal@duck.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duck.com; h=From:
 Date: Message-ID: To: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Subject: References; q=dns/txt; s=postal-KpyQVw;
 t=1779507840; bh=dQFeAyXQVPPIaJ40oy4kGxUyadjLOW3gsCXytjqAvOI=;
 b=LPvmiXcKFlb4gt6eFVCDZKuyc7mi0YjOHrceygsUC55tHbtGLwlp5PbYZWMqfYo7Z/dVOmYbX
 NUO6Egdm427ylg4QoFhcLyy/L03R3mSTSiJn6CdWxmbCZcqwVSrRZ4GTzLI8ktPbPK4B46dedIB
 oXRdPwvLfntqxyhtIG4/2SE=
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

Verifying apk from play store means little now because playstore does 
machine code injections.
