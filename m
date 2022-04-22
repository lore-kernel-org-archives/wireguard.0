Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD066C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:12:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 327f72b7;
	Sun, 24 Apr 2022 20:09:53 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fcb74f72
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 17:45:25 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 83FB4240107
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 19:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1650649525; bh=7atDeM3o6EdVFECjLyxTP1wITEWr2gSSIdFSlf20hag=;
 h=From:To:Cc:Subject:Date:From;
 b=OaFvW+l/TYm/C5xCR2FH9YvpDTiznW5tYu4MJLVmcN/PJLiTiQJCdlg8qDaYkPVfz
 edieGAVOkXJUw4XWbjJ7vWmU+3U+9fwpla+sIp29D7sMzgwu+DIPkQ5Jnnbl1k27QC
 eeTLOLPsGF/H7Mn/Rlhsc3B1go+6xaJYX1zaM1nedqg9bf67jvWGSN5a5g4rBUqNEa
 lY5oFiqX9hlcxH66H0Th4aAnrvlPHhk8KIjL1AZVdl+kSbxqqOfGnc791hNzG6r3So
 Go3n2bCucyDDs6BF/tnNDnFPeAA2mGaLVOcetpz6FcpxTkN4oqKAz2dZyL8teU8maw
 NIQyyfma/9x0w==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KlMJ45Cfgz9rxF;
 Fri, 22 Apr 2022 19:45:24 +0200 (CEST)
From: Andreas Weigel <andreas.weigel@posteo.de>
To: wireguard@lists.zx2c4.com
Cc: Andreas Weigel <andreas.weigel@posteo.de>
Subject: [PATCH 0/1] wg syncconf not clearing PresharedKey/PersistentKeepalive
Date: Fri, 22 Apr 2022 17:45:05 +0000
Message-Id: <20220422174506.22299-1-andreas.weigel@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Apr 2022 20:09:51 +0000
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

I noticed that wg syncconf does not actually clear PresharedKey and
PersistentKeepalive values if those are not set in the file but set in
the running config. The proposed patch changes that to always
clear those if they are not set in the configuration file, which imho is
the correct behavior.

Andreas

Andreas Weigel (1):
  wg syncconf: explicitly reset PresharedKey/PersistentKeepalive

 src/setconf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.25.1

