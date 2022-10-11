Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179CFC38A2D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Oct 2022 14:54:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b14e5a13;
	Mon, 24 Oct 2022 14:54:44 +0000 (UTC)
Received: from mail1.g22.pair.com (mail1.g22.pair.com [66.39.65.155])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 69063c14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Oct 2022 00:03:30 +0000 (UTC)
Received: from mail1.g22.pair.com (localhost [127.0.0.1])
 by mail1.g22.pair.com (Postfix) with ESMTP id 2673E27381F
 for <wireguard@lists.zx2c4.com>; Mon, 10 Oct 2022 20:03:29 -0400 (EDT)
Received: from [192.168.8.9] (unknown [98.7.32.18])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail1.g22.pair.com (Postfix) with ESMTPSA id F31212AF0B8
 for <wireguard@lists.zx2c4.com>; Mon, 10 Oct 2022 20:03:28 -0400 (EDT)
Message-ID: <5d496a35-f43e-776b-c20c-ed869fb5cb96@michaelhorowitz.com>
Date: Mon, 10 Oct 2022 20:03:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: user6@michaelhorowitz.com
Subject: DNS leak Wireguard Android app on ChromeOS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: mailmunge 3.09 on 66.39.65.155
X-Mailman-Approved-At: Mon, 24 Oct 2022 14:54:43 +0000
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

  
I found what appears to be a bug, DNS requests outside the VPN tunnel.

This happened on a Chromebook using the Wireguard android app.
The Wireguard app was version 1.0.20220516
ChromeOS was version 105.0.5195.134  32bit

I have a screen shot of the Wireguard app, but I am new to this list and don't know if it allows attachments. If it does, I can provide the screen shot later.
  
The VPN provider was Windscribe and they use 10.255.255.4 for their internal DNS.

Below are log records from the router that the Chromebook was connected to.
Clearly, it is making DNS requests to their internal DNS server that are outside the VPN tunnel.
If they were inside the tunnel, the router would never have seen them.
The 10.1.1.5 IP is my local LAN.

Oct 10 12:20:44 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=64 TTL=63 ID=61082 DF PROTO=UDP SPT=35763 DPT=53 LEN=44
Oct 10 10:20:03 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=73 TTL=62 ID=52035 DF PROTO=UDP SPT=60940 DPT=53 LEN=53
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=62 ID=32736 DF PROTO=UDP SPT=53213 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=62 ID=32735 DF PROTO=UDP SPT=53213 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=36817 DF PROTO=UDP SPT=24575 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=65082 DF PROTO=UDP SPT=30781 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=50536 DF PROTO=UDP SPT=32428 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=2381  DF PROTO=UDP SPT=6459  DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=30935 DF PROTO=UDP SPT=12559 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=29472 DF PROTO=UDP SPT=16243 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=38528 DF PROTO=UDP SPT=54329 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=53402 DF PROTO=UDP SPT=13893 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=16001 DF PROTO=UDP SPT=46864 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=32123 DF PROTO=UDP SPT=63327 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=33030 DF PROTO=UDP SPT=56642 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=71 TTL=63 ID=38599 DF PROTO=UDP SPT=25267 DPT=53 LEN=51
Oct 10 10:19:26 Firewall: Denied CONN=vlan SRC=10.1.1.5 DST=10.255.255.4 LEN=73 TTL=62 ID=33582 DF PROTO=UDP SPT=53072 DPT=53 LEN=53

I was not looking for this, so I am not sure if these requests were during the tunnel creation or afterwards.
Pretty sure they were not during the shutdown of the tunnel.
This is not a fluke, it can be replicated.

Michael Horowitz


- - - - - End of Message - - - - -
