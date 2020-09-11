Return-Path: <SRS0=5dvq=C3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FF8C43463
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9BF23787
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=oneacl.com header.i=@oneacl.com header.b="Rhy8PCnG";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="KVlS6r2B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9BF23787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oneacl.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 480b52ed;
	Fri, 18 Sep 2020 15:27:36 +0000 (UTC)
Received: from a27-190.smtp-out.us-west-2.amazonses.com
 (a27-190.smtp-out.us-west-2.amazonses.com [54.240.27.190])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df71a912
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Sep 2020 00:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=b2wcjc4b47rrujlg73p6tcdszvksmhfj; d=oneacl.com; t=1599786495;
 h=To:References:Subject:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=wBUkMQLsxET1NtPElQlBZIBgIOx5J6n9gvVaJ7Fe4o0=;
 b=Rhy8PCnGZvu9xfT6PeyN7zYG4hB6J9xkymkGHwF/jKh+p/b4et+173NQRGj27H13
 935HPMvPX52En33Fndu79w+F1jJOPvVk782kztgwPOjaXj0YO+EvBgXjNbmnXtGyiuk
 eYUx7RHjcSwyPt9LBTx3n+TC0s0bKZxCP3sOISMQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599786495;
 h=To:References:Subject:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=wBUkMQLsxET1NtPElQlBZIBgIOx5J6n9gvVaJ7Fe4o0=;
 b=KVlS6r2B0imGHzROEyi843R1JZvEQOxNE/O2a+CNcgrp8LknA/q7HilZLDd2aNtq
 srmdI3MDhCGSqhDxBoTl3+T/kt/MxLlxV2RHuCZ1ZeTZ7rofry6iWRNk9XrWTWAjxB1
 zF30dhKRauMqoJ2KTfAQihPDxUwHkWCCcN2XO4So=
To: wireguard@lists.zx2c4.com
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
From: Eddie Jones <data.goldfish@oneacl.com>
Message-ID: <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2020 01:08:15 +0000
MIME-Version: 1.0
In-Reply-To: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.11-54.240.27.190
Feedback-ID: 1.us-west-2.uB/QlwiJBEoaCws3+Zv+F9cXI7w8e8pGXTk2xBIonJQ=:AmazonSES
X-Mailman-Approved-At: Fri, 18 Sep 2020 17:27:32 +0200
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

Sorry if this message comes out of thread, I wasn't subscribed when the messages below were sent (I did click on the web link containing "in-reply-to").

I'm also seeing the same on iOS (an iPhone and an iPad) after I put them to flight mode (overnight or for more than a few hours).
It seems to recover after a minute and a half but looking at the logs I also saw that handshakes are being attempted while in flight mode every ~ 10 minutes.
This doesn't seem to affect battery life (significantly)

sample log:
--
2020-09-11 00:35:06.972422: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 3)
2020-09-11 00:35:06.972897: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 00:35:06.975534: [NET] peer(CHzf…1U30) - Handshake did not complete after 5 seconds, retrying (try 6)
2020-09-11 00:35:06.978000: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 00:35:06.980886: [NET] peer(YhQB…Lcm8) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sendto: no route to host
2020-09-11 00:35:06.981306: [NET] peer(YhQB…Lcm8) - Removing all keys, since we haven't received a new one in 540 seconds
2020-09-11 00:35:06.985392: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host
2020-09-11 00:35:06.985751: [NET] peer(CHzf…1U30) - Removing all keys, since we haven't received a new one in 540 seconds
2020-09-11 00:35:06.987170: [NET] peer(YhQB…Lcm8) - Awaiting keypair
2020-09-11 00:35:06.994062: [NET] peer(CHzf…1U30) - Awaiting keypair
2020-09-11 00:35:12.160213: [NET] peer(CHzf…1U30) - Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-11 00:35:12.160762: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 00:35:12.168432: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host
2020-09-11 00:35:12.232323: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-11 00:35:12.232701: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
[a few more]
2020-09-11 00:55:13.793554: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host
2020-09-11 00:55:13.823302: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 19)
2020-09-11 00:55:13.823679: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 00:55:13.830352: [NET] peer(YhQB…Lcm8) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sendto: no route to host
2020-09-11 00:55:18.961279: [NET] peer(CHzf…1U30) - Handshake did not complete after 5 seconds, retrying (try 20)
2020-09-11 00:55:18.961761: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 00:55:18.969481: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host
2020-09-11 00:55:19.013912: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 20)
2020-09-11 00:55:19.014284: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 00:55:19.021406: [NET] peer(YhQB…Lcm8) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sendto: no route to host
2020-09-11 00:55:24.071094: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 20 attempts, giving up
2020-09-11 00:55:24.072152: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 00:55:24.079339: [NET] peer(YhQB…Lcm8) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sendto: no route to host
2020-09-11 00:55:24.079992: [NET] peer(YhQB…Lcm8) - Awaiting keypair
2020-09-11 00:55:24.083542: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 00:55:24.088956: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host
2020-09-11 00:55:29.187685: [NET] peer(CHzf…1U30) - Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-11 00:55:29.188175: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 00:55:29.195769: [NET] peer(CHzf…1U30) - Failed to send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sendto: no route to host

