Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8944AC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:26:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 67f6a2bf;
	Tue, 14 Jun 2022 09:23:29 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [2001:67c:2050:0:465::202])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6f6a8b30
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 07:20:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LMfwK4HsWz9sbL
 for <wireguard@lists.zx2c4.com>; Tue, 14 Jun 2022 09:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1655191217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=p86c9M5KfXXgUpEsIOJzSuHPG2EOpe4Z05zVu3AukLg=;
 b=tFSlkdGQ3PcOoweedUAnJoJxhE7Rml2jip2YEv1TqNnV3GB983mCZHA0cQx24IMn6sPz3a
 VsIaiSTMRuFNVSK9wlu/kVwkfytkXAmoGQmJLaerYIYCQZvqJm19ip6ynKzhOEfepSVkii
 grv8Ud7K7hYafnB+t515iFMNTvWO0BX576b4RC7hnVwZk6taDXmBaPunhwADfel3D1VITQ
 aO4i7tKrbepAzXZ0kzer86Am5Y0VZonTiwc6EhMC2hsBjts6v66luzLU/aID5c1iRI35nc
 NeCENI8hdrTa4pUvy6/ZiQj/ZT9+WCUUjiUSMfUUACNMvWQFEzeu3s6g4Ryw+g==
Date: Tue, 14 Jun 2022 15:20:12 +0800
From: snowstorm3842@mailbox.org
To: wireguard@lists.zx2c4.com
Subject: doas support for wg-quick linux
Message-ID: <20220614072012.jsvrl7buu67c6byy@erhnbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MBO-RS-ID: 843bbd5c4a440fc29f2
X-MBO-RS-META: mref8a54bscd9rao66kubqaehw1um8yt
X-Rspamd-Queue-Id: 4LMfwK4HsWz9sbL
X-Mailman-Approved-At: Tue, 14 Jun 2022 09:23:24 +0000
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

This isn't that much of a problem because I and probably many others start the wg-quick script as a system service. But when you run the script as non-root, it asks for sudo with the option "-p".

I have my doas symlinked to sudo so the script actually runs "doas -p prompt" in which the option not exist in doas. I found a the script for openbsd from your repositories, I looked at it and it uses doas. It's not that important but it'll be nice if you could add doas to the linux script.
