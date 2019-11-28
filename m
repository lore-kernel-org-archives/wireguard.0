Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA5EC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 12:27:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A55D2158A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 12:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A55D2158A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=med.uni-frankfurt.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b359c56;
	Thu, 28 Nov 2019 12:27:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80d9f7a9
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 12:27:03 +0000 (UTC)
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
 [141.2.22.206])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1f1204e
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 12:27:03 +0000 (UTC)
Received: from smtpauth.cluster.uni-frankfurt.de ([10.1.1.214])
 by mailout.rz.uni-frankfurt.de with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1iaIsw-00060m-L5
 for wireguard@lists.zx2c4.com; Thu, 28 Nov 2019 13:27:02 +0100
Received: from p5b05545f.dip0.t-ipconnect.de ([91.5.84.95] helo=[192.168.2.17])
 by smtpauth.cluster.uni-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1iaIsw-0002DV-4B
 for wireguard@lists.zx2c4.com; Thu, 28 Nov 2019 13:27:02 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
Subject: PostDown 0.0.20191127
Message-ID: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
Date: Thu, 28 Nov 2019 13:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------07B0421A9FCF288E03701384"
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
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

This is a multi-part message in MIME format.
--------------07B0421A9FCF288E03701384
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there ...

in 0.0.20191127 PostDown invocation can fail
as remove_iptables() can return non-zero. A
patch is attached.

Thomas

--------------07B0421A9FCF288E03701384
Content-Type: text/x-patch;
 name="wg-quick.20191127-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="wg-quick.20191127-fix.patch"

--- /usr/bin/wg-quick.vanilla	2019-11-28 13:23:36.898460985 +0100
+++ /usr/bin/wg-quick	2019-11-28 13:19:59.402907478 +0100
@@ -192,6 +192,7 @@
 		done < <($iptables-save)
 		[[ $found -eq 1 ]] && echo "$restore" | cmd $iptables-restore -nw
 	done
+	return 0
 }
 
 HAVE_SET_IPTABLES=0

--------------07B0421A9FCF288E03701384
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------07B0421A9FCF288E03701384--
