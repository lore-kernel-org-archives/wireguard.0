Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BEFC25B41
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88f0e014;
	Mon, 23 Oct 2023 14:07:36 +0000 (UTC)
Received: from smtp2.eurecom.fr (smtp2.eurecom.fr [193.55.113.211])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5d2f886
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2023 13:40:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.03,165,1694728800"; d="scan'208";a="13410926"
Received: from thorgal.eurecom.fr ([10.3.2.220])
 by drago2i.eurecom.fr with ESMTP; 21 Sep 2023 15:40:23 +0200
Received: (from apache@localhost)
 by thorgal.eurecom.fr (8.14.4+Sun/8.14.4/Submit) id 38LDeMCa023469;
 Thu, 21 Sep 2023 15:40:22 +0200 (CEST)
X-Authentication-Warning: thorgal.eurecom.fr: apache set sender to
 otilibil@eurecom.fr using -f
Received: from 91-175-7-2.subs.proxad.net (91-175-7-2.subs.proxad.net
 [91.175.7.2]) by webmail.eurecom.fr (Horde MIME library) with HTTP; Thu, 21
 Sep 2023 15:40:21 +0200
Message-ID: <20230921154021.vy0q428740gggsos@webmail.eurecom.fr>
Date: Thu, 21 Sep 2023 15:40:21 +0200
From: Ariel Otilibili Anieli <otilibil@eurecom.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] .DEFAULT_GOAL is a variable, not a target
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
User-Agent: Internet Messaging Program (IMP) H3 (4.1.4)
X-Originating-IP: 91.175.7.2
X-Remote-Browser: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36
 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Makefile has been working because, in the script, `wg` appears as  
first target.

https://www.gnu.org/software/make/manual/html_node/Special-Variables.html

Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile b/src/Makefile
index 0533910..9f450e7 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -108,7 +108,7 @@ check: clean
         scan-build --html-title=wireguard-tools -maxloop 100 --view  
--keep-going $(MAKE) wg

  all: wg
-.DEFAULT_GOAL: all
+.DEFAULT_GOAL := all
  .PHONY: clean install check

  -include *.d
-- 
2.42.0

-------------------------------------------------------------------------------
This message was sent using EURECOM Webmail: http://webmail.eurecom.fr

