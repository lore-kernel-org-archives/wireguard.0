Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EECAD4922A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:35:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e955122b;
	Mon, 18 Nov 2024 12:45:14 +0000 (UTC)
Received: from mail-a10.ithnet.com (mail-a10.ithnet.com [217.64.83.105])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02274930
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Apr 2024 15:11:11 +0000 (UTC)
Received: (qmail 31429 invoked by uid 0); 29 Apr 2024 15:11:10 -0000
Received: from skraw.ml@ithnet.com by mail-a10 
 (Processed in 3.702597 secs); 29 Apr 2024 15:11:10 -0000
X-Virus-Status: No
X-ExecutableContent: No
Received: from dialin014-sr.ithnet.com (HELO ithnet.com) (217.64.64.14)
 by mail-a10.ithnet.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted);
 29 Apr 2024 15:11:06 -0000
X-Sender-Authentication: SMTP AUTH verified <skraw.ml@ithnet.com>
Date: Mon, 29 Apr 2024 17:11:06 +0200
From: Stephan von Krawczynski <skraw.ml@ithnet.com>
To: wireguard@lists.zx2c4.com
Subject: Hot reload does not work from a script?
Message-ID: <20240429171106.5c6913d3@ithnet.com>
Organization: ith Kommunikationstechnik GmbH
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Hello all,

can anyone explain why a hot reload as posted everywhere 
	wg syncconf wg0 <(wg-quick strip wg0)
from a linux console is working as expected whereas the very same line inside
a bash script does not work as hot reload but as kind of a restart where online
clients have to reconnect. This leves them offline for about 15 seconds.
I tried that with the above version and with systemctl, and both react the
same.
What is the underlying problem here?
--
Regards,
Stephan
