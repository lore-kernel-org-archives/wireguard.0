Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D06CD6E60
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jun 2026 10:01:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 73fab576;
	Mon, 1 Jun 2026 10:01:45 +0000 (UTC)
Received: from mail.lekensteyn.nl (mail.lekensteyn.nl [2a02:2308::360:1:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2d65f124
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 May 2026 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lekensteyn.nl; s=s2048-2021-q3; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDIwf3bV+/8VP5re/t19jT2BugJujNCn6nEFsmiNq4o=; b=MzvIyRr295n9Gz2eVf8PMeLSki
 Bwo9J75toZANbTqLMjRGzU3sw3d7pTnRrSVgqW0DKhBCtwrxNps6y9WpqbdwGuOdJ54fDnoLrm3Kj
 AlYifx1Pzvx/61k/AvVlwhpkO+Mc+k3rkeVbGJvTO5spTShDPWncDjBOKn91hACQvcQ3HrjWOA+zl
 CxBUlWsEpPVbxTiY60cZSG6Q/wZelhD+3lsNDBDFlm5jRfbhE3J8uMtyf8ymBCtwgZXoovX+Qv2nZ
 624MQPkl37NWsili3Pdvujfi3P5EC48rWNLd5c4cAruOqhFx4RARTR56KjDr7YpDoy5tJL6j/R6dS
 KRWJoEDw==;
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <peter@lekensteyn.nl>) id 1wTp3y-0000lv-86
 for wireguard@lists.zx2c4.com; Mon, 01 Jun 2026 00:55:22 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/2] extract-handshakes: add BTF approach and fix compatibility
Date: Mon,  1 Jun 2026 00:55:19 +0200
Message-ID: <20260531225521.576473-1-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jun 2026 10:01:43 +0000
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

While trying to decrypt WireGuard traffic in Wireshark, I noticed the
extract-handshakes utility broke since upstreaming in Linux v5.6 (2019).

Attached is a patch to fix the main issue, and another one to remove a
dependency on the WireGuard kernel module sources by relying on BTF.

Tested on Arch Linux (7.0.10-arch1-1) and Ubuntu 24.04
(6.8.0-41-generic), both have BTF support.

Peter Wu (2):
  extract-handshakes: fix compatibility with upstream WireGuard module
  extract-handshakes: add a more user-friendly BTF approach

 contrib/extract-handshakes/README             |  7 +-
 .../extract-handshakes/extract-handshakes.sh  | 25 ++++---
 contrib/extract-handshakes/make-offsets.sh    | 70 +++++++++++++++++++
 3 files changed, 93 insertions(+), 9 deletions(-)
 create mode 100755 contrib/extract-handshakes/make-offsets.sh

-- 
2.54.0

