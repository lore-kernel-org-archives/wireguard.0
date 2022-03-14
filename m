Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1A6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:34:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f5a306a2;
	Mon, 21 Mar 2022 19:34:49 +0000 (UTC)
Received: from mxout23.cac.washington.edu (mxout23.cac.washington.edu
 [140.142.32.140])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 87b48adf
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Mar 2022 17:18:16 +0000 (UTC)
Received: from smtp.washington.edu (smtp.washington.edu [140.142.234.157])
 by mxout23.cac.washington.edu (8.14.4+UW20.07/8.14.4+UW19.10) with ESMTP id
 22EHGT4d011739
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 10:16:30 -0700
X-Auth-Received: from mail.ipd.uw.edu (mail.ipd.uw.edu [128.95.160.136])
 (authenticated authid=ipdit)
 by smtp.washington.edu (8.16.1+UW21.10/8.14.4+UW19.10) with ESMTPSA id
 22EHGTl2014866
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 10:16:29 -0700
X-UW-Orig-Sender: ipdit@smtp.washington.edu
Received: from [192.168.2.129] (unknown [128.95.160.246])
 (Authenticated sender: lugo)
 by mail.ipd.uw.edu (Postfix) with ESMTPSA id 3500884904
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 10:16:29 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Luki Goldschmidt <lugo@uw.edu>
Subject: Performance on 10G / 1500 MTU link
Message-ID: <506c5c38-8451-7982-f2fe-d9a489e71752@ipd.uw.edu>
Date: Mon, 14 Mar 2022 10:16:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2022.3.14.170619, AntiVirus-Engine: 5.89.0,
 AntiVirus-Data: 2022.2.25.5890002
X-PMX-Server: mxout23.cac.washington.edu
X-Uwash-Spam: Gauge=IIIIIIII, Probability=8%, Report=
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0,
 BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0,
 BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, DATE_TZ_NA 0, FROM_EDU_TLD 0,
 NO_CTA_FOUND 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_FOUND 0,
 NO_URI_HTTPS 0, SENDER_NO_AUTH 0, __BODY_NO_MAILTO 0, __CT 0, __CTE 0,
 __CT_TEXT_PLAIN 0, __FRAUD_PARTNERSHIP 0, __FROM_DOMAIN_NOT_IN_BODY 0,
 __FROM_NAME_NOT_IN_ADDR 0, __FROM_NAME_NOT_IN_BODY 0, __HAS_FROM 0,
 __HAS_MSGID 0, __HEADER_ORDER_FROM 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0,
 __MIME_TEXT_P1 0, __MIME_VERSION 0, __MOZILLA_USER_AGENT 0,
 __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_STRUCTURE_1 0, __SANE_MSGID 0,
 __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_MAILTO 0,
 __USER_AGENT 0
X-Mailman-Approved-At: Mon, 21 Mar 2022 19:34:47 +0000
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

Has anyone succeeded in saturating a 10Gb link with a MTU 1500 using
WireGuard?

On a LAN with 10Gb or 40Gb links, I'm getting 5-6 Gbps throughput with
WireGuard (tunnel MTU 1420). Without WireGuard, I have no problem
pushing 9.8 and 35 Gbps, respectively. When I increase the tunnel MTU to
8920, I can easily push 9.3 Gbps through Wireguard.

I'm testing testing with iperf using a single or multiple parallel
transfers. I tried kernels 5.14 and 5.15, and a range of CPUs like Intel
E5-2680v4, E3-1270v6, Xeon Silver 4114. The bottleneck seems to linked
to packets per second.

I can't use jumbo frames over the WAN connection so MTU 1500 (link) will
have to be it, but I'd love to get the most out of the 10 Gbps
connection. The WAN link latency is only ~1 ms so it ought to be doable.

Any tuning tips are appreciated.

Luki

