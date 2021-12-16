Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1BBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Dec 2021 16:51:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9d437d70;
	Mon, 20 Dec 2021 16:51:15 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5bf935be
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Dec 2021 19:27:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JFMZg4wnNzQkF3
 for <wireguard@lists.zx2c4.com>; Thu, 16 Dec 2021 20:27:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639682858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPjBBgWq0MKVv0vxbdWnCLfSpGXadJ/AwslfY5eGo00=;
 b=yEGFBKsmZjquwIxJoq18ajabdssZXTHpveieu9Udqu/uTPRk/n+yFQUvPKFEn3foJq03MY
 XnDFfTDzk2LFaQpsajr8e95D3J55E0Ad2/HcqTjQECvAvTtDKuPASo82S0Yct5Tc9M1P+o
 vL+PMmqxNDbcZ41eGxG1WHcCSCdmjtKmSGT394x5qh99vvs0CtXNElgmwnp+tImMOKis/y
 SetGFpuB1OBao5qJUtoHkdxRtOkfHfXoLtL8EXH6iTjMnBogKqlAnGkvGSfsGLX0vMu89z
 Rrv2K715lQYqcqQVUSjRnG0rBUla6MRIlo9wExPI/hpIE95PuPkfHbaBP6KR7w==
From: Nils <social.nst@mailbox.org>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Subject: macOS socks5 system proxy not working
Date: Thu, 16 Dec 2021 20:27:36 +0100
References: <C88C9563-32AD-4777-80BC-32B4F9244644@mailbox.org>
To: wireguard@lists.zx2c4.com
In-Reply-To: <C88C9563-32AD-4777-80BC-32B4F9244644@mailbox.org>
Message-Id: <8891729E-6370-40F5-8EDF-A363A94E154B@mailbox.org>
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:51:11 +0000
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

Hello,
I resonantly figured out that my socks5 system proxy is working with the =
VPN Providers App (using wireguard), but not when using the WireGuard =
App (App Store).=20

When using the WireGuard App the system socks5 proxy seems to be ignored =
by all applications.
My VPN Provider is aware of this Issue and recommends using his App, =
they think it has something to do with the way the WireGuard App adds =
the tunnels to the macOS network settings panel.

Is this a know issue?

I'm on running WireGuard on Apple M1 Pro macOS 12.1

Cheers,
Nils=
