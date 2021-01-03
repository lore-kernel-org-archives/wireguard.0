Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB49CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 10:02:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15C4207D0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 10:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15C4207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc2395ce;
	Sun, 3 Jan 2021 09:52:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d48dfcbc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 09:52:01 +0000 (UTC)
X-Originating-IP: 82.56.4.162
Received: from localhost (host-82-56-4-162.retail.telecomitalia.it
 [82.56.4.162]) (Authenticated sender: pbl@bestov.io)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 830A51BF204
 for <wireguard@lists.zx2c4.com>; Sun,  3 Jan 2021 10:02:42 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To: <wireguard@lists.zx2c4.com>
Subject: Windows manager error
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
Date: Sun, 03 Jan 2021 10:40:34 +0100
Message-Id: <C89F9RDE1IDH.3GNEXRZ4X6IA9@enhorning>
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

Hi,

One of my users is getting the following error when trying to start the
WireGuard GUI from the Start menu shortcut, after a fresh boot:
"Manager already installed and running"

The tray icon is not present.

Going to the Task Manager confirms that the GUI is running. Killing it
from the Task Manager and launching it again fixes it (i.e. the GUI
opens and the icon appears in the tray bar).

The computer is running the latest WireGuard. The user is in the
Administrator group.

From /enterprise.md/:
	The UI is started in the system tray of all builtin
	Administrators when the manager service is running.

It seems that the service and the GUI are indeed being started (I can
see the process in the Task Manager), but for some reason the GUI
doesn't appear in the tray icon until it's killed and restarted
manually.

It may be worth noting that the system in question has more than one
Administrator user; logging into a different Administrator user when the
issue presents results in the GUI working for that Administrator (but,
of course, not the original one).

Also, the user could not really confirm whether it happens every time or
only sometimes. (I suspect it's the latter.)

Is this a known issue? What can I do to help fix it?

Riccardo

