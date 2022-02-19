Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA33C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 18:18:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1e1583f5;
	Mon, 21 Feb 2022 18:17:39 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fc077d21
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Feb 2022 01:23:56 +0000 (UTC)
Date: Sat, 19 Feb 2022 01:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645233835;
 bh=GhXM89dLbFqXGUUsukWW71aiwHeWn46yNmH38m0UmBc=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=I7QkU9vZhQEy+aRXo0gJb2VfcGGhLIJ4Bu7Mb4JmJeTiyopCe67pjVonE4jGTsCMv
 fI+NpkwwAQ2fS2N1FD3gnE9CNjU8FbWlrRoua8+BAiEPIg42OUXZdIUFZ1NnGJWjMS
 zPzqtLdMmEVYW+321fGkjYeV+JZrj0MjkmSlfBZsAZjaCr3oCBodiYZgPefrsIXgUB
 0l0qdppbjh4YqiidHzXvVqXtvzXDV6dzL3a4ec2Q0pktgja28oPdCZ0Y/dfH+10KcC
 arw1lAp79yrQTQcOtgVomd58QYvLJ3b6sFBXddf9JMR3h7KyJ7BuGBnCbxLja7orNn
 mF1HooPSu2vNg==
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Rujbin <rujbin@protonmail.com>
Subject: WireGuard Windows should have default MTU of 1280.
Message-ID: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Feb 2022 18:17:37 +0000
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
Reply-To: Rujbin <rujbin@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

i am just confused. When i use default MTU the Performance on Windows is VE=
RY poor. It is almost unuseable. It happens on multiple Windows devices. I =
started using MTU 1280 for a while, but why is it only Windows with that is=
sue? First, the speed is limited to 100mbps maximum. Thats weird, when i us=
e MTU 1280 i have 1gbps. https://i.imgur.com/ELGOWDQ.png

This bug exists for a long time to me. I ran Wireguard on almost every prov=
ider, (i didnt check if it happens on Azure) but this bug exists on Hetzner=
, DigitalOcean, OVH. This is not normal. I am running the latest stable ver=
sion of Wireguard Windows. Kernel module on servers and BoringTun.
