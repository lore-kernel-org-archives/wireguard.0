Return-Path: <SRS0=+2x1=QC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615BAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 16:00:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3358461B95
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 16:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3358461B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sdn.clinic
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e898fcad;
	Mon, 15 Nov 2021 15:58:00 +0000 (UTC)
Received: from mail.rfc2324.org (mail.rfc2324.org [2a01:a700:4621:867::10])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc521c21
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Nov 2021 15:57:59 +0000 (UTC)
Received: from [2a01:a700:4621:a020:1b57:3829:d7fb:af17]
 by mail.rfc2324.org with esmtpsa rfc2324.org Mailserver
 id 1mmeMo-0006Co-EC
 for <wireguard@lists.zx2c4.com>; Mon, 15 Nov 2021 16:57:58 +0100
To: wireguard@lists.zx2c4.com
From: Maximilian Wilhelm <max@sdn.clinic>
Organization: SDN Clinic
Message-ID: <d1c0a3e8-c461-3d70-e23f-fceac21cbd43@sdn.clinic>
Date: Mon, 15 Nov 2021 16:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a01:a700:4621:a020:1b57:3829:d7fb:af17
X-SA-Exim-Mail-From: max@sdn.clinic
Subject: [PATCH 0/1] Add support to send/receive tunnel packets via Linux VRFs
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.rfc2324.org)
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

this patch adds support to bind the listening/sending UDP sockets to a
specific network interface on Linux to allow sending/receiving encrypted
tunnel packets via a given VRF.

The motivation behind this is to put any external interface(s) of a host
into a VRF (e.g. "vrf_external") and have the rest of the interface in the
main VRF, so all tools and services can be used normally and can't directly
reach/leak to the Internet.  This way different island can be connected
easily and securely without the fear of leaking any communication into the
Internet.  See my blog article on VRF support for OpenVPN [0] for a more
detailed description.

Using VRFs is much simpler than setting up Network Namespaces, shoving
interfaces around and having to care about which processes should run
where.

This patch is very similar to the patch "Basic support for binding the
transport socket to a device" sent in June this year, but adds two more
settings in send4() and send6() without VRF support didn't work for me.

I'm unsure wether it would be better to use the name "bind_dev" within
the kernel or clearly denote that an ifindex is used, as it is now.

The user-space part of this change is available as a PR to the 
wireguard-linux
repo on GitHub [1], but can be sent as patches to the list as well.

Best
Max

[0] https://blog.sdn.clinic/2018/12/openvpn-and-vrfs/
[1] https://github.com/WireGuard/wireguard-tools/pull/12

Maximilian Wilhelm (1):
   wireguard: Add support to bind socket(s) to device

  drivers/net/wireguard/device.h  |  1 +
  drivers/net/wireguard/netlink.c |  7 ++++++-
  drivers/net/wireguard/socket.c  | 13 +++++++++++++
  include/uapi/linux/wireguard.h  |  2 ++
  4 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.20.1
