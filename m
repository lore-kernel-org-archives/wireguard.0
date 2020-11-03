Return-Path: <SRS0=k+pv=EJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D666DC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Nov 2020 19:06:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF4C20786
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Nov 2020 19:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xirihosting.com header.i=@xirihosting.com header.b="eXPgsTtY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF4C20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xirihosting.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 487e6c54;
	Tue, 3 Nov 2020 19:03:07 +0000 (UTC)
Received: from smtp71.iad3a.emailsrvr.com (smtp71.iad3a.emailsrvr.com
 [173.203.187.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ec52ba3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Nov 2020 19:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xirihosting.com;
 s=20180223-h43bbanu; t=1604430353;
 bh=PM+Ad4GJxcw3H9ZcvIIghWkWz8ze7Uttnzfh18LVnM4=;
 h=Date:Subject:From:To:From;
 b=eXPgsTtYICSoshlA22Oq0+0lwTiQuocblW4w7WSMl1TMDot19y7qnH0Y1Tkb9n0O9
 Li3e9EJGa0/wjSIm6dfDqbrAW5io0gUVC89ivs2Mw3G8g9ybU2RvrYlYu2l5dLK9o8
 BK8vv1he+hTK9kzA3GuSujBAbi1/6palzgVSnjII=
Received: from app25.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140])
 by smtp9.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 738AE43BA
 for <wireguard@lists.zx2c4.com>; Tue,  3 Nov 2020 14:05:53 -0500 (EST)
Received: from xirihosting.com (localhost.localdomain [127.0.0.1])
 by app25.wa-webapps.iad3a (Postfix) with ESMTP id 4CBF020042
 for <wireguard@lists.zx2c4.com>; Tue,  3 Nov 2020 14:05:53 -0500 (EST)
Received: by webmail.emailsrvr.com
 (Authenticated sender: dxiri@xirihosting.com, from: dxiri@xirihosting.com) 
 with HTTP; Tue, 3 Nov 2020 14:05:53 -0500 (EST)
X-Auth-ID: dxiri@xirihosting.com
Date: Tue, 3 Nov 2020 14:05:53 -0500 (EST)
Subject: Using Wireguard for Geo redundancy
From: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
Message-ID: <1604430353.311423080@webmail.emailsrvr.com>
X-Mailer: webmail/18.1.7-RC
X-Classification-ID: 851ecda5-4da7-4d4d-9617-3d2a6ef23e22-1-1
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

Hi!=0A=0AI am looking for information on how to leverage Wireguard in a geo=
-redundancy scenario.=0A=0AWe have a couple management boxes colocated next=
 to each other that provide HA via a VIP that "jumps" between each of those=
 management boxes depending on availability.=0A=0ANow lets say we want to p=
lace management box on datacenter 1 (DC1) and management box 2 on datacente=
r2 (DC2).=0A=0AAssuming the VIP cannot move between DCs, how could you leve=
rage Wireguard to provide the same level of redundancy but with geographica=
lly dispersed hosts?=0A=0AAny information on this topic or documentation th=
at points me in the right direction would be really appreciated!=0A=0AThank=
s!=0ADiego

