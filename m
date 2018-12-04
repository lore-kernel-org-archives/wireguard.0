Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD358C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:52:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110112084C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110112084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slightlyepic.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1dcb198;
	Wed, 5 Dec 2018 03:43:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91655ac7
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 03:27:24 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d405ed3
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 03:27:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB76422121
 for <wireguard@lists.zx2c4.com>; Mon,  3 Dec 2018 22:35:15 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Mon, 03 Dec 2018 22:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 slightlyepic.org; h=message-id:from:to:mime-version
 :content-transfer-encoding:content-type:date:subject; s=fm2; bh=
 OZ/ciuG7Yozl3PkIivWTf2/e9d0OeNPZ0FXK46cRQKg=; b=RoYc9RoBO2qNp4ZC
 GZ11AccUMYUNVSWaPux69BAQA2EsQQfJoUmhFeMmW6ShKle43O4zS5XYWKpLEXQs
 MaA9vGoVSUmymQ3h9h84RaFAyPpxRTH1Q1MWTOglehukAnlUdVCghYXx/L3j/hf9
 KNyet6COevmIxpg9p1YwcyUyrRNU/rc8kdwU1UdBW8nIyud49qizHR6vzIeQpsTE
 A4bGtVLnNIpQaevda2hvu/bBSNOo7wr00o1tdJ2da14vQWa4J4tA2N+1HBe7gXNT
 w/wGoBi19wlXJDBNNfCo9YCJ6IZJ8xi4Sfw0BYTQ2B3W63wi0VvcWsvrQkRbmXXR
 ZHH/GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OZ/ciu
 G7Yozl3PkIivWTf2/e9d0OeNPZ0FXK46cRQKg=; b=NrCnyyNew9wzIJur5lvXhP
 3BK3kO/I8S4TLoho8ROCxcRcdG8Ypv+VMB5NDxDdl9q3oJV5WmAtDoDiz9r04yGs
 QYuf7SRJEw5Wu2kC+auIgyJbZR8Uxa6FUqnnoFGJnXUS6MPH2xVPqVOr9HdeRJ2N
 QNdHZpzFcfVqmI451O/GntoUA61xyWhnHkGFc/rIh+1ejjcOuCF8uDj/oi3p/8Gh
 Cyni3TDWmeEoqNd9A1jSlAmmlTv48psCLpeZjsDqs6RLFDs4ttxOjVpiX/vRodfw
 qhnPm9b3JMO6aqCLBUDeXsMh4OvUN+tAFVjlTOg97u3hfqVe7pQp5nNnQ/0dYN2g
 ==
X-ME-Sender: <xms:8_UFXIDdBYbk1tATYkeVmthne39W8xEIxAQJjfjUrAW1MiaerEV0Xw>
X-ME-Proxy: <xmx:8_UFXLd-dznII-D1YbebMUuHOmF27-IeWR8WgzI2Su-l1AVe0BBEyQ>
 <xmx:8_UFXDw-IYkXIoqoPk5OMcYWHaIZrWkC7OmFUQ0TIWHqUOpMrgCrog>
 <xmx:8_UFXII8fy8p5nfDTTPN4tTnzwbikRPtkVITdmM8tzcW0QFfH1iJ_Q>
 <xmx:8_UFXNFE7hoxHTPQPzqMTZSaZIQGpizuoAo94znF7zG6msRxXTjJbw>
 <xmx:8_UFXM9Cc7k44BqIbnZt0E9KoZ8N5G9lQNubnmJG4WPl-loIQBPOQQ>
 <xmx:8_UFXCMg5nOVJE-PWgsLnNALvepse__4VafowH5ifaJ5pMjFW-gXNA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 43297BA50D; Mon,  3 Dec 2018 22:35:15 -0500 (EST)
Message-Id: <1543894515.2362814.1597906872.33D7BAA3@webmail.messagingengine.com>
From: BBreeziN <bbreezin@slightlyepic.org>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-3449945b
Date: Mon, 03 Dec 2018 19:35:15 -0800
Subject: Android traffic not being sent over tunnel when using kernel backend
X-Mailman-Approved-At: Wed, 05 Dec 2018 04:43:39 +0100
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
Content-Type: multipart/mixed; boundary="===============5168932744737908045=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============5168932744737908045==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative; boundary="_----------=_154389451523628140"

This is a multi-part message in MIME format.

--_----------=_154389451523628140
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

I recently set up a WireGuard tunnel between my Android phone and
Ubuntu Server at home. When using the WireGuard app without root
granted to it, the userspace implementation works as expected. I get
the key icon in the status bar on Android and my traffic is being
routed through the tunnel.
I then rooted my device, installed the ElementalX kernel (with WireGuard
support), and upon granting the WireGuard app root access, it indicates
the kernel module backend is being used. However, now when connecting my
tunnel using the same settings, my traffic is not being routed through
the tunnel. I can see this by visiting a site like whoer.net and which
reveals my carrier WAN IP, not my IP of my home ISP.
The tunnel seems to be active using the kernel module as I can ping the
phone (192.168.2.2) from the server (192.168.2.1). I can also ping
192.168.2.1 from my phone.
Any idea why the web traffic is being routed through the tunnel ONLY
when I use the Go userspace backend? Thanks for the help!
WireGuard for Android v0.0.20181001
Kernel module backend v0.0.2018119

WireGuard Ubuntu Bionic v0.0.20181119

-BBreeziN

--_----------=_154389451523628140
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>I recently set up a WireGuard tunnel between my Android phone and Ubuntu Server at home. When using the WireGuard app without root granted to it, the userspace implementation works as expected. I get the key icon in the status bar on Android and my traffic is being routed through the tunnel.<br></div>
<div><br></div>
<div>I then rooted my device, installed the ElementalX kernel (with WireGuard support), and upon granting the WireGuard app root access, it indicates the kernel module backend is being used. However, now when connecting my tunnel using the same settings, my traffic is not being routed through the tunnel. I can see this by visiting a site like whoer.net and which reveals my carrier WAN IP, not my IP of my home ISP.<br></div>
<div><br></div>
<div>The tunnel seems to be active using the kernel module as I can ping the phone (192.168.2.2) from the server (192.168.2.1). I can also ping 192.168.2.1 from my phone.<br></div>
<div><br></div>
<div>Any idea why the web traffic is being routed through the tunnel ONLY when I use the Go userspace backend? Thanks for the help!<br></div>
<div><br></div>
<div>WireGuard for Android v0.0.20181001<br></div>
<div>Kernel module backend v0.0.2018119<br></div>
<div><br></div>
<div>WireGuard Ubuntu Bionic v0.0.20181119<br></div>
<div><br></div>
<div>-BBreeziN<br></div>
</body>
</html>

--_----------=_154389451523628140--


--===============5168932744737908045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5168932744737908045==--

