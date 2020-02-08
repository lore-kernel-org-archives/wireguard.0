Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8817C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:27:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A47622522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVSRX5WI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A47622522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d63ded93;
	Sat, 8 Feb 2020 21:24:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4de35f7d
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 05:00:30 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbd8322e
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 05:00:30 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h8so1923370iob.2
 for <wireguard@lists.zx2c4.com>; Fri, 07 Feb 2020 21:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=g9eAkf6qbAYenCFsEMJDDLilUZOzg0MdqVfTQGW9F4s=;
 b=UVSRX5WIrRbFH1E2yUCVe8IJ2yQvBwWHA3AehzGUKUscHz1ZI3cTFVk9xdcqAiskCo
 pDzauArWddHKoPxwDkGUcr8fwWj+o+cKByRDlXwr16zoL3qu8x3FQVrtOpVbbLj/jhdD
 Vz6mp5D7hrnEqM3D+gij8m6RK6l1Q677bumrVafeJbY5eamQByO/gZGOPA9AnBOCqWbh
 GIFseC46aK+L62QoMXQN2R42mhjcOdqyyX4LqEt9OeU0iJU/r8zzdfe+qRf/O7c7M+kR
 O8hEJyi8zWOgAGQQqPyyLQj8oO4QLFDl1OZ13zbz/rXrFO+/N8u1lNi1X0Eb2VkNuyT7
 kcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=g9eAkf6qbAYenCFsEMJDDLilUZOzg0MdqVfTQGW9F4s=;
 b=nvBMvif08O6ReULeoVNCxmxe6FCbyABECBRfI3FshULwrLanz4ng4dsgQTKJqoNrNG
 8sx6Q0UfiW5+ENm6XkR6O/v3EbAOpYwuqJT5zKpklirnsZctSpGLPHj+FRIyN71WRiXL
 oXbMdK7DlN35ECtOD+Fqmsgmbi6XB8A0hN8phZxVvWAWBi8OjMYNlN3bg4nfmtm1+X8O
 sK3HYsgLwhTfiZ/TJ4dlnA91vzl+BCKE/ubfj9pLiiDpYjoMkT2sa6EGbx0crXaes4KT
 CYVjOvub0Y0DvV2QbjvvYxyk8zGmdd6+Ks+5eNZhqlM/ycwm6efFarUrrKH3L+1o6xgF
 PWFQ==
X-Gm-Message-State: APjAAAUN35AcJRkXmCVhsKAp6vS6d4VSI+M7a9SYxpk7hoRQWFmJpOjo
 PwNJBDgOELmb8LreVCnvUooqTXSHsiuvdvR8SXYgoYJrzvWa6A==
X-Google-Smtp-Source: APXvYqzvGo789nD8RbV5K4yAnvB3xxV8dlzrh2Qn1Im4b2RUQPq3eE5BjaRkrt6KS4ukN4l1zpcfYZfsEXB0BFlE4qU=
X-Received: by 2002:a6b:1744:: with SMTP id 65mr1535296iox.145.1581138106720; 
 Fri, 07 Feb 2020 21:01:46 -0800 (PST)
MIME-Version: 1.0
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Sat, 8 Feb 2020 08:31:21 +0330
Message-ID: <CA+NJmkessNRmWxxST5tZSijVJU4QZevibKZ2XbXEWRCUty54PQ@mail.gmail.com>
Subject: Minor bugs in the sample script for ns-routing
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:24:08 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The sample script provided at "Routing and Network Namespace
Intergration" page seems to have a few bugs, at least on Ubuntu 19.10:

1. The execi command seems to have an extra "exec" at the beginning. Instead of:

exec ip netns exec physical sudo -E -u \#${SUDO_UID:-$(id -u)} -g
\#${SUDO_GID:-$(id -g)} -- "$@"

It should say:

ip netns exec physical sudo -E -u \#${SUDO_UID:-$(id -u)} -g
\#${SUDO_GID:-$(id -g)} -- "$@"


2. The "shift" command should be moved into "execi" function.

3. dhcpd seems to be replaced by dhclient. It would be nice if the
script set it (and other configurations) as a variable, e.g. to make
it easier for user to adopt the script:

DHCP_DAEMON=dhcpd
WG_IFACE=wgvpn0
WLAN_IFACE=wlan0
WLAN_PHY=phy0
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
