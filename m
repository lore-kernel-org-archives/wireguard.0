Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EC9C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57AFC2073E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xirihosting.com header.i=@xirihosting.com header.b="rFH5qBfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57AFC2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xirihosting.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc0ac581;
	Wed, 17 Jun 2020 07:26:52 +0000 (UTC)
Received: from smtp84.iad3a.emailsrvr.com (smtp84.iad3a.emailsrvr.com
 [173.203.187.84])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3ae57ed
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jun 2020 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xirihosting.com;
 s=20180223-h43bbanu; t=1592249458;
 bh=zgnreMw5WYC4PW1BptpKM9ZVwN8qE9iLQUBJRS/+bFE=;
 h=Date:Subject:From:To:From;
 b=rFH5qBfyisQA/jmZ4paYAkOL8bS1tbrOZlbTvh0KKSEiE0jIFhP/biPNvZUTTJDHc
 YnI/m/jVzUnd+4mE1aZqIv80fAxCDcDGrZ16ykvsBzTweos8DGutdcBDnhS9l6xQzN
 iBMNvMbjTq78ZE9Zx2ZqN3YFLij88C5s4q+Wf6jQ=
Received: from app42.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140])
 by smtp35.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 8C9D95D95
 for <wireguard@lists.zx2c4.com>; Mon, 15 Jun 2020 15:30:58 -0400 (EDT)
X-Sender-Id: dxiri@xirihosting.com
Received: from app42.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12);
 Mon, 15 Jun 2020 15:30:58 -0400
Received: from xirihosting.com (localhost.localdomain [127.0.0.1])
 by app42.wa-webapps.iad3a (Postfix) with ESMTP id 5CC51E067A
 for <wireguard@lists.zx2c4.com>; Mon, 15 Jun 2020 15:30:58 -0400 (EDT)
Received: by webmail.emailsrvr.com
 (Authenticated sender: dxiri@xirihosting.com, from: dxiri@xirihosting.com) 
 with HTTP; Mon, 15 Jun 2020 15:30:58 -0400 (EDT)
X-Auth-ID: dxiri@xirihosting.com
Date: Mon, 15 Jun 2020 15:30:58 -0400 (EDT)
Subject: Kernel Panic after updating Kernel
From: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
Message-ID: <1592249458.376720421@webmail.emailsrvr.com>
X-Mailer: webmail/17.3.12-RC
X-Classification-ID: 7e5da72f-7df3-4b11-9ce0-822597c53ae6-1-1
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

Posted this on IRC but got no response, probably this will be a better plac=
e:=0A=0AI updated my Centos7 server yesterday and wireguard is causing a ke=
rnel panic, wanted to know if this is a known issue? =0A=0AUsing kernel 3.1=
0.0-1127.10.1.el7.x86_64=0A=0AI Tried with 2 different repos (elrepo and Co=
pr repo for wireguard owned by jdoss) and I have the same issue.=0A=0AI too=
k a screenshot of The kernel panic and uploaded at https://imgur.com/a/Ojxe=
or0=0A=0AAnother interesting bit of info is that as long as I don't move tr=
affic trough wg0 vnic, no panic happens. I can easily trigger the panic by =
just doing a ping to the other VPN endpoint and I am able to reproduce this=
 every single time.=0A=0A# lsmod | grep -i wire=0Awireguard             200=
896  0=0Aip6_udp_tunnel         12755  1 wireguard=0Audp_tunnel            =
 14423  1 wireguard=0A=0AThanks for the help!=0ADiego