Log for when I woke up in the morning:
2020-09-11 07:30:33.963812: [NET] Network change detected with unsatisfied route and interface order [utun2, en0]
2020-09-11 07:30:33.964685: [NET] DNS64: mapped redacted_peer_1 to itself.
2020-09-11 07:30:33.970653: [NET] DNS64: mapped redacted_peer_2 to itself.
2020-09-11 07:30:33.971174: [NET] DNS64: mapped wg_endpoint to itself.
2020-09-11 07:30:33.972489: [NET] DNS64: mapped wg_endpoint to itself.
2020-09-11 07:30:33.974145: [NET] UAPI: Transition to peer configuration
2020-09-11 07:30:33.976164: [NET] peer(YhQB…Lcm8) - UAPI: Updating endpoint
2020-09-11 07:30:33.978041: [NET] peer(CHzf…1U30) - UAPI: Updating endpoint
2020-09-11 07:30:33.978884: [NET] peer(gk0t…AyAc) - UAPI: Updating endpoint
2020-09-11 07:30:33.981027: [NET] peer(xmkD…IMho) - UAPI: Updating endpoint
2020-09-11 07:30:33.983182: [NET] Routine: receive incoming IPv4 - stopped
2020-09-11 07:30:33.985043: [NET] Routine: receive incoming IPv6 - stopped
2020-09-11 07:30:33.987112: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 07:30:33.989163: [NET] Routine: receive incoming IPv6 - started
2020-09-11 07:30:33.991036: [NET] Routine: receive incoming IPv4 - started
2020-09-11 07:30:33.993164: [NET] UDP bind has been updated
2020-09-11 07:30:34.522914: [NET] Network change detected with satisfied route and interface order [en0, utun2]
2020-09-11 07:30:34.543799: [NET] DNS64: mapped redacted_peer_1 to itself.
2020-09-11 07:30:34.546818: [NET] DNS64: mapped redacted_peer_2 to itself.
2020-09-11 07:30:34.547362: [NET] DNS64: mapped wg_endpoint to itself.
2020-09-11 07:30:34.548670: [NET] DNS64: mapped wg_endpoint to itself.
2020-09-11 07:30:34.550471: [NET] UAPI: Transition to peer configuration
2020-09-11 07:30:34.552311: [NET] peer(YhQB…Lcm8) - UAPI: Updating endpoint
2020-09-11 07:30:34.555128: [NET] peer(CHzf…1U30) - UAPI: Updating endpoint
2020-09-11 07:30:34.555231: [NET] peer(gk0t…AyAc) - UAPI: Updating endpoint
2020-09-11 07:30:34.557314: [NET] peer(xmkD…IMho) - UAPI: Updating endpoint
2020-09-11 07:30:34.559804: [NET] Routine: receive incoming IPv6 - stopped
2020-09-11 07:30:34.561226: [NET] Routine: receive incoming IPv4 - stopped
2020-09-11 07:30:34.563905: [NET] Routine: receive incoming IPv6 - started
2020-09-11 07:30:34.565256: [NET] Routine: receive incoming IPv4 - started
2020-09-11 07:30:34.567279: [NET] UDP bind has been updated
2020-09-11 07:30:37.309301: [APP] App version: 0.0.20200127 (17); Go backend version: 0.0.20200121
2020-09-11 07:30:39.013248: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-11 07:30:39.013410: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 07:32:00.302471: [NET] peer(YhQB…Lcm8) - Removing all keys, since we haven't received a new one in 540 seconds
2020-09-11 07:32:00.303803: [NET] peer(YhQB…Lcm8) - Handshake did not complete after 5 seconds, retrying (try 3)
2020-09-11 07:32:00.304892: [NET] Received invalid response message from redacted_peer_1:44455
2020-09-11 07:32:00.305435: [NET] peer(YhQB…Lcm8) - Sending handshake initiation
2020-09-11 07:32:00.308002: [NET] peer(YhQB…Lcm8) - Awaiting keypair
2020-09-11 07:32:00.309891: [NET] peer(CHzf…1U30) - Handshake did not complete after 5 seconds, retrying (try 14)
2020-09-11 07:32:00.311963: [NET] peer(CHzf…1U30) - Sending handshake initiation
2020-09-11 07:32:00.372409: [NET] peer(YhQB…Lcm8) - Received handshake response
2020-09-11 07:32:00.372697: [NET] peer(YhQB…Lcm8) - Obtained awaited keypair
2020-09-11 07:32:00.529186: [NET] peer(CHzf…1U30) - Received handshake response


I normally try to toggle wireguard connection but it seems to hang so I try to turn off/on wifi but
it appears that after about 1:30 min it fixes itself - this time I just let it alone (I was actually looking at the logs)

Would there anything I can do on my end or is a code update in the App required?

Thank you.



In reply to:
---

Alexander Burke alex at alexburke.ca
Thu Aug 27 10:29:10 CEST 2020

I can’t speak for the Mac side, but I’ve been seeing the same on iOS for months now.

>/El 23 ag 2020, a les 20:34, Laura Smith <n5d9xq3ti233xiyif2vp at 
protonmail.ch <https://lists.zx2c4.com/mailman/listinfo/wireguard>> va 
escriure: />//>/Hi, />//>/These aren't show-stoppers per-se, but it would be nice to see them 
fixed and new clients pushed out via the App Store: />//>/(1) MacOS (10.15.6 but also observed on 10.15.5, not tested on anything 
older) />//>/- Start with WG client in an operational state />/- Disconnect network (e.g. if on WiFI, turn off the WiFi in the menu bar) />/- Sleep the machine />/- Wait- Wake the machine />/- Turn on Wifi />/- Note that WG client fails to re-establish connectivity (shows 
connected, but no traffic flows until you deactivate/reactivate WG) /

