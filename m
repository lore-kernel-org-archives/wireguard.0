Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BOGUS_MIME_VERSION,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F3FC76196
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812162184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 812162184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=msgden.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4374dfea;
	Wed, 17 Jul 2019 20:42:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13dd5b28
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2019 22:05:46 +0000 (UTC)
Received: from exit1-us.msgsafe.io (exit1-us.msgsafe.io [104.131.125.206])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e1c04d3
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2019 22:05:46 +0000 (UTC)
Received: from exit1-us.msgsafe.io (exit1-us.msgsafe.io [104.131.125.206])
 by exit1-us.msgsafe.io (Postfix) with ESMTP id 0CBC440911
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2019 22:05:46 +0000 (UTC)
X-Msgsafe-Uuid: 1d9c2c4a-5629-4052-8528-41da45b6c04f
To: wireguard@lists.zx2c4.com <wireguard@lists.zx2c4.com>
From: Ian Blackburn <iblackburn@msgden.com>
Subject: Significant packet loss on a wg interface
Content-Type: multipart/mixed; boundary="9e535bd040094c5aaf6b5d126366da3a"
Mime-Version: 1.1 (msgsafe.io)
Message-Id: <20190709220546.0CBC440911@exit1-us.msgsafe.io>
Date: Tue,  9 Jul 2019 22:05:46 +0000 (UTC)
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:42:54 +0200
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

--9e535bd040094c5aaf6b5d126366da3a
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="bf2aa4e861084a5dbb4c7b0ce620b1d6"

--bf2aa4e861084a5dbb4c7b0ce620b1d6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ascii"
Mime-Version: 1.0

Hello,

I've been evaluating the use of Wireguard to replace a setup that uses
OpenVPN. Initial tests look promising in terms of system resources required
(much less CPU than OpenVPN), but I'm encountering a fair amount of packet
loss and I can't see why.

The scenario is a public API endpoint that devices ping with a reasonably
hefty payload. The payload is received by nginx which proxies it over a tunnel
(via public network) to a server downstream.

Wiregard version is 0.0.20190406-1,

The test server is an Intel i5-4460 running Debian, with 4.19.0-5-amd64
kernel.

load average: 2.18, 2.12, 2.12  
%Cpu(s): 25.2 us, 3.0 sy, 0.0 ni, 68.3 id, 0.0 wa, 0.0 hi, 3.5 si, 0.0 st

So basically, the traffic isn't exceptionally heavy and it is pretty stable in
terms of volume, and the machine is not doing anything else.

Looking at the wg0 interface, I see it dropping a fair amount of RX packets.
Doing some maths with /sys/class/net/wg0/statistics, it shows the interface is
receiving about 600KB/sec and around 5000pps. The RX dropped counter is rising
at about 120-150pps (between 2-3%) and this is show up as an error to the
sender which then has to explicitly retry (this is how I became aware of the
problem in the first place).

The underlying eth0 interface isn't seeing a single packet dropped or any
errors.

eth0 mtu is 1500, wg0 mtu is 1420 (haven't touched these).

I've tried raising txqueuelen, raising net.core.rmem_max and
net.core.rmem_default to stupidly high values with 0 difference.

I've tried setting net.ipv4.tcp_rmem='16384 33554432 67108864, increasing
net.core.netdev_max_backlog and net.ipv4.udp_mem but nothing changes. So
rather than try even more random changes, I'm wondering if anybody recognizes
the symptoms, and what the fix is? I think that covers it, but feel free to
ask for other metrics.

The exact same machine using OpenVPN dropped nothing (although user cpu was
closer to 60%).

Thanks,  
Ian.  

\-- Sent using MsgSafe.io's Free Plan Private, encrypted, online communication
For everyone. https://www.msgsafe.io



--bf2aa4e861084a5dbb4c7b0ce620b1d6
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="ascii"
Mime-Version: 1.0

<p>Hello,</p>
<p>I've been evaluating the use of Wireguard to replace a setup that uses OpenVPN. Initial tests look promising in terms of system resources required (much less CPU than OpenVPN), but I'm encountering a fair amount of packet loss and I can't see why.</p>
<p>The scenario is a public API endpoint that devices ping with a reasonably hefty payload. The payload is received by nginx which proxies it over a tunnel (via public network) to a server downstream.</p>
<p>Wiregard version is 0.0.20190406-1,</p>
<p>The test server is an Intel i5-4460 running Debian, with 4.19.0-5-amd64 kernel.</p>
<p>load average: 2.18, 2.12, 2.12<br>%Cpu(s): 25.2 us,  3.0 sy,  0.0 ni, 68.3 id,  0.0 wa,  0.0 hi,  3.5 si,  0.0 st</p>
<p>So basically, the traffic isn't exceptionally heavy and it is pretty stable in terms of volume, and the machine is not doing anything else.</p>
<p>Looking at the wg0 interface, I see it dropping a fair amount of RX packets. Doing some maths with /sys/class/net/wg0/statistics, it shows the interface is receiving about 600KB/sec and around 5000pps. The RX dropped counter is rising at about 120-150pps (between 2-3%) and this is show up as an error to the sender which then has to explicitly retry (this is how I became aware of the problem in the first place).&nbsp;</p>
<p>The underlying eth0 interface isn't seeing a single packet dropped or any errors.</p>
<p>eth0 mtu is 1500, wg0 mtu is 1420 (haven't touched these).</p>
<p>I've tried raising txqueuelen, raising net.core.rmem_max and net.core.rmem_default to stupidly high values with 0 difference.</p>
<p>I've tried setting net.ipv4.tcp_rmem='16384 33554432 67108864, increasing net.core.netdev_max_backlog and net.ipv4.udp_mem but nothing changes. So rather than try even more random changes, I'm wondering if anybody recognizes the symptoms, and what the fix is? I think that covers it, but feel free to ask for other metrics.</p>
<p>The exact same machine using OpenVPN dropped nothing (although user cpu was closer to 60%).</p>
<p>Thanks,<br>Ian.<br></p>
<br><br></div>--</div>
<div>Sent using <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>MsgSafe.io</a>'s Free Plan</div>
<div>Private, encrypted, online communication</div>
<div>For everyone. <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>www.msgsafe.io</a></div>


--bf2aa4e861084a5dbb4c7b0ce620b1d6--

--9e535bd040094c5aaf6b5d126366da3a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--9e535bd040094c5aaf6b5d126366da3a--
