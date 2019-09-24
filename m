Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DE0C432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF392082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=p-np.de header.i=@p-np.de header.b="aoAxej7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF392082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=p-np.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be2bc9bc;
	Wed, 25 Sep 2019 08:50:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28910339
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 09:37:09 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f3cf340
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 09:37:09 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 0D66BA31A8
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 11:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=p-np.de; h=
 content-type:content-type:mime-version:subject:subject
 :message-id:from:from:date:date:received; s=062016; t=
 1569317809; bh=ctl33jQVHH/FEH5gzVY6Y8LZ4usM+jU4XbRBHDRaO5o=; b=a
 oAxej7DM8a7Vc4iec7XAvNOWIBchOcS/E1Hv/i2KiVOhqPPo50jnVpmmxC/ZO2jw
 II0PHF4//4siihb1kzeZMTKRqzmC5XDBEe3ReOZtrNXb6pVB92btgY16CzRGh/h1
 AGmnkAmschoXPM417sV/yoz9WfTMmoyXtE0RJ5piG4=
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id JX00-x59Ph85 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 11:36:49 +0200 (CEST)
Date: Tue, 24 Sep 2019 11:36:48 +0200 (CEST)
From: wireguard@p-np.de
To: wireguard@lists.zx2c4.com
Message-ID: <1394974820.30160.1569317808871@office.mailbox.org>
Subject: Port dependent issues on iOS 13
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:50:01 +0200
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
Content-Type: multipart/mixed; boundary="===============1467883505932959392=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1467883505932959392==
Content-Type: multipart/alternative; 
	boundary="----=_Part_30159_140701092.1569317808868"

------=_Part_30159_140701092.1569317808868
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

in place upgrades from iOS 12 -> iOS 13 (release) seem to work well in general. But there is a bizarre issue depending on remote endpoint ports. If you have, in my case, 4500/UDP configured as remote endpoint the tunnel does not send or receive traffic. Changing it to any other port works. Changing back to 4500/UDP breaks it again reproducibly. For others, documented here https://www.reddit.com/r/WireGuard/comments/d6in39/wg_broken_on_ios_13/  , it is 1500/UDP, in #WireGuard there has been a documented issue for 500/UDP not working.

I have AnyConnect installed in parallel and checked, whether that's related. But removing and resetting Network settings did not fix port 4500 for me.

As there is no port number dependent branching in the WireGuard-iOS code base, this is likely an iOS regression. Does any one of you have a working channel to Apple to report this?

Thank you for an else excellent product. Let me know if I can be of any help.

Best regards,

Christian
------=_Part_30159_140701092.1569317808868
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div>
   Hello,
  </div>
  <div>
   <br>
  </div>
  <div>
   in place upgrades from iOS 12 -&gt; iOS 13 (release) seem to work well in general. But there is a bizarre issue depending on 
   <strong>remote</strong> endpoint ports. If you have, in my case, 4500/UDP configured as remote endpoint the tunnel does not send or receive traffic. Changing it to any other port works. Changing back to 4500/UDP breaks it again reproducibly. For others, documented 
   <a href="https://www.reddit.com/r/WireGuard/comments/d6in39/wg_broken_on_ios_13/">here</a>&nbsp;, it is 1500/UDP, in #WireGuard there has been a documented issue for 500/UDP not working.
  </div>
  <div>
   <br>
  </div>
  <div>
   I have AnyConnect installed in parallel and checked, whether that's related. But removing and resetting Network settings did not fix port 4500 for me.
  </div>
  <div>
   <br>
  </div>
  <div>
   As there is no port number dependent branching in the WireGuard-iOS code base, this is likely an iOS regression. Does any one of you have a working channel to Apple to report this?
  </div>
  <div>
   <br>
  </div>
  <div>
   Thank you for an else excellent product. Let me know if I can be of any help.
  </div>
  <div>
   <br>
  </div>
  <div>
   Best regards,
  </div>
  <div>
   <br>
  </div>
  <div>
   Christian
  </div> 
 </body>
</html>
------=_Part_30159_140701092.1569317808868--

--===============1467883505932959392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1467883505932959392==--
